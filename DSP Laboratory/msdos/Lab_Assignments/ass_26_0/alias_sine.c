#include "alias_sine.h"
#include "filter.h"

interrupt void c_int11()              //interrupt service routine
{
	
	short lpf;
	
	output_buffer = cos_table_zeros6[loopindex++]*gain;
	lpf=(short)low_pass_filter(output_buffer);
    output_left_sample(lpf);
	
    out_buffer[bufindex++] = lpf ;       //store in buffer
	if (loopindex >= LOOPLENGTH) loopindex = 0;           //check end table
	if (bufindex >= BUFFERLENGTH) bufindex = 0;           //check end buffer
	return;
}

float low_pass_filter(short input_val) // define function prototype in corresponding header file
{
  short i;
  float yn = 0.0;

  x[0] = input_val; //get new input into delay line
  for (i=0 ; i<N ; i++) //calculate filter output, N are the number of fir filter coefficients
    yn += h[i]*x[i];
  for (i=(N-1) ; i>0 ; i--) //shuffle delay line contents
    x[i] = x[i-1]; 

return yn;
}
