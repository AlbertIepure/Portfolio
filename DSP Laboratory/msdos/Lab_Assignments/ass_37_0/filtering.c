#include "filter.h"

interrupt void c_int11()              //interrupt service routine
{
	short input;
	short filtered_sample;
	input = input_sample();
	filtered_sample = (short)(fir_filter(input/100));
  	output_sample(filtered_sample);	
}

float fir_filter(short input_val) // define function prototype in corresponding header file
{
  short i;
  float yn = 0.0 ;

  x[0] = input_val;
  for (i=0 ; i<N ; i++) //calculate filter output, N are the number of fir filter coefficients
    yn += h[i]*x[i];

  for (i=(N-1) ; i>0 ; i--) //shuffle delay line contents
    x[i] = x[i-1]; 

return yn;
}