/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_coarseness_api.c
 *
 * Code generation for function '_coder_coarseness_api'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "coarseness.h"
#include "_coder_coarseness_api.h"
#include "coarseness_emxutil.h"
#include "coarseness_data.h"

/* Function Declarations */
static void b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId, emxArray_real_T *y);
static void c_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId, emxArray_real_T *ret);
static void emlrt_marshallIn(const mxArray *I, const char_T *identifier,
  emxArray_real_T *y);
static const mxArray *emlrt_marshallOut(const real_T u);

/* Function Definitions */
static void b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId, emxArray_real_T *y)
{
  c_emlrt_marshallIn(emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void c_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId, emxArray_real_T *ret)
{
  int32_T iv0[2];
  int32_T i;
  int32_T iv1[2];
  boolean_T bv0[2] = { true, true };

  for (i = 0; i < 2; i++) {
    iv0[i] = -1;
  }

  emlrtCheckVsBuiltInR2012b(emlrtRootTLSGlobal, msgId, src, "double", false, 2U,
    iv0, &bv0[0], iv1);
  ret->size[0] = iv1[0];
  ret->size[1] = iv1[1];
  ret->allocatedSize = ret->size[0] * ret->size[1];
  ret->data = (real_T *)mxGetData(src);
  ret->canFreeData = false;
  emlrtDestroyArray(&src);
}

static void emlrt_marshallIn(const mxArray *I, const char_T *identifier,
  emxArray_real_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  b_emlrt_marshallIn(emlrtAlias(I), &thisId, y);
  emlrtDestroyArray(&I);
}

static const mxArray *emlrt_marshallOut(const real_T u)
{
  const mxArray *y;
  const mxArray *m0;
  y = NULL;
  m0 = emlrtCreateDoubleScalar(u);
  emlrtAssign(&y, m0);
  return y;
}

void coarseness_api(const mxArray * const prhs[1], const mxArray *plhs[1])
{
  emxArray_real_T *I;
  real_T Fcoarseness;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  b_emxInit_real_T(&I, 2, true);

  /* Marshall function inputs */
  emlrt_marshallIn(emlrtAlias(prhs[0]), "I", I);

  /* Invoke the target function */
  Fcoarseness = coarseness(I);

  /* Marshall function outputs */
  plhs[0] = emlrt_marshallOut(Fcoarseness);
  I->canFreeData = false;
  emxFree_real_T(&I);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (_coder_coarseness_api.c) */
