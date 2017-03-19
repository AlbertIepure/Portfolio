#include <string.h>
#include "invert.h"

void invert(char a[])
{
	short i;
	char c[100];
	
	for (i=0; i<strlen(a); i++)
		c[i]=a[strlen(a)-i-1];
	c[strlen(a)] = NULL;
	strcpy(a,c);
	
}

