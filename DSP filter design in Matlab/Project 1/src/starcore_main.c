#include <prototype.h> 
#include <stdio.h> 
#include "constants.h"
#include "functions.h"

int main()
{
Word16 a[DataBlockSize];
#pragma align a 8
FILE *fp;

fp=fopen("../a.dat","r+b");
fread(a,sizeof(Word16),DataBlockSize,fp);
if (!fp)
    printf("\nCould not open");
fclose(fp);

signalenergy(a);
return(0);
}