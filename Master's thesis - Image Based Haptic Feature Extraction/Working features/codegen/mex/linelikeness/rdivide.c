/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * rdivide.c
 *
 * Code generation for function 'rdivide'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "linelikeness.h"
#include "rdivide.h"

/* Function Definitions */
void rdivide(const real_T x[8], const real_T y[8], real_T z[8])
{
  int32_T i0;
  for (i0 = 0; i0 < 8; i0++) {
    z[i0] = x[i0] / y[i0];
  }
}

/* End of code generation (rdivide.c) */
