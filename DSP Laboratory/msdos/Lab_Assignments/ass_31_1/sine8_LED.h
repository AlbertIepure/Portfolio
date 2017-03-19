void sine8_LED();
#define LOOPLENGTH 8
#define BUFFERLENGTH 512
short loopindex= 0;         	      //table index
int bufindex = 0;
int bufindex2 = 0;
short gain=10;		              //gain factor	         
short sine_table[LOOPLENGTH]={0,707,1000,707,0,-707,-1000,-707};  //sine values
int out_sample;
int out_buffer[BUFFERLENGTH];
int input_array[BUFFERLENGTH];
int output_array[256];
