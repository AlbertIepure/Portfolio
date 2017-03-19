#include "parameter.h"
#include "DIFfft.h"
#include <stdio.h>              //for printf
#include <math.h>

void convert_int_bin(int in, int max_nb, int *out)
{
	int i,a,length = log(max_nb)/log(2);
	
	a=0;

	for (i=length-1; i>=0; i--)
	{
		if (pow(2,i) <= in)
		{
			out[a] = 1;
			in = in - pow(2,i);
		}
		else
			out[a] = 0;

		a++;
	}
} 

int convert_bin_int(int *in, int max_nb)
{
	int i,out, length = log(max_nb)/log(2);
	
	out=0;

	for (i=length-1; i>=0; i--)
	{
		out = out + in[length-i-1]*pow(2,i);
	}

	return out;
}

void reverse_bits(int *in, int *out, int max_nb)
{
	int i, length = log(max_nb)/log(2);

	for (i=0; i<length; i++)
	{
		out[i]=in[length-i-1];
	}
}

Complex complexAddition(Complex a, Complex b)
{
	Complex c;
	c.re = a.re + b.re;
	c.im = a.im + b.im;

	return c;
} 

Complex complexDiff(Complex a, Complex b)
{
	Complex c;
	c.re = a.re - b.re;
	c.im = a.im - b.im;

	return c;
}


Complex complexMultiplication(Complex a, Complex b)
{
	Complex c;
	c.re = a.re*b.re - a.im*b.im;
	c.im = a.im*b.re + a.re*b.im;
	return c;
}

Complex exp_to_complex(float phase, float ampl)
{
	Complex c;
	c.re = ampl * cos(phase);
	c.im = ampl * sin(phase);
	return c;	
}

int main()
{   
	int  stage, nr_of_stages, i,j,separation,bin[3],bin_rev[3],index;
	Complex a[N/2], b[N/2], x[N];
	short denominator;

	for(i=0; i<10; i++)
	{
		x[i].re = i+1;
		x[i].im = 0;
	}

	for(i=10; i<N; i++)
	{
		x[i].re = 0;
		x[i].im = 0;
	}


	// Compute number of stages
	nr_of_stages = log10(N) / log10(2);

	// Initialize results array
	for (i=0;i<N;i++)
	{	
		results[i] = x[i];
		//results[i].re = x[i].re;
		//results[i].im = x[i].im;
	}

	// Execute stages
	for (stage=1; stage<=nr_of_stages; stage++)				
	{	
		denominator = pow(2,stage);
		// for each stage, execute [stage] separations
		for(separation=1; separation<=pow(2,stage-1); separation++)		        
		{   
			for(j=(separation-1)*N/pow(2,stage-1); j<(2*separation-1)*N/pow(2,stage); j++)
			{	// for each separation, calculate outputs a and b
				
			/*	a[j] = complexAddition(results[j],results[j+N/denominator]);
				b[j] = complexDiff(results[j], results[j+N/denominator]);*/

				a[j].re = results[j].re + results[j+N/denominator].re;
				a[j].im = results[j].im + results[j+N/denominator].im;
				b[j].re = results[j].re - results[j+N/denominator].re;
				b[j].im = results[j].im - results[j+N/denominator].im;	
			
				// store the outputs a 
				
			//	results[j].re = a[j].re;
				results[j].re = a[j].re;	
				results[j].im = a[j].im;			

				// multiply the outputs b with the corresponding twiddle constants
				// complex multiplication

			//	results[j+N/denominator] = complexMultiplication(b[j],exp_to_complex(-2*pi*j/(N/pow(2,stage-1)),1));
				results[j+N/denominator].re = b[j].re*cos(2*pi*j/(N/pow(2,stage-1))) + b[j].im*sin(2*pi*j/(N/pow(2,stage-1)));
				results[j+N/denominator].im =-b[j].re*sin(2*pi*j/(N/pow(2,stage-1))) + b[j].im*cos(2*pi*j/(N/pow(2,stage-1)));								
			}
		}
	
	}

	for (i=0; i<N; i++)
	{
		convert_int_bin(i, N, bin);
		reverse_bits(bin, bin_rev, N);
		index = convert_bin_int(bin_rev, N);
		output[i] = results[index];
	}

}

