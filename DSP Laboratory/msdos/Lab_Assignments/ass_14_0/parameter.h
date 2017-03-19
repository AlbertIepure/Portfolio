//euclidiannorm.c euclidian norm of a vector 
#include "DSK6416_AIC23.h"	        //codec support
Uint32 fs=DSK6416_AIC23_FREQ_8KHZ;	//set sampling rate
#define DSK6416_AIC23_INPUT_MIC 0x0015
#define DSK6416_AIC23_INPUT_LINE 0x0011
Uint16 inputsource=DSK6416_AIC23_INPUT_MIC; // select input

#include <stdio.h>              //for printf
#include <math.h>				//for sqrt
#define count 20               //# of data in each array
short x[count] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};   //declaration of array
float result = 0;              //result sum of products
