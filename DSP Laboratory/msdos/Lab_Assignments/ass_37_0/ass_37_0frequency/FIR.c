#include "filter.h"
#include "counters.h"
void signal_build() 
{
	signal[0]=1; // Dirác pulse initialization;
    for (i=1 ; i<SIGNALLENGTH ; i++) signal[i]=0; // Signal creation;
	for (i=0 ; i<BUFFERLENGTH ; i++) out_buffer[i] = (short)fir_filter(signal[i]);
	comm_poll();           //init DSK, codec, McBSP-			
	while(1);
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
