//sine8_LED.c  sine generation with DIP switch control

#include "dsk6416_aic23.h"  	       //codec support
Uint32 fs = DSK6416_AIC23_FREQ_8KHZ;   //set sampling rate
#define DSK6416_AIC23_INPUT_MIC 0x0015
#define DSK6416_AIC23_INPUT_LINE 0x0011
Uint16 inputsource=DSK6416_AIC23_INPUT_MIC;//select input
