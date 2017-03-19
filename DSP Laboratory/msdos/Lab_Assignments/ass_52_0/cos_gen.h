#define BUFFERLENGTH 512
void cos_gen();
float iir_filter(short, short);

float f = 2700, omega;
float out_sample, out_buffer[BUFFERLENGTH];
short bufindex = 0;
