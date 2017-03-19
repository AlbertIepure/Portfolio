float low_pass_filter(short input_val);
#define N 9
float x[N]; //filter delay line
float h[N]={0.0581, -0.0275,-0.1060,0.2917,0.6196,0.2917, -0.1060,-0.0275,0.0581};
