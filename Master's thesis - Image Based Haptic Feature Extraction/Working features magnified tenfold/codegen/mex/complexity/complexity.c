/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * complexity.c
 *
 * Code generation for function 'complexity'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "complexity.h"
#include "sum.h"
#include "complexity_emxutil.h"
#include "complexity_data.h"

/* Function Declarations */
static int32_T div_nzp_s32_floor(int32_T numerator, int32_T denominator);

/* Function Definitions */
static int32_T div_nzp_s32_floor(int32_T numerator, int32_T denominator)
{
  int32_T quotient;
  uint32_T absNumerator;
  uint32_T absDenominator;
  boolean_T quotientNeedsNegation;
  uint32_T tempAbsQuotient;
  if (numerator >= 0) {
    absNumerator = (uint32_T)numerator;
  } else {
    absNumerator = (uint32_T)-numerator;
  }

  if (denominator >= 0) {
    absDenominator = (uint32_T)denominator;
  } else {
    absDenominator = (uint32_T)-denominator;
  }

  quotientNeedsNegation = ((numerator < 0) != (denominator < 0));
  tempAbsQuotient = absNumerator / absDenominator;
  if (quotientNeedsNegation) {
    absNumerator %= absDenominator;
    if (absNumerator > 0U) {
      tempAbsQuotient++;
    }
  }

  if (quotientNeedsNegation) {
    quotient = -(int32_T)tempAbsQuotient;
  } else {
    quotient = (int32_T)tempAbsQuotient;
  }

  return quotient;
}

