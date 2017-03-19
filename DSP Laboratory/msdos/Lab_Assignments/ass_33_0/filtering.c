#include "filter.h"
#include "counters.h"

interrupt void c_int11()              //interrupt service routine
{
	short impulse[256];
	short input_sample,i;

	impulse[0] = 100;
	for (i=1; i<256; i++) impulse[i] = 0;

	//input_sample = impulse[bufindex]; 
	
	for(bufindex=0; bufindex<BUFFERLENGTH; bufindex++)
	{
		input_sample = impulse[bufindex]; 
		out_buffer[bufindex] = (short)fir_filter(input_sample);
	}
		//out_buffer[bufindex++] = (short)fir_filter(input_sample);
	//out_sample = out_buffer[bufindex];
  	//output_left_sample(out_sample);		 //oscilloscope 
	//if (bufindex >= BUFFERLENGTH) bufindex = 0;           //check end buffer           
	return;
}

float fir_filter(short input_val) // define function prototype in corresponding header file
{
  short i;
  float yn = 0.0 ;

  x[0] = input_val; //get new input into delay line
  for (i=0 ; i<N ; i++) //calculate filter output, N are the number of fir filter coefficients
    yn += h[i]*x[i];
  for (i=(N-1) ; i>0 ; i--) //shuffle delay line contents
    x[i] = x[i-1]; 

return yn;
}