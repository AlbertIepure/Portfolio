#include "input.h"

interrupt void c_int11()
{	
	short out_sample;
	short input;

	input = input_left_sample();
	out_sample = input*gain;
	output_left_sample(out_sample);               //output sample value

	outputbuffer[outputbuffindex++] = out_sample;       //store in buffer
	inputbuffer[inputbuffindex++] = input;

	if (outputbuffindex >= BUFFERLENGTH) outputbuffindex = 0;           //check end buffer
	if (inputbuffindex >= BUFFERLENGTH) inputbuffindex = 0;


	return;

}
