#include <prototype.h> 
#include <stdio.h> 
#define	DataBlockSize	110		/* size of data block to process */
#define BlockLength    1000		/* number of data blocks to process */
#define	N	662					/* delay +amount*/

int main()
{
Word16 x[DataBlockSize],y[DataBlockSize],sinus[DataBlockSize],delay[N];
short n,k;
long unsigned index=0;
Word16 wet = WORD16(0.5);
//Word16 dry = WORD16(1);

FILE *fpx,*fpy,*fpsinus;

fpx=fopen("x.dat","r+b");
if (!fpx)
    printf("\nNu s-a deschis");

fpsinus=fopen("sinus.dat","r+b");
if (!fpsinus)
    printf("\nNu s-a deschis");

fpy=fopen("y.dat","w+b");
if (!fpy)
    printf("\nNu s-a deschis");




for (k=0; k<BlockLength; k++)
{
	fread(x,sizeof(Word16),DataBlockSize,fpx);
	fread(sinus,sizeof(Word16),DataBlockSize,fpsinus);
	
	for (n=0; n<DataBlockSize; n++)
	{
		y[n]=mac_r(L_deposit_h(x[n]),delay[(index+N-sinus[n])%N],wet);// delay[(index+N-d[n])%N]=x(n-d(n))
		delay[index%N]=x[n];

		index++;
	}

	fwrite(y,sizeof(Word16),DataBlockSize,fpy);
}

fclose(fpx);
fclose(fpy);

return(0);
}
