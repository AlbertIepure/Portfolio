#include<math.h>
#include "euclidiannorm.h"

float euclidiannorm(short *a, int ncount) //euclidian norm function
{    
  int i;
  float res; 
  short sum = 0;                    		  
  for (i = 0; i < ncount; i++) 
     sum += a[i] * a[i];       	//sum of squares
  res=sqrt(sum);
  return(res);                  //return square root of sum as result
}
