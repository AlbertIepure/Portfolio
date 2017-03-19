#include <prototype.h> 
#include <stdio.h> 
#define DataBlockSize 160	/* dimensiunea unui bloc de date */
#define BlockLength 200		/* numarul de blocuri de date */

Word16 x[DataBlockSize],y[DataBlockSize];
Word16 w,w10,w11,w20,w21;

Word16 b[2][3] = {	WORD16(0.0866),WORD16(-0.0166),WORD16(0), 		/*coeficientii b scalati*/
					WORD16(0.0088),WORD16(-0.0080),WORD16(0.0932)}; 

Word16 a[2][2] = {	WORD16(0.4992), WORD16(0.8786),					/*coeficientii a nescalati deoarece au valori subunitare*/
					WORD16(0.2688),WORD16(0.8864)};

Word32 sum;
Word16 scalation;

int main()
{

short n,i;

FILE *fpx,*fpy;


fpx=fopen("input.dat","r+b");
if (!fpx)
    printf("\nNu s-a deschis1");
fpy=fopen("output.dat","w+b");
if (!fpy)
    printf("\nNu s-a deschis");

for (i=0; i<BlockLength; i++)
{
	fread(x,sizeof(Word16),DataBlockSize,fpx);

	
	for (n=0; n<DataBlockSize; n++)
	{
		sum = L_mult(x[n],WORD16(-0.3027));	
		sum = L_msu(sum,a[0][0],w10);
		sum = L_msu(sum,a[0][1],w20);
		w = round(sum);		
		sum = L_mult(b[0][0],w);
		sum = L_mac(sum,b[0][1],w10);
		sum = L_mac(sum,b[0][2],w20);
		w20 = w10;
		w10 = w;
		scalation = round(sum);
		sum = L_mult(scalation,WORD16(0.9652));
		sum = L_msu(sum,a[1][0],w11);
		sum = L_msu(sum,a[1][1],w21);
		w = round(sum);		
		sum = L_mult(b[1][0],w);
		sum = L_mac(sum,b[1][1],w11);
		sum = L_mac(sum,b[1][2],w21);
		w21 = w11;
		w11 = w;	
		scalation = round(sum);
		sum = L_mult(scalation,WORD16(0.7022));
		y[n] = round(L_shl(sum,4));
	};
		
	fwrite(y,sizeof(Word16),DataBlockSize,fpy);
};

fclose(fpx);
fclose(fpy);

return(0);
}
