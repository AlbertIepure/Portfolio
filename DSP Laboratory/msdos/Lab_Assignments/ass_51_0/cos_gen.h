#define BUFFERLENGTH 512
void cos_gen();

float f = 2700, out[2] = {0,0}, output=0;
float out_sample, out_buffer[BUFFERLENGTH];
short bufindex = 0, gain=1;
