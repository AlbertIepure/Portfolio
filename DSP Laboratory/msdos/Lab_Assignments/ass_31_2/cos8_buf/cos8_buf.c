#include "cos8_buf.h"

interrupt void c_int11()              //interrupt service routine
{
	int outputsample;
	
	input_array[bufindex1] = cos_table[loopindex]*gain;       //store in buffer
	
	output_array[2*bufindex1] = input_array[bufindex1];
	output_array[2*bufindex1+1] = 0;

	outputsample = output_array[bufindex_output++];
	output_left_sample((short)outputsample);
	//out_buffer[bufindex2++] = output_array[2*bufindex1];
	
	//outputsample = output_array[2*bufindex1+1];
	//output_left_sample((short)outputsample);
	//out_buffer[bufindex2++] = output_array[2*bufindex1+1];

	//output_left_sample(input_array[bufindex1]);
//	bufindex2++;
	bufindex1++;
	loopindex++; 
	   
    if (loopindex >= LOOPLENGTH) loopindex = 0;           //check end table
	if (bufindex1 >= BUFFERLENGTH1) bufindex1 = 0;           //check end buffer
	if (bufindex_output >= BUFFERLENGTH2) bufindex_output = 0;
	
	return;
}

