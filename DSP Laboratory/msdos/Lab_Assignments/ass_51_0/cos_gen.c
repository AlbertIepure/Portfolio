#include <math.h>
#include <stdio.h>
#include "cos_gen.h"
#define PI 3.14159265359

//float out[2] = {0,0};

void cos_gen()
{	
//	short gain=10;
//	float output;
	comm_poll();           //init DSK, codec, McBSP

	out[0] = 1000;
	output_left_sample(gain*out[0]);
	out[1] = out[0]*cos(2*PI*f/96000);
	output_left_sample(gain*out[1]);
	while (1) 
	{
		output = 2*cos(2*PI*f/96000)*out[1] - out[0];
		output_left_sample((short)output*gain);
		out[0] = out[1];
		out[1] = output;
		out_buffer[bufindex++] = output;
		if (bufindex>=BUFFERLENGTH) bufindex = 0;
	}
			
}


