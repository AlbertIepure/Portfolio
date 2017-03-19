/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * linelikeness_terminate.c
 *
 * Code generation for function 'linelikeness_terminate'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "linelikeness.h"
#include "linelikeness_terminate.h"
#include "_coder_linelikeness_mex.h"
#include "linelikeness_data.h"

/* Function Definitions */
void linelikeness_atexit(void)
{
  mexFunctionCreateRootTLS();
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

void linelikeness_terminate(void)
{
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (linelikeness_terminate.c) */
