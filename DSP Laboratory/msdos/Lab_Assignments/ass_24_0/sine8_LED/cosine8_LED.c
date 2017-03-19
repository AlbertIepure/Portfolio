#include "cosine8_LED.h"

void cosine8_LED() 
{
	comm_poll();           //init DSK, codec, McBSP
	DSK6416_LED_init();    //init LED from BSL
   	DSK6416_DIP_init();    //init DIP from BSL
	
	   
  	while(1) 				              
  	{  	
   		if(DSK6416_DIP_get(0)==0 && DSK6416_DIP_get(1)==1 && DSK6416_DIP_get(2)==1 && DSK6416_DIP_get(3)==1)               //if DIP #1 ON and DIP #2 and DIP # 3 are OFF
      		{
			DSK6416_LED_on(0);
			output_left_sample(cosine_table[loopindex++]*gain);   //output
			if (loopindex>=LOOPLENGTH) 
				loopindex = 0;           //reset index
      		}   
      		   		
		if(DSK6416_DIP_get(0)==0 && DSK6416_DIP_get(1)==0 && DSK6416_DIP_get(2)==1 && DSK6416_DIP_get(3)==1)               //if DIP #1 ON and DIP #2 and DIP # 3 are OFF
      		{
			DSK6416_LED_on(1);
			output_left_sample(cosine_table[loopindex++]*gain);   //output
			loopindex=loopindex+1;
			if (loopindex>=LOOPLENGTH) 
				loopindex = 0;           //reset index
      		}	

		if(DSK6416_DIP_get(0)==0 && DSK6416_DIP_get(1)==0 && DSK6416_DIP_get(2)==0 && DSK6416_DIP_get(3)==1)               //if DIP #1 ON and DIP #2 and DIP # 3 are OFF
      		{
			DSK6416_LED_on(2);
			output_left_sample(cosine_table[loopindex++]*gain);   //output
			loopindex=loopindex+2;
			if (loopindex>=LOOPLENGTH) 
				loopindex = 0;           //reset index
      		}	

		if(DSK6416_DIP_get(0)==0 && DSK6416_DIP_get(1)==0 && DSK6416_DIP_get(2)==0 && DSK6416_DIP_get(3)==0)               //if DIP #1 ON and DIP #2 and DIP # 3 are OFF
      		{
			DSK6416_LED_on(13);
			output_left_sample(cosine_table[loopindex++]*gain);   //output
			loopindex=loopindex+3;
			if (loopindex>=LOOPLENGTH) 
				loopindex = 0;           //reset index
      		}	
		else DSK6416_LED_off(3);         //else turn LED #3 OFF
	}                                        //end of while(1) 
}

