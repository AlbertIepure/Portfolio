#include "cos8_buf.h"

interrupt void c_int11()              //interrupt service routine
{
	short out_sample;

	out_sample = cos_table[loopindex++]*gain;
        output_left_sample(out_sample);               //output sample value
        out_buffer[bufindex++] = out_sample;       //store in buffer
	if (loopindex >= LOOPLENGTH) loopindex = 0;           //check end table
	if (bufindex >= BUFFERLENGTH) bufindex = 0;           //check end buffer
	return;
}

