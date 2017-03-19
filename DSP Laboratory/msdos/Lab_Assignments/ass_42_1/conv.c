#include <stdlib.h>
#include <stdio.h>
#include "conv.h"

interrupt void c_int11()
{
	int i,j,segments, L;
	float x_re[M]={0}, x_im[M]={0}, output_re[M+K-1]={0}, output_im[M+K-1]={0}; 	  
	float filter_re[N] = {0}, filter_im[N] = {0}, partial_input_re[N] ={0}, partial_input_im[N] ={0};
	float partial_output_freq_domain_re[N]={0}, partial_output_freq_domain_im[N]={0};
	
	L = N-K+1;	//length of partial input

	if (M%L == 0) segments = M / L;
	else segments = M / L + 1;
	
	for(i=0;i < K;i++)  // Filter coefficients
	{
			filter_re[i]=i;
			filter_im[i]=0;
	}

	fft(filter_re,filter_im,N); // FFT of filter

	for (i = 0; i < M;i++)  // Filling of the table where the fft will be applied
    {
        x_re[i] = i%64;
		x_im[i] = 0;
    }
	
	i=0;
	while(i<segments)
	{
		for (j=0;j<L;j++) 
		{
			if (( j+i*L < M)) 
			{
			partial_input_re[j] = x_re[j+i*L]; //copy the input values to the partial_input array if the end of the input sequence hasn't been reached
			partial_input_im[j] = x_im[j+i*L];
			}
			else
				{
				partial_input_re[j]=0; //fill the last segment with zeroes if M%L!=0
				partial_input_im[j]=0;
				}
		}
		
		for (j=L;j<N;j++)
		{
			partial_input_re[j] = 0;//Append zeroes after each segment until length of the new segment is N
			partial_input_im[j] = 0;

		}
		
		fft(partial_input_re,partial_input_im,N); //FFT transform of the partial_input array
		
		//Product of the FFT of the partial_input with the FFT of the filter

		for (j=0;j<N;j++)
		{
			partial_output_freq_domain_re[j] = partial_input_re[j] * filter_re[j] - partial_input_im[j] * filter_im[j];
			partial_output_freq_domain_im[j] = partial_input_re[j] * filter_im[j] + partial_input_im[j] * filter_re[j];
		}

		//Perform the IFFT of the product
		ifft(partial_output_freq_domain_re,partial_output_freq_domain_im,N);		

		//Perform the overlap and add
		for (j=0;j<N;j++) 
		{
			
			if((j+(i*L)) < (M+K-1)) 
			{
			output_re[j+i*L] = partial_output_freq_domain_re[j] + output_re[j+i*L]; //Filling partial_input_re with the partial values
			output_im[j+i*L] = partial_output_freq_domain_im[j] + output_im[j+i*L];
			}
		}
	i++;
	}
	
	while(1);
}
