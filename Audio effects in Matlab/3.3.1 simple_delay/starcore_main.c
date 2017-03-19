#include <prototype.h> 
#include <stdio.h> 
#define DataBlockSize 160	/* dimensiunea unui bloc de date */
#define BlockLength 400		/* numarul de blocuri de date */
#define N 1368					/* N = lungimea filtrului */
#define wet 1
#define dry 0.5

int main()
{
Word16 x[DataBlockSize],y[DataBlockSize],delay[N],w1,w2;
Word32 w3;
short n,k;
long unsigned index=0;

FILE *fpx,*fpy;

fpx=fopen("input.dat","r+b");
if (!fpx)
    printf("\nNu s-a deschis 1");
fpy=fopen("output.dat","w+b");
if (!fpy)
    printf("\nNu s-a deschis 2");

for (k=0; k<BlockLength; k++)
{
	fread(x,sizeof(Word16),DataBlockSize,fpx);

	for (n=0; n<DataBlockSize; n++)
	{
		w1=mult(x[n],WORD16(1/(wet+dry)));
		w2=delay[index%N];
		delay[index%N]=w1;
		w3=L_mult(w1,WORD16(dry));
		y[n]=mac_r(w3, WORD16(wet),w2);
		index++;
	}

	fwrite(y,sizeof(Word16),DataBlockSize,fpy);
}

fclose(fpx);
fclose(fpy);

return(0);
}
