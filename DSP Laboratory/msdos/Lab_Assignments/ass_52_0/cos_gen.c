#include <math.h>
#include <stdio.h>
#include "cos_gen.h"
#define N 2
#define PI 3.14159265359
#define N_HARMONICS 16

float delay_line[N_HARMONICS][2] = {0};
float prev_out[N_HARMONICS][2] = {0};
float h[N_HARMONICS][2];
float g[N_HARMONICS][2];

void cos_gen()
{	
	short i,j;
	comm_poll();           //init DSK, codec, McBSP

	for (i=1; i<=N_HARMONICS; i++) {
		omega = 2*PI*f*i/96000;
		h[i-1][0] = 1;
		h[i-1][1] = -cos(omega);
		g[i-1][0] = 2*cos(omega);
		g[i-1][1] = -1;
	}

	for (i=0;i<N_HARMONICS;i++)
		for (j=0;j<2;j++) 
		{
			delay_line[i][j]=0;
			prev_out[i][j]=0;
		}

	out_sample = 100;
	for (i=0; i<N_HARMONICS; i++) 
		out_sample += -2*iir_filter(100,i);
	out_buffer[bufindex++] = out_sample;
	output_left_sample((short)out_sample);
	while (1) {
		out_sample = 100;
		for (i=0; i<N_HARMONICS; i++)
			out_sample += -2*iir_filter(0,i);
		out_buffer[bufindex++] = out_sample;
		output_left_sample((short)out_sample);
		if (bufindex>=BUFFERLENGTH)
			bufindex = 0;
	}
			
}

float iir_filter(short in, short no)
{
	short i;
	float out = 0;

	delay_line[no][0] = in;//get new input into delay line
	for (i=0; i<2; i++)
		out += h[no][i]*delay_line[no][i];//calculate filter output
	for (i=0; i<2; i++)
		out += g[no][i]*prev_out[no][i];
	for (i=N-1; i>0; i--)//shuffle delay line contents
		delay_line[no][i] = delay_line[no][i-1];

	prev_out[no][1] = prev_out[no][0];
	prev_out[no][0] = out;

	return out;
}