real_T complexity(const emxArray_real_T *I, real_T d)
{
  real_T Fcomplexity;
  emxArray_real_T *A_i;
  real_T a;
  real_T W;
  int32_T iy;
  int32_T i0;
  int32_T ix;
  real_T n_squared;
  int32_T i1;
  int32_T i2;
  int32_T i3;
  emxArray_real_T *b_I;
  int32_T idx;
  int32_T jj;
  uint32_T outsz[2];
  emxArray_real_T *maxval;
  int32_T n;
  int32_T i;
  real_T mtmp;
  int32_T nx;
  boolean_T exitg3;
  boolean_T exitg2;
  emxArray_real_T *s_i;
  emxArray_real_T *p;
  emxArray_real_T *c_I;
  real_T b_i;
  real_T j;
  real_T d0;
  emxArray_real_T *I2;
  uint32_T c;
  emxArray_real_T *row;
  emxArray_real_T *col;
  emxArray_boolean_T *x;
  emxArray_int32_T *ii;
  emxArray_int32_T *b_jj;
  boolean_T exitg1;
  boolean_T guard1 = false;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  emxInit_real_T(&A_i, 2, true);

  /*  d - the neighborhood size */
  a = 2.0 * d + 1.0;
  W = a * a;
  iy = I->size[0];
  i0 = A_i->size[0] * A_i->size[1];
  A_i->size[0] = iy;
  emxEnsureCapacity((emxArray__common *)A_i, i0, (int32_T)sizeof(real_T));
  iy = I->size[1];
  i0 = A_i->size[0] * A_i->size[1];
  A_i->size[1] = iy;
  emxEnsureCapacity((emxArray__common *)A_i, i0, (int32_T)sizeof(real_T));
  ix = I->size[0] * I->size[1];
  for (i0 = 0; i0 < ix; i0++) {
    A_i->data[i0] = 0.0;
  }

  n_squared = ((real_T)I->size[0] - 2.0 * d) * ((real_T)I->size[1] - 2.0 * d);
  a = (real_T)I->size[0] - d;
  if (d + 1.0 > a) {
    i0 = 0;
    i1 = 0;
  } else {
    i0 = (int32_T)(d + 1.0) - 1;
    i1 = (int32_T)a;
  }

  a = (real_T)I->size[1] - d;
  if (d + 1.0 > a) {
    i2 = 0;
    i3 = 0;
  } else {
    i2 = (int32_T)(d + 1.0) - 1;
    i3 = (int32_T)a;
  }

  emxInit_real_T(&b_I, 2, true);
  iy = b_I->size[0] * b_I->size[1];
  b_I->size[0] = i1 - i0;
  b_I->size[1] = i3 - i2;
  emxEnsureCapacity((emxArray__common *)b_I, iy, (int32_T)sizeof(real_T));
  ix = i3 - i2;
  for (iy = 0; iy < ix; iy++) {
    idx = i1 - i0;
    for (jj = 0; jj < idx; jj++) {
      b_I->data[jj + b_I->size[0] * iy] = I->data[(i0 + jj) + I->size[0] * (i2 +
        iy)];
    }
  }

  for (iy = 0; iy < 2; iy++) {
    outsz[iy] = (uint32_T)b_I->size[iy];
  }

  emxFree_real_T(&b_I);
  emxInit_real_T(&maxval, 2, true);
  iy = maxval->size[0] * maxval->size[1];
  maxval->size[0] = 1;
  maxval->size[1] = (int32_T)outsz[1];
  emxEnsureCapacity((emxArray__common *)maxval, iy, (int32_T)sizeof(real_T));
  n = (i1 - i0) - 1;
  ix = 1;
  iy = -1;
  for (i = 1; i <= i3 - i2; i++) {
    idx = ix;
    jj = ix + n;
    mtmp = I->data[(i0 + (ix - 1) % (i1 - i0)) + I->size[0] * (i2 +
      div_nzp_s32_floor(ix - 1, i1 - i0))];
    if (n + 1 > 1) {
      if (muDoubleScalarIsNaN(mtmp)) {
        nx = ix;
        exitg3 = false;
        while ((!exitg3) && (nx + 1 <= jj)) {
          idx = nx + 1;
          if (!muDoubleScalarIsNaN(I->data[(i0 + nx % (i1 - i0)) + I->size[0] *
               (i2 + div_nzp_s32_floor(nx, i1 - i0))])) {
            mtmp = I->data[(i0 + nx % (i1 - i0)) + I->size[0] * (i2 +
              div_nzp_s32_floor(nx, i1 - i0))];
            exitg3 = true;
          } else {
            nx++;
          }
        }
      }

      if (idx < jj) {
        while (idx + 1 <= jj) {
          if (I->data[(i0 + idx % (i1 - i0)) + I->size[0] * (i2 +
               div_nzp_s32_floor(idx, i1 - i0))] > mtmp) {
            mtmp = I->data[(i0 + idx % (i1 - i0)) + I->size[0] * (i2 +
              div_nzp_s32_floor(idx, i1 - i0))];
          }

          idx++;
        }
      }
    }

    iy++;
    maxval->data[iy] = mtmp;
    ix = (ix + n) + 1;
  }

  iy = 1;
  n = maxval->size[1];
  mtmp = maxval->data[0];
  if (maxval->size[1] > 1) {
    if (muDoubleScalarIsNaN(maxval->data[0])) {
      ix = 2;
      exitg2 = false;
      while ((!exitg2) && (ix <= n)) {
        iy = ix;
        if (!muDoubleScalarIsNaN(maxval->data[ix - 1])) {
          mtmp = maxval->data[ix - 1];
          exitg2 = true;
        } else {
          ix++;
        }
      }
    }

    if (iy < maxval->size[1]) {
      while (iy + 1 <= n) {
        if (maxval->data[iy] > mtmp) {
          mtmp = maxval->data[iy];
        }

        iy++;
      }
    }
  }

  b_emxInit_real_T(&s_i, 1, true);

  /*  within the region of interest */
  i0 = s_i->size[0];
  s_i->size[0] = (int32_T)(mtmp + 1.0);
  emxEnsureCapacity((emxArray__common *)s_i, i0, (int32_T)sizeof(real_T));
  ix = (int32_T)(mtmp + 1.0);
  for (i0 = 0; i0 < ix; i0++) {
    s_i->data[i0] = 0.0;
  }

  b_emxInit_real_T(&p, 1, true);

  /*  +1 because we assume that in the window we have all values from 0 onwards */
  i0 = p->size[0];
  p->size[0] = (int32_T)(mtmp + 1.0);
  emxEnsureCapacity((emxArray__common *)p, i0, (int32_T)sizeof(real_T));
  ix = (int32_T)(mtmp + 1.0);
  for (i0 = 0; i0 < ix; i0++) {
    p->data[i0] = 0.0;
  }

  /*  probability of occurence of each gray-tone value */
  i0 = (int32_T)(((real_T)I->size[0] - d) + (1.0 - (d + 1.0)));
  i = 0;
  emxInit_real_T(&c_I, 2, true);
  while (i <= i0 - 1) {
    b_i = (d + 1.0) + (real_T)i;
    i1 = (int32_T)(((real_T)I->size[1] - d) + (1.0 - (d + 1.0)));
    for (nx = 0; nx < i1; nx++) {
      j = (d + 1.0) + (real_T)nx;
      a = b_i - d;
      d0 = b_i + d;
      if (a > d0) {
        i2 = 0;
        i3 = 0;
      } else {
        i2 = (int32_T)a - 1;
        i3 = (int32_T)d0;
      }

      a = j - d;
      d0 = j + d;
      if (a > d0) {
        iy = 0;
        jj = 0;
      } else {
        iy = (int32_T)a - 1;
        jj = (int32_T)d0;
      }

      n = c_I->size[0] * c_I->size[1];
      c_I->size[0] = i3 - i2;
      c_I->size[1] = jj - iy;
      emxEnsureCapacity((emxArray__common *)c_I, n, (int32_T)sizeof(real_T));
      ix = jj - iy;
      for (jj = 0; jj < ix; jj++) {
        idx = i3 - i2;
        for (n = 0; n < idx; n++) {
          c_I->data[n + c_I->size[0] * jj] = I->data[(i2 + n) + I->size[0] * (iy
            + jj)];
        }
      }

      sum(c_I, maxval);
      a = b_sum(maxval) - I->data[((int32_T)b_i + I->size[0] * ((int32_T)j - 1))
        - 1];
      A_i->data[((int32_T)b_i + A_i->size[0] * ((int32_T)j - 1)) - 1] = a / (W -
        1.0);
    }

    i++;
  }

  emxFree_real_T(&c_I);
  emxFree_real_T(&maxval);
  emxInit_real_T(&I2, 2, true);
  iy = I->size[0];
  i0 = I2->size[0] * I2->size[1];
  I2->size[0] = iy;
  emxEnsureCapacity((emxArray__common *)I2, i0, (int32_T)sizeof(real_T));
  iy = I->size[1];
  i0 = I2->size[0] * I2->size[1];
  I2->size[1] = iy;
  emxEnsureCapacity((emxArray__common *)I2, i0, (int32_T)sizeof(real_T));
  ix = I->size[0] * I->size[1];
  for (i0 = 0; i0 < ix; i0++) {
    I2->data[i0] = 256.0;
  }

  /*  insert outside the region of interest values that are not to be found inside the interest region */
  a = (real_T)I->size[0] - d;
  if (d + 1.0 > a) {
    i0 = 1;
    i1 = 0;
  } else {
    i0 = (int32_T)(d + 1.0);
    i1 = (int32_T)a;
  }

  a = (real_T)I->size[1] - d;
  if (d + 1.0 > a) {
    i2 = 1;
    i3 = 0;
  } else {
    i2 = (int32_T)(d + 1.0);
    i3 = (int32_T)a;
  }

  a = (real_T)I->size[0] - d;
  if (d + 1.0 > a) {
    iy = 0;
  } else {
    iy = (int32_T)(d + 1.0) - 1;
  }

  a = (real_T)I->size[1] - d;
  if (d + 1.0 > a) {
    jj = 0;
  } else {
    jj = (int32_T)(d + 1.0) - 1;
  }

  ix = i3 - i2;
  for (i3 = 0; i3 <= ix; i3++) {
    idx = i1 - i0;
    for (n = 0; n <= idx; n++) {
      I2->data[(iy + n) + I2->size[0] * (jj + i3)] = I->data[((i0 + n) + I->
        size[0] * ((i2 + i3) - 1)) - 1];
    }
  }

  c = 1U;
  n = 0;
  b_emxInit_real_T(&row, 1, true);
  b_emxInit_real_T(&col, 1, true);
  emxInit_boolean_T(&x, 2, true);
  emxInit_int32_T(&ii, 1, true);
  emxInit_int32_T(&b_jj, 1, true);
  while (n <= (int32_T)(mtmp + 1.0) - 1) {
    i0 = x->size[0] * x->size[1];
    x->size[0] = I2->size[0];
    x->size[1] = I2->size[1];
    emxEnsureCapacity((emxArray__common *)x, i0, (int32_T)sizeof(boolean_T));
    ix = I2->size[0] * I2->size[1];
    for (i0 = 0; i0 < ix; i0++) {
      x->data[i0] = (I2->data[i0] == n);
    }

    nx = x->size[0] * x->size[1];
    idx = 0;
    i0 = ii->size[0];
    ii->size[0] = nx;
    emxEnsureCapacity((emxArray__common *)ii, i0, (int32_T)sizeof(int32_T));
    i0 = b_jj->size[0];
    b_jj->size[0] = nx;
    emxEnsureCapacity((emxArray__common *)b_jj, i0, (int32_T)sizeof(int32_T));
    if (nx == 0) {
      i0 = ii->size[0];
      ii->size[0] = 0;
      emxEnsureCapacity((emxArray__common *)ii, i0, (int32_T)sizeof(int32_T));
      i0 = b_jj->size[0];
      b_jj->size[0] = 0;
      emxEnsureCapacity((emxArray__common *)b_jj, i0, (int32_T)sizeof(int32_T));
    } else {
      iy = 1;
      jj = 1;
      exitg1 = false;
      while ((!exitg1) && (jj <= x->size[1])) {
        guard1 = false;
        if (x->data[(iy + x->size[0] * (jj - 1)) - 1]) {
          idx++;
          ii->data[idx - 1] = iy;
          b_jj->data[idx - 1] = jj;
          if (idx >= nx) {
            exitg1 = true;
          } else {
            guard1 = true;
          }
        } else {
          guard1 = true;
        }

        if (guard1) {
          iy++;
          if (iy > x->size[0]) {
            iy = 1;
            jj++;
          }
        }
      }

      if (nx == 1) {
        if (idx == 0) {
          i0 = ii->size[0];
          ii->size[0] = 0;
          emxEnsureCapacity((emxArray__common *)ii, i0, (int32_T)sizeof(int32_T));
          i0 = b_jj->size[0];
          b_jj->size[0] = 0;
          emxEnsureCapacity((emxArray__common *)b_jj, i0, (int32_T)sizeof
                            (int32_T));
        }
      } else {
        i0 = ii->size[0];
        if (1 > idx) {
          ii->size[0] = 0;
        } else {
          ii->size[0] = idx;
        }

        emxEnsureCapacity((emxArray__common *)ii, i0, (int32_T)sizeof(int32_T));
        i0 = b_jj->size[0];
        if (1 > idx) {
          b_jj->size[0] = 0;
        } else {
          b_jj->size[0] = idx;
        }

        emxEnsureCapacity((emxArray__common *)b_jj, i0, (int32_T)sizeof(int32_T));
      }
    }

    i0 = row->size[0];
    row->size[0] = ii->size[0];
    emxEnsureCapacity((emxArray__common *)row, i0, (int32_T)sizeof(real_T));
    ix = ii->size[0];
    for (i0 = 0; i0 < ix; i0++) {
      row->data[i0] = ii->data[i0];
    }

    i0 = col->size[0];
    col->size[0] = b_jj->size[0];
    emxEnsureCapacity((emxArray__common *)col, i0, (int32_T)sizeof(real_T));
    ix = b_jj->size[0];
    for (i0 = 0; i0 < ix; i0++) {
      col->data[i0] = b_jj->data[i0];
    }

    p->data[(int32_T)c - 1] = (real_T)col->size[0] / n_squared;
    if (col->size[0] == 0) {
      s_i->data[(int32_T)c - 1] = 0.0;
    } else {
      for (i = 0; i < col->size[0]; i++) {
        s_i->data[(int32_T)c - 1] += muDoubleScalarAbs(I->data[((int32_T)
          row->data[i] + I->size[0] * ((int32_T)col->data[i] - 1)) - 1] -
          A_i->data[((int32_T)row->data[i] + A_i->size[0] * ((int32_T)col->
          data[i] - 1)) - 1]);
      }
    }

    c++;
    n++;
  }

  emxFree_int32_T(&b_jj);
  emxFree_int32_T(&ii);
  emxFree_boolean_T(&x);
  emxFree_real_T(&col);
  emxFree_real_T(&row);
  emxFree_real_T(&I2);
  emxFree_real_T(&A_i);
  Fcomplexity = 0.0;
  for (i = 0; i < (int32_T)(mtmp + 1.0); i++) {
    for (nx = 0; nx < (int32_T)(mtmp + 1.0); nx++) {
      if ((p->data[i] != 0.0) && (p->data[nx] != 0.0)) {
        Fcomplexity += muDoubleScalarAbs((real_T)i - (real_T)nx) * (p->data[i] *
          s_i->data[i] + p->data[nx] * s_i->data[nx]) / (n_squared * (p->data[i]
          + p->data[nx]) + 2.2250738585072014E-308);
      }
    }
  }

  emxFree_real_T(&p);
  emxFree_real_T(&s_i);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  return Fcomplexity;
}

/* End of code generation (complexity.c) */
