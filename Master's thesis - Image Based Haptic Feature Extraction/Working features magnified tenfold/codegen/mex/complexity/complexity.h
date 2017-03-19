/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * complexity.h
 *
 * Code generation for function 'complexity'
 *
 */

#ifndef __COMPLEXITY_H__
#define __COMPLEXITY_H__

/* Include files */
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "mwmathutil.h"
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "blas.h"
#include "rtwtypes.h"
#include "complexity_types.h"

/* Function Declarations */
extern real_T complexity(const emxArray_real_T *I, real_T d);

#ifdef __WATCOMC__

#pragma aux complexity value [8087];

#endif
#endif

/* End of code generation (complexity.h) */
