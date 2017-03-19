#include <prototype.h> 
#include <stdio.h> 
#include "constants.h"


void signalenergy(Word16 a[])
{
	Word16 i,scalefactor = 0;
	Word32  energy0, energy1, energy2, energy3;
	FILE *fp;
	
	energy0=0;
	energy1=0;
	energy2=0;
	energy3=0;
		
	for(i=0;i<DataBlockSize;i+=4)
	{
		energy0=L_mac(energy0,a[i],a[i]);
		energy1=L_mac(energy1,a[i+1],a[i+1]);
		energy2=L_mac(energy2,a[i+2],a[i+2]);
		energy3=L_mac(energy3,a[i+3],a[i+3]);
	}
	
	energy0 = L_add(energy0, energy1);
	energy2 = L_add(energy2, energy3);
	energy0 = L_add(energy0, energy2);
	
	energy0=round(energy0);
	
	while(energy0>=32767)
		{	
			for(i=0;i<DataBlockSize;i++)
			a[i] = a[i]/2;
			scalefactor++;
			
			energy0=0;
			energy1=0;
			energy2=0;
			energy3=0;
			
			for(i=0;i<DataBlockSize;i+=4)
			{
				energy0=L_mac(energy0,a[i],a[i]);
				energy1=L_mac(energy1,a[i+1],a[i+1]);
				energy2=L_mac(energy2,a[i+2],a[i+2]);
				energy3=L_mac(energy3,a[i+3],a[i+3]);
			}
		
			energy0 = L_add(energy0, energy1);
			energy2 = L_add(energy2, energy3);
			energy0 = L_add(energy0, energy2);
			
			energy0=round(energy0);
		}
		
		printf("scalefactor: %d\n", scalefactor);
		printf("Signal's energy %d\n",energy0);
		
		fp=fopen("../scalefactor.dat","w+b");
		fprintf(fp,"%d",scalefactor);
		if (!fp)
    		printf("\nCould not open");
		fclose(fp);
		
		fp=fopen("../signalenergy.dat","w+b");
		fprintf(fp,"%d",energy0);
		if (!fp)
    		printf("\nCould not open");
		fclose(fp);
}

