#include "cos8_buf.h"

interrupt void c_int11()              //interrupt service routine
{
	int out_sample;
	short i;
	out_sample=1000; //corresponding to the 1 in the Fourier series of the Dirac Pulse
		for(i=1; i<=72; i++)
			out_sample += -2*cos_table[(i*loopindex)%LOOPLENGTH];// %LOOPLENGTH assures that we remain within the table;
																// i*loopindex takes for ex from two to two values for the second harmonic
		loopindex++;
       	output_left_sample((short)(out_sample/10));               //output sample value scaled by 10 not to get an overflow and cast to short because that's what the DSP can handle
        out_buffer[bufindex++] = (short)out_sample/10;       //store in buffer divided by 10 to avoid overflow
	if (loopindex >= LOOPLENGTH) loopindex = 0;           //check end table
	if (bufindex >= BUFFERLENGTH) bufindex = 0;           //check end buffer
	return;
}

