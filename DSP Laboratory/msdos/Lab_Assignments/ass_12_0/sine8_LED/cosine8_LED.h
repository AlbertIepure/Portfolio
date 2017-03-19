void cosine8_LED();
#define LOOPLENGTH 8
short loopindex= 0;         	      //table index
short gain=10;		              //gain factor	         
short cosine_table[LOOPLENGTH]={1000,  707,  0, -707, -1000, -707, 0,  707};  //cosine values
