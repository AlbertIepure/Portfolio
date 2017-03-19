/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_linelikeness_api.c
 *
 * Code generation for function '_coder_linelikeness_api'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "linelikeness.h"
#include "_coder_linelikeness_api.h"
#include "linelikeness_emxutil.h"
#include "linelikeness_data.h"

/* Function Declarations */
static void b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId, emxArray_real_T *y);
static real_T c_emlrt_marshallIn(const mxArray *d, const char_T *identifier);
static const mxArray *c_emlrt_marshallOut(const real_T u);
static real_T d_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId);
static void e_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId, emxArray_real_T *ret);
static void emlrt_marshallIn(const mxArray *I, const char_T *identifier,
  emxArray_real_T *y);
static real_T f_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId);

/* Function Definitions */
static void b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId, emxArray_real_T *y)
{
  e_emlrt_marshallIn(emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static real_T c_emlrt_marshallIn(const mxArray *d, const char_T *identifier)
{
  real_T y;
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = d_emlrt_marshallIn(emlrtAlias(d), &thisId);
  emlrtDestroyArray(&d);
  return y;
}

static const mxArray *c_emlrt_marshallOut(const real_T u)
{
  const mxArray *y;
  const mxArray *m2;
  y = NULL;
  m2 = emlrtCreateDoubleScalar(u);
  emlrtAssign(&y, m2);
  return y;
}

static real_T d_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId)
{
  real_T y;
  y = f_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static void e_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId, emxArray_real_T *ret)
{
  int32_T iv0[2];
  boolean_T bv0[2] = { true, true };

  static const int32_T dims[2] = { -1, -1 };

  emlrtCheckVsBuiltInR2012b(emlrtRootTLSGlobal, msgId, src, "double", false, 2U,
    dims, &bv0[0], iv0);
  ret->size[0] = iv0[0];
  ret->size[1] = iv0[1];
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
  thisId.bParentIsCell = false;
  b_emlrt_marshallIn(emlrtAlias(I), &thisId, y);
  emlrtDestroyArray(&I);
}

static real_T f_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId)
{
  real_T ret;
  static const int32_T dims = 0;
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src, "double", false, 0U,
    &dims);
  ret = *(real_T *)mxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

void linelikeness_api(const mxArray * const prhs[3], const mxArray *plhs[1])
{
  emxArray_real_T *I;
  emxArray_real_T *theta;
  real_T d;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  emxInit_real_T(&I, 2, true);
  emxInit_real_T(&theta, 2, true);

  /* Marshall function inputs */
  emlrt_marshallIn(emlrtAlias(prhs[0]), "I", I);
  emlrt_marshallIn(emlrtAlias(prhs[1]), "theta", theta);
  d = c_emlrt_marshallIn(emlrtAliasP(prhs[2]), "d");

  /* Invoke the target function */
  d = linelikeness(I, theta, d);

  /* Marshall function outputs */
  plhs[0] = c_emlrt_marshallOut(d);
  theta->canFreeData = false;
  emxFree_real_T(&theta);
  I->canFreeData = false;
  emxFree_real_T(&I);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (_coder_linelikeness_api.c) */
