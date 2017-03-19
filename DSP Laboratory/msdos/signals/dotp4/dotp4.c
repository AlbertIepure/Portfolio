#include "dotp4.h"

short dotp4(short *a, short *b, int ncount) //dot product function
{    
  int i; 
  short sum = 0;                    		  
  for (i = 0; i < ncount; i++) 
     sum += a[i] * b[i];       	//sum of products
  return(sum);                  //return sum as result
}
