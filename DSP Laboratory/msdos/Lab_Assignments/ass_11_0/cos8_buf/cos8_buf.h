#define LOOPLENGTH 8
#define BUFFERLENGTH 256
int loopindex = 0;         	      //table index
int bufindex = 0;	         
short cos_table[LOOPLENGTH]={1000,  707,  0, -707, -1000, -707, 0,  707};  //sine values
int out_buffer[BUFFERLENGTH];
short gain=10;		              //gain factor

