#define LOOPLENGTH 12
#define BUFFERLENGTH 1024
int loopindex = 0;         	      //table index
int bufindex = 0;	         
short cos_table[LOOPLENGTH]={0,499,866,1000,866,499,0,-500,-867,-1000,-867,-501};  //sine values
int out_buffer[BUFFERLENGTH];
short gain=10;		              //gain factor

