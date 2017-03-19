#include "dotp4.h"

float dotp4(float *a, float *b, int ncount) //dot product function
{    
  int i; 
  float sum = 0;                    		  
  for (i = 0; i < ncount; i++) 
     sum += a[(int)i] * b[(int)i];       	//sum of products
  return(sum);                  //return sum as result
}
