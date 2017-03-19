void sine8_LED();
#define LOOPLENGTH 4
short loopindex= 0;         	      //table index
short gain=10;		              //gain factor	         
short sine_table[LOOPLENGTH]={0,  1000,   0,  -1000};  //sine values
