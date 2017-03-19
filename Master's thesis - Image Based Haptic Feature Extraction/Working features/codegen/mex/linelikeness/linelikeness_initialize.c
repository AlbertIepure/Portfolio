/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * linelikeness_initialize.c
 *
 * Code generation for function 'linelikeness_initialize'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "linelikeness.h"
#include "linelikeness_initialize.h"
#include "_coder_linelikeness_mex.h"
#include "linelikeness_data.h"

/* Function Definitions */
void linelikeness_initialize(void)
{
  mexFunctionCreateRootTLS();
  emlrtClearAllocCountR2012b(emlrtRootTLSGlobal, false, 0U, 0);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (linelikeness_initialize.c) */
