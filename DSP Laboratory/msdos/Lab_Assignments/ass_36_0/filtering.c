#include "filter.h"
#include "counters.h"

interrupt void c_int11()              //interrupt service routine
{
	short impulse[256],i;
	
	impulse[0] = 100;
	for (i=1; i<256; i++) impulse[i] = 0;

	//input_sample = impulse[bufindex]; 
	
	output[0] = impulse[0];
	out_buffer[0] = output[0];
	 
	output[1] = impulse[1] + 1.34*output[0];
	out_buffer[1] = output[1];

	for(bufindex=2; bufindex<BUFFERLENGTH; bufindex++)
	{
		output[bufindex] = impulse[bufindex] - impulse[bufindex-2] + 1.34*output[bufindex-1] - 0.9025*output[bufindex-2];
		out_buffer[bufindex] = output[bufindex];
	}     
	return;
}

