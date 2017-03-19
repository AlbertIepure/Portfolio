/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * linelikeness.h
 *
 * Code generation for function 'linelikeness'
 *
 */

#ifndef __LINELIKENESS_H__
#define __LINELIKENESS_H__

/* Include files */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mwmathutil.h"
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "blas.h"
#include "rtwtypes.h"
#include "linelikeness_types.h"

/* Function Declarations */
extern real_T linelikeness(const emxArray_real_T *I, const emxArray_real_T
  *theta, real_T d);

#ifdef __WATCOMC__

#pragma aux linelikeness value [8087];

#endif
#endif

/* End of code generation (linelikeness.h) */
