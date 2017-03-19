#include "cos8_buf.h"

interrupt void c_int11()              //interrupt service routine
{
	short outputsample;
	
	input_array[bufindex1++] = cos_table[loopindex++]*gain;       //store in buffer
	input_array[bufindex1] = cos_table[loopindex]*gain;
		
/*	if ((bufindex1)%2==0)
		{
		output_array[bufindex2] = input_array[bufindex1];
		outputsample = input_array[bufindex1];  
		//output_left_sample((short)output_array[bufindex2]);
		bufindex2++;
		}
	else bufindex2=bufindex2;*/ 
	
	output_array[bufindex2] = input_array[bufindex1];
	outputsample = input_array[bufindex1];
	output_left_sample((short)outputsample);

	//output_left_sample(input_array[bufindex1]);
	bufindex1++;
	loopindex++; 
	   
    if (loopindex >= LOOPLENGTH) loopindex = 0;           //check end table
	if (bufindex1 >= BUFFERLENGTH1) bufindex1 = 0;           //check end buffer
	if (bufindex2 >= BUFFERLENGTH2) bufindex2 = 0;
	return;
}

