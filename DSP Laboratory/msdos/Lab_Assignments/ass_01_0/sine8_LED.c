#include "sine8_LED.h"

void sine8_LED() 
{
	comm_poll();           //init DSK, codec, McBSP
	DSK6416_LED_init();    //init LED from BSL
   	DSK6416_DIP_init();    //init DIP from BSL
   
  	while(1) 				              
  	{  	
   		if(DSK6416_DIP_get(0)==0)               //if DIP #0 ON
      		{
			DSK6416_LED_on();
 			output_left_sample(sine_table[loopindex++]*gain);   //output
			if (loopindex>=LOOPLENGTH) loopindex = 0;           //reset index
      		}
		else DSK6416_LED_off(0);         //else turn LED #0 OFF
	}                                        //end of while(1) 
}

