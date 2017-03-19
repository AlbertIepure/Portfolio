#include <math.h>
#include "dft.h"


void main()

{		
    short c=1,k,n;
	Complex y[N],x[N];
	

	for(k=0; k<N; k++)
	{
		x[k].re = k+1;
		x[k].im = k+1;
	}

	for(k=0; k<N; k++)
		{
		y[k].re = 0;
		y[k].im = 0;
		for(n=0; n<N; n++)
		{
		y[k].re += c*(x[n].re * cos(-2*PI*k*n/N) - x[n].im * sin(-2*PI*k*n/N));
		y[k].im += c*(x[n].re * sin(-2*PI*k*n/N) + x[n].im * cos(-2*PI*k*n/N));
		}
		real_buffer[k] = y[k].re;
		imag_buffer[k] = y[k].im;
		}

                                
}					         //end of main
