typedef struct Complexe Complexe;

void mult_complexe_complexe(Complexe* a, Complexe* b,Complexe* c);
void add_complexe_complexe(Complexe* a, Complexe* b,Complexe* c);
void sous_complexe_complexe(Complexe* a, Complexe* b,Complexe* c);
void div_complexe_factor(Complexe* complexe_to_divide,int length_array);


struct Complexe
{
    float re ;
    float im ;

};

