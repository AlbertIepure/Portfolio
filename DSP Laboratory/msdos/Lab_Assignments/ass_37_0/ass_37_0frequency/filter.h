float fir_filter(short input_val);
#define N 23 // number of filter coefficients;
short x[N]={0}; //delay line;
float h[N]={1, 2, 6, 11, 19, 29, 42, 56, 69, 80, 87, 90, 87, 80, 69, 56, 42, 29, 19, 11, 6, 2, 1}; //filter coefficients;
