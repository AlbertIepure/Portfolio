#include "sine8_LED.h"

void sine8_LED() 
{
	comm_poll();           //init DSK, codec, McBSP
	DSK6416_LED_init();    //init LED from BSL
   	DSK6416_DIP_init();    //init DIP from BSL
   
  	while(1) 				              
  	{  	
  		input_array[bufindex] = sine_table[loopindex++]*gain;	
 		if ((bufindex%2)==0){
 			output_array[bufindex2] = input_array[bufindex];
			output_left_sample(output_array[bufindex2]);
			bufindex2++;
		}
		
		bufindex++;
		if (loopindex>=LOOPLENGTH) loopindex = 0;           //reset index
		if (bufindex >= BUFFERLENGTH) bufindex = 0;
		if (bufindex2 >= BUFFERLENGTH/2) bufindex2 = 0;
	}                              //end of while(1) 
}

