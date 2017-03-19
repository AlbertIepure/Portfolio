#include "math.h"
#define BUFFERLENGTH 256
#define M 8

int bufindex = 0, out_buffer[BUFFERLENGTH];	         	         
short input_buffer[BUFFERLENGTH];
float x[M], y[M];


float combfilter(short input_value) // define function prototype in corresponding header file
{
  short i;
  y[0]=0.0;
  y[0] = y[1] - (1/((double)M))*input_value + (1/((double)M))*x[M-1];
  x[0] = input_value; //get new input into delay line

  for (i=(M-1) ; i>0 ; i--) //shuffle delay line contents
    x[i] = x[i-1]; 
  for (i=(M-1) ; i>0 ; i--) //shuffle delay line contents
	y[i] = y[i-1]; 

return y[0];
}

interrupt void c_int11()              //interrupt service routine
{
	short input, output_comb_filter;

	input = input_left_sample();
	input_buffer[bufindex++] = input;
	output_comb_filter = (short)combfilter(input);
    output_left_sample(output_comb_filter);               //output sample value
    out_buffer[bufindex++] = output_comb_filter;       //store in buffer  */
	if (bufindex >= BUFFERLENGTH) bufindex = 0;           //check end buffer
	return;
}

