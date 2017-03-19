#include <prototype.h> 
#include <stdio.h> 
#define DataBlockSize 160	/* dimensiunea unui bloc de date */
#define BlockLength 400		/* numarul de blocuri de date */
#define N1 128					/* N = lungimea filtrului */
#define N2 192
#define N3 64
#define N4 256
#define dry 0.5
#define wet1 0.4901
#define wet2 0.3881
#define wet3 0.6600
#define wet4 0.3202


int main()
{
Word16 x[DataBlockSize],y[DataBlockSize],delay1[N1],delay2[N2],delay3[N3],delay4[N4];
short n;
Word16 w11,w22,w33,w44;
Word32 w,w0,w1,w2, w3,w4,w01,w23,w03,w04;
long unsigned k,index;


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
		w=mult(x[n],WORD16(0.4240));
		w0=L_mult(w,WORD16(dry));
		
		w11=delay1[index%N1];
		delay1[index%N1]=w;
		w1=L_mult(w11,WORD16(wet1));
	
		w22=delay2[index%N2];
		delay2[index%N2]=w;
		w2=L_mult(w22,WORD16(wet2));
		
		w33=delay3[index%N3];
		delay3[index%N3]=w;
		w3=L_mult(w33,WORD16(wet3));
		
		w44=delay4[index%N4];
		delay4[index%N4]=w;
		w4=L_mult(w44,WORD16(wet4));
		
		w01=L_add(w0,w1);
		w23=L_add(w2,w3);
		w03=L_add(w01,w23);
		w04=L_add(w03,w4);
		y[n]=round(w04);
		
		index++;
	}
		fwrite(y,sizeof(Word16),DataBlockSize,fpy);
}




fclose(fpx);
fclose(fpy);

return(0);
}
