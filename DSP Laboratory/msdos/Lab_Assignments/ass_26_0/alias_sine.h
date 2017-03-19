#define LOOPLENGTH 8
#define BUFFERLENGTH 256
int loopindex = 0;         	      //table index
int bufindex = 0;	         
int out_buffer[BUFFERLENGTH];
short output_buffer;
short cos_table2[LOOPLENGTH]={0,707,1000,707,0,-708,-1000,-708};  //sine values
short cos_table6[LOOPLENGTH]={0,0,1000,0,0,0,-1000,0};  //sine values
short cos_table_zeros2[LOOPLENGTH]={0,0,1000,0,0,0,-1000,0};  //sine values
short cos_table_zeros6[LOOPLENGTH]={0,0,-1000,0,0,0,1000,0};  //sine values
short gain=10;		              //gain factor
