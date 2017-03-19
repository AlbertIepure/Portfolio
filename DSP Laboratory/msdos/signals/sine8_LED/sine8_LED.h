void sine8_LED();
#define LOOPLENGTH 8
short loopindex= 0;         	      //table index
short gain=10;		              //gain factor	         
short sine_table[LOOPLENGTH]={0,  707,  1000,  707,  0, -707, -1000, -707};  //sine values
