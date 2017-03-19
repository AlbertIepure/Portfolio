/*
 * main.cpp
 *
 *  Created on: 10.02.2015
 *      Author: IepureAl
 */

#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "Rng.h"
#include "Typedefs.h"

# define pi           3.14159265358979323846

/***************************************************************************************
 * Input parameters
 * N - how many numbers to generate; the bigger, the better
 * desired_variance
 * desired_mean
 * create_file: 1 - if you want to create a .txt file with the generated values;
 * 				0 - if you do not want to create a .txt file with the generated values;
 * ************************************************************************************/

int N=250000, desired_variance = 2, desired_mean = 0, create_file = 1;

float ComputeMean(float a[])
{
	float sum = 0;
	for(int i = 0; i < N; i++)
		sum +=  a[i];
	return (sum / N);
}

float ComputeVariance(float a[])
{
	float mean = ComputeMean(a);
	float temp = 0;
	for(int i = 0; i < N; i++)
		temp += (a[i] - mean) * (a[i] - mean);
	return (temp / N);
}

int main()
{
	srand (time(NULL)); // initialize random seed
	Rng myRng(rand()); //in order to generate new random numbers at each run of the program the seed of myRng is a random number

	int j;
	float f[N],n[N],mean,variance,u1,u2;

		for (j=0; j<N; j++)
			/* generate uniform distributed numbers within [0;1). The output of BRandom
			 * is an uint32 number. This is why we divide by 2^32 in order to fall within
			 * the desired interval */
			f[j] = ((float)myRng.BRandom())/((float)4294967296);

		// Box Muller method
		for (j=0; j<N; j=j+2)
		{
			u1 = f[j];
			u2 = f[j+1];
			n[j] = sqrt(-2*log(u1))*cos(2*pi*u2);
			n[j+1] = sqrt(-2*log(u1))*sin(2*pi*u2);
		}
		mean = ComputeMean(n);

		//adjust the mean to zero
		//for (j=0; j<N; j++)
		//	n[j] = n[j] - mean;
		variance = ComputeVariance(n);

		//adjust the variance to the desired value
		for (j=0; j<N; j++)
		{
			// obtain unit variance by dividing the values to the standard deviation, i.e. sqrt(variance)
			//n[j] = n[j] / sqrt(variance);
			// multiply the values which have a standard deviation of 1 by the desired standard deviation
			n[j] = n[j] * sqrt(desired_variance);
		}

		//adjust the mean to the desired value
		for (j=0; j<N; j++)
			n[j] = n[j] + desired_mean;

		// write the values to file if create_file = 1
		if (create_file)
		{
			ofstream myfile ("gaussian_distribution.txt");
			for (j=0; j<N; j++)
				myfile<<n[j]<<"\n";
		}

		// this part can be commented out for speed (it has only check purposes)
		mean = ComputeMean(n);
		variance = ComputeVariance(n);
		cout<<"The mean is:"<<mean<<endl;
		cout<<"The variance is:"<<variance<<endl;

	cout<<"\n";
    return 0;
}
