#define F_CPU 1000000UL  /* 1 MHz Internal Oscillator */


#include <avr/io.h>
#include <util/delay.h>
#include <math.h>

//51 valori pentru fiecare temperatura intreaga, incepand de la 0 grade pana la 50 grade
//valorile intermediare vor fi determinate ca fiind progresii liniare dintre valori cunoscute
#define lookupTableSize 51
float lookupTable[lookupTableSize] ={4.667, 4.678, 4.633, 4.614, 4.594, 4.58, 4.56, 4.536, 4.516, 4.497, 4.472, 4.448, 4.423, 4.399, 4.3, 4.375, 4.321, 4.291, 4.262, 4.233, 4.204, 4.174, 4.14, 4.111, 4.077, 4.042, 4.008, 3.969, 3.935, 3.901, 3.862, 3.823, 3.784, 3.745, 3.706, 3.666, 3.627, 3.588, 3.549, 3.505, 3.466, 3.422, 3.383, 3.339, 3.3, 3.256, 3.212, 3.173, 3.129, 3.085, 3.046};
	
int digit[4];//reprezentarea de la dreapta la stanga a digitilor (digit[0] e digitul din dreapta)

//semnaturile functiilor
int get_nr(int nr);
void delay_ms(uint16_t ms);
void ADC_init(void);
unsigned int ADC_read(unsigned char ch);
void update_digits();
void setDigits(float myValue);
float to_temp(float val);

// functia main
int main(void)
{
	
	ADC_init();//init port ADC as dc converter
	DDRC = 0xFF;               
	DDRD =  0b11011110; 
	           
	PORTD = 0b00000000;  
	
	//usart_init();
	PORTC = 0xFF;

    while (1)
    {
		float read_value = (float)ADC_read(0) * 5 / 1024;
		setDigits( to_temp(read_value)  );
		update_digits();
		//delay_ms(50);///looks like this is 100ms..weird
    }
	return 1;  
}

//initializarea convertorului ADC
void ADC_init()
{
	 ADCSRA = 0X00;		 // Clear previous ADC results and status flags
	 ADCSRA |= 1<<ADPS2; // we use a 32 multiplier
	 
	 //writing 0 is right adjusted (in ALDAR)
	 //writing 1 is left adjusted (in ALDAR)
	 ADMUX |= 0<<ADLAR;  //we want right adjusted conversion
	 ADMUX |= 1<<REFS0;  //set reference voltage to the chip's VCC
	 //ADCSRA |= 1<<ADIE;  //ADC Interrupt Enable
	 ADCSRA |= 1<<ADEN;  //enable ADC 
}

//citirea din ADC
unsigned int ADC_read(unsigned char ch)
{
	ch= ch & 0b00000111;		// channel must be b/w 0 to 7
	ADMUX |= ch;				// selecting channel
 
	ADCSRA|=(1<<ADSC);			// start conversion
	while(!(ADCSRA & (1<<ADIF)));	// waiting for ADIF, conversion complete
	ADCSRA|=(1<<ADIF);			// clearing of ADIF, it is done by writing 1 to it
	uint8_t theLowADC = ADCL	;
	uint16_t theTenBitResults = ADCH<<8 | theLowADC;
	return (theTenBitResults);
}

//converteste tensiunea in celsius
float to_temp(float findVal){
	int i, memPos = -1, offset;
 	float temp,decimalTemp;
	//too much precision
	int intval = (int)(findVal*1000);
	findVal =  (float)(intval)/1000;
	
	
	//find nearest round temperature
	for(i=0; i< lookupTableSize - 1 ; i++){
		if( lookupTable[i] >= findVal && findVal > lookupTable[i+1] ){
			memPos = i;
			break;
		}
	}
	
	if( memPos == -1 ){//did not find a temperature
		return 99;
	}
	
	//clau's way
	temp =  memPos;// segnificant bits
	decimalTemp = (findVal- lookupTable[memPos])/(lookupTable[memPos+1]-lookupTable[memPos]);
	if( decimalTemp > 0.1 ){
		temp += decimalTemp;	
	}
	
	return temp;
}

/* function for long delay */
void delay_ms(uint16_t ms) {
        while ( ms )
        {
            _delay_ms(1);
            ms--;
        }
}

void setDigits(float myValue)
{
	int val  = (int)( myValue*10 ) % 1000;//2 digits and one digit after the comma
	digit[2] = val/100;
	digit[1] = (val % 100)/10;
	digit[0] = val % 10; 
	digit[3] = 1;//display decimal point
}

void update_digits(){
	
	//valorile astea binare sunt cele de pe portul D
	int displayStg = 0b00011000;
	int displayMij = 0b00010100;
	int displayDrt = 0b00001100;
	int delay = 15;
	
	//PORTC = 0xff;	//reset the port to the "don't display anything state"
	PORTD = displayDrt;
	PORTC = ~get_nr(digit[0]);
	PORTC |= 1;	//don't display the dot
	delay_ms(delay);
	
	PORTD = displayMij;
	PORTC = ~get_nr(digit[1]);
	if(digit[3]==1){PORTC&=~1;}
	delay_ms(delay);
	
	
	PORTD = displayStg;
	PORTC = ~get_nr(digit[2]);
	PORTC |= 1;	//don't display the dot

	delay_ms(delay);

}

int get_nr(int nr){
	  if(nr<10){
		switch (nr){
			case 0:
				return  0b11101110;
			case 1:
				return  0b00101000;
			case 2:
				return  0b10110110;
			case 3:
				return  0b10111100;
			case 4:
				return  0b01111000;
			case 5:
				return  0b11011100;
			case 6:
				return  0b11011110;
			case 7:
				return  0b11101000;
			case 8:
				return  0b11111110;
			case 9:
				return  0b11111100;		 
		}
	}		
	return 0;	
}