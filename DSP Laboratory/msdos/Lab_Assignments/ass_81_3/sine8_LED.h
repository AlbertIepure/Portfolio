void sine8_LED();
#define LOOPLENGTH 16
#define BUFFERLENGTH 512
short loopindex= 0;         	      //table index
int bufindex = 0;
int bufindex2 = 0;
short gain=10;		              //gain factor	         
short sine_table[LOOPLENGTH]={0,923,-708,-383,1000,-383,-708,923,0,-924,707,382,-1000,382,707,-924};  //sine values
int out_sample;
int out_buffer[BUFFERLENGTH];
int input_array[BUFFERLENGTH];
int output_array[1024];
