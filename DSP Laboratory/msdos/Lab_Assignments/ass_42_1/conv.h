#include<stdio.h>
#include<stdlib.h>

#define M 1000 //length of input series
#define N 64   //FFT length
#define K 10   //filter length
 
typedef struct Complexe Complexe;
void ifft(float array_to_transform_inv_re[],float array_to_transform_inv_im[],int length_fft); 
void fft(float array_to_transform_re[],float array_to_transform_im[],int length_fft); 



struct Complexe
{
    float re ;
    float im ;

};

