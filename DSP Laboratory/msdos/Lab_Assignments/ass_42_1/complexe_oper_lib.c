#include "complexe_oper_lib.h"

void add_complexe_complexe(Complexe *a,Complexe *b,Complexe *c)
{
    c->re = a->re + b->re;
    c->im = a->im + b->im;
}

void mult_complexe_complexe(Complexe *a,Complexe *b,Complexe *c)
{
    c->re = (a->re * b->re) - (a->im * b->im);
    c->im = (a->re * b->im) + (a->im * b->re);
}


void sous_complexe_complexe(Complexe *a,Complexe *b,Complexe *c)
{
    c->re = a->re - b->re;
    c->im = a->im - b->im;
}

void div_complexe_factor(Complexe *complexe_to_divide,int length_array)
{
	complexe_to_divide->re /=  length_array;
	complexe_to_divide->im /=  length_array;
}

