#include <stdlib.h>
#include <math.h>
#include "matrix.h"
#include <stdio.h>
float ValMatr[30];
void MatrixFunction(){
 int I;
 printf("running sample with matrix.\n");
 for (I=0;I<29;I++){
 ValMatr[I] = 20*sin(I/10.0);
 }
 printf(" %d.\n",ValMatr[0]);
}

