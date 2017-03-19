#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "ifft.h"

void ifft(float array_to_transform_inv_re[],float array_to_transform_inv_im[],int length_array) 
{
    int max_stage;
	int stage;

	int i = 0;
	int j = 0;
	int pow2st=0;
	int pow2i,pow2i1, unscrambled;   /* Variables used on the unscrambling process */
	int jump = 0;
	int scrambledarray[256] ={0};
	Complexe transadd2,transadd1,transres,transres1, transmult;
	Complexe arrayfft[256];
    
	
	

	
	
	max_stage = (log(length_array)/log(2));

   

    for(i=0;i<length_array;i++) //Copy of the input signal in a complexe array
    {
        arrayfft[i].re = array_to_transform_inv_re[i];
        arrayfft[i].im =array_to_transform_inv_im[i];
        scrambledarray[i]=i;
    }



    for(stage=1 ; stage<=max_stage ; stage++)
    {
        pow2st = pow(2,stage);
        if (stage!=1)
            jump = pow(2,(max_stage-stage+1));
		for (i=0;i<pow(2,stage-1);i++)
		{
			for(j=0; j<(length_array/pow(2,stage)) ; j++)
			{
                transadd1.re=arrayfft[j+jump*i].re;
                transadd2.re=arrayfft[j+(length_array/(pow2st))+jump*i].re;

                transadd1.im=arrayfft[j+jump*i].im;
                transadd2.im=arrayfft[j+(length_array/(pow2st))+jump*i].im;


                add_complexe_complexe(&transadd1,&transadd2,&transres); // addition of the upper parts with the lower part
                if (stage == max_stage) div_complexe_factor(&transres,length_array);
                arrayfft[j+jump*i]=transres ;


                sous_complexe_complexe(&transadd1,&transadd2,&transres); // soustraction between the upper part and the lower part


                transmult.re = cos(2*PI*j*(pow(2,stage-1))/length_array);
                transmult.im =  sin(2*PI*j*(pow(2,stage-1))/length_array);
                mult_complexe_complexe(&transres,&transmult,&transres1);





                transres = transres1;
				if (stage == max_stage) div_complexe_factor(&transres,length_array);
                arrayfft[j+length_array/(pow2st)+jump*i]= transres;
            }
		}
    }


	for(i=0;i<length_array;i++) //Unscrambling and printing process
    {
            unscrambled = 0;
            for(j=1;j<=max_stage;j++)
            {
                pow2i=pow(2,j);
                pow2i1=pow(2,(j-1));
                if ((scrambledarray[i]%pow2i)>=pow2i1)
                unscrambled += pow(2,(max_stage-j));
            }
    		array_to_transform_inv_re[i] = arrayfft[unscrambled].re ; 
            array_to_transform_inv_im[i] = arrayfft[unscrambled].im;        
    
    
    }






}









	



