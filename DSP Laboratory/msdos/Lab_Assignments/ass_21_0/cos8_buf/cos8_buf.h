#define LOOPLENGTH 8
#define BUFFERLENGTH 1024
int loopindex = 0;         	      //table index
int bufindex = 0;	         
short cos_table[LOOPLENGTH]={0,707,-1000,707,0,-708,1000,-708};  //sine values
int out_buffer[BUFFERLENGTH];
short gain=10;		              //gain factor

