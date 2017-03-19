#define LOOPLENGTH 8
#define BUFFERLENGTH1 512
#define BUFFERLENGTH2 256

int loopindex = 0;         	      //table index
int bufindex1 = 0;
int bufindex2 = 0;	         
short cos_table[LOOPLENGTH]={0,707,1000,707,0,-708,-1000,-708};  //sine values
int input_array[BUFFERLENGTH1];
int output_array[BUFFERLENGTH2];
short gain=10;		              //gain factor

