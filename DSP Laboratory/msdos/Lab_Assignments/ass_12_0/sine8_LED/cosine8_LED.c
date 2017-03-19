#include "cosine8_LED.h"

void cosine8_LED() 
{
	short loop=0;
	comm_poll();           //init DSK, codec, McBSP
	DSK6416_LED_init();    //init LED from BSL
   	DSK6416_DIP_init();    //init DIP from BSL
	
	   
  	while(1) 				              
  	{  	
   		if(DSK6416_DIP_get(3)==0)               //if DIP #3 ON
      		{
			DSK6416_LED_on(3);
			while (loop<10000)
			{
 			output_left_sample(cosine_table[loopindex++]*gain);   //output
			if (loopindex>=LOOPLENGTH) 
				{
				loopindex = 0;           //reset index
				loop++;
				}
      		}
			}
		else DSK6416_LED_off(3);         //else turn LED #3 OFF
	}                                        //end of while(1) 
}

