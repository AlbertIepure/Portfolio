float fir_filter(short input_val);
#define N 5 // number of filter coefficients;
short x[N]={0,0,0,0,0}; //delay line;
float h[N]={0.25, 0.5, 1, 0.5, 0.25}; //filter coefficients;
float output[256];