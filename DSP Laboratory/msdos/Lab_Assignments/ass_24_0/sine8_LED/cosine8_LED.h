void cosine8_LED();
#define LOOPLENGTH 12
short loopindex= 0;         	      //table index
short gain=10;		              //gain factor	         
short cosine_table[LOOPLENGTH]={1000,866,500,0,-500,-867,-1000,-867,-501,-1,500,866};  //sine values
