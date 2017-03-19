#include "parameter.h"
#include "DITfft.h"
#include <stdio.h>              //for printf
#include <math.h>


int main()
{   
	int  stage, nrStages, temp, ct;
	float temp1, temp2, temp3, temp4;		
	int  i,j,decomp, sPd,k;
	Complex a[N], b[N];
	short bit, idx1, idx2, idx4;

	for(k=0; k<N; k++)
	{
		x[k].real = k+1;
		x[k].imag = 0;
	}

	// Compute number of stages
	nrStages = log10(N) / log10(2);

	// Initialize results array & bit scrambling
	for (i=0;i<N;i++)
	{	
		// initialization of scrambled index
		temp = 0;

		// scrambled representation
		for(j=0;j<nrStages;j++)
		{
			bit = ((i & (1 << j)) >> j);
			temp += pow(2,nrStages-j-1) * bit;

		}
		results[i].real = x[temp].real;
		results[i].imag = x[temp].imag;
	}


	// Execute stages
	for (stage=1;stage<=nrStages;stage++)				
	{ 			
			
		ct = pow(2,stage-1);

		// samples per decomposition
		sPd = pow(2,stage);

		// for each stage, execute [stage] decompositions
		for(decomp=1; decomp<=N/pow(2,stage); decomp++)		        
		{  
			for(j=(decomp-1)*ct; j<=decomp*ct - 1; j++)
			{	

				// indexes
				idx1 = (decomp-1)*ct+j;
				idx2 = decomp*ct+j;
				
				// for each decomposition, calculate outputs a and b
				a[j].real = results[idx1].real + results[idx2].real;
				a[j].imag = results[idx1].imag + results[idx2].imag;
				b[j].real = results[idx1].real - results[idx2].real;
				b[j].imag = results[idx1].imag - results[idx2].imag;	
			
				// store the outputs 
				results[idx1].real = a[j].real;	
				results[idx1].imag = a[j].imag;
				results[idx2].real = b[j].real;	
				results[idx2].imag = b[j].imag;


				// multiply the even outputs with the corresponding twiddle constants
				// complex multiplication
				if(decomp%2==0 && stage!=nrStages)
				{
					// twiddle coefficient indexes
					idx4 = pow(2,stage+1);

					temp1 = results[idx1].real * cos(2*pi*(idx1%sPd)/ idx4) + results[idx1].imag * sin(2*pi*(idx1%sPd)/ idx4);
					temp2 =-results[idx1].real * sin(2*pi*(idx1%sPd)/ idx4) + results[idx1].imag * cos(2*pi*(idx1%sPd)/ idx4);
					temp3 = results[idx2].real * cos(2*pi*(idx2%sPd)/ idx4) + results[idx2].imag * sin(2*pi*(idx2%sPd)/ idx4);
					temp4 =-results[idx2].real * sin(2*pi*(idx2%sPd)/ idx4) + results[idx2].imag * cos(2*pi*(idx2%sPd)/ idx4); 
					
					results[idx1].real = temp1;	
					results[idx1].imag = temp2;
					results[idx2].real = temp3;
					results[idx2].imag = temp4;

				}
			}
		}	
	
	}

	for(i=0;i<N;i++)
	{
		printf("%f %f\n", results[i].real, results[i].imag);
	}

	return 1;
}
