#include "counters.h"

void signal_build() 
{
	comm_poll();           //init DSK, codec, McBSP-	

	
	while(1)
	{
	short inputsample, outputsample;
	
	inputsample = input_sample();
	input_array[bufindex] = inputsample;
			
	if (bufindex>8000) 
	output_array[bufindex] = input_array[bufindex] + 0.5*input_array[bufindex-8000];
	else output_array[bufindex]=input_array[bufindex];

	outputsample = output_array[bufindex];
	output_left_sample((short)outputsample);

	bufindex++;

	if (bufindex >= BUFFERLENGTH) bufindex = 0;           //check end buffer
	}
}
