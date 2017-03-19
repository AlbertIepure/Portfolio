/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * coarseness_initialize.c
 *
 * Code generation for function 'coarseness_initialize'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "coarseness.h"
#include "coarseness_initialize.h"
#include "coarseness_data.h"

/* Function Definitions */
void coarseness_initialize(void)
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  emlrtClearAllocCountR2012b(emlrtRootTLSGlobal, false, 0U, 0);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (coarseness_initialize.c) */
