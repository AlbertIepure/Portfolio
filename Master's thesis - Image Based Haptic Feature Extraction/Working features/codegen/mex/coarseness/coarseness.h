/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * coarseness.h
 *
 * Code generation for function 'coarseness'
 *
 */

#ifndef __COARSENESS_H__
#define __COARSENESS_H__

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
#include "coarseness_types.h"

/* Function Declarations */
extern real_T coarseness(const emxArray_real_T *I);

#ifdef __WATCOMC__

#pragma aux coarseness value [8087];

#endif
#endif

/* End of code generation (coarseness.h) */
