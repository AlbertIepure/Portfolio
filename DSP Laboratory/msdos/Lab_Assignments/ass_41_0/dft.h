#define N 32
#define PI 3.14159265359

typedef struct Complex Complex;

struct Complex
{
	float re;
	float im;
};

float imag_buffer[N], real_buffer[N];
