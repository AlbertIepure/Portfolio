/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * complexity_initialize.c
 *
 * Code generation for function 'complexity_initialize'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "complexity.h"
#include "complexity_initialize.h"
#include "complexity_data.h"

/* Function Definitions */
void complexity_initialize(void)
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  emlrtClearAllocCountR2012b(emlrtRootTLSGlobal, false, 0U, 0);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (complexity_initialize.c) */
