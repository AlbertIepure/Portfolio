//dotp4.c dot product of two vectors 
#include "DSK6416_AIC23.h"	        //codec support
Uint32 fs=DSK6416_AIC23_FREQ_8KHZ;	//set sampling rate
#define DSK6416_AIC23_INPUT_MIC 0x0015
#define DSK6416_AIC23_INPUT_LINE 0x0011
Uint16 inputsource=DSK6416_AIC23_INPUT_MIC; // select input

#include <stdio.h>              //for printf
#define count 4               //# of data in each array
short x[count] = {1,2,3,4};	    //declaration of 1st array
short y[count] = {0,2,4,6};     //declaration of 2nd array
float result = 0;              //result sum of products
