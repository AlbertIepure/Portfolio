#define N 32
#define pi 3.14159265358979323846

typedef struct Complex Complex;

struct Complex
{ 
float re; 
float im;
};

Complex results[N], output[N];

Complex complexAddition(Complex a, Complex b);

Complex complexDiff(Complex a, Complex b);

Complex complexMultiplication(Complex a, Complex b);

Complex exp_to_complex(float phase, float ampl);

void convert_int_bin(int in, int max_nb, int *out);

int convert_bin_int(int *in, int max_nb);

void reverseBits(int *in, int *out, int max_nb);
