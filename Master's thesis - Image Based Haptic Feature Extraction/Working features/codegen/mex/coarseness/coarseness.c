/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * coarseness.c
 *
 * Code generation for function 'coarseness'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "coarseness.h"
#include "sum.h"
#include "coarseness_emxutil.h"
#include "coarseness_data.h"

/* Function Definitions */
real_T coarseness(const emxArray_real_T *I)
{
  real_T Fcoarseness;
  emxArray_real_T *A;
  int32_T width;
  int32_T height;
  int32_T ixstart;
  int32_T itmp;
  emxArray_real_T *E_h;
  emxArray_real_T *E_v;
  emxArray_real_T *E_dr;
  emxArray_real_T *E_dl;
  emxArray_real_T *S;
  int32_T x;
  emxArray_real_T *y_pos;
  emxArray_real_T *x_pos;
  emxArray_boolean_T *r0;
  emxArray_boolean_T *r1;
  emxArray_real_T *b_I;
  emxArray_real_T *b_x_pos;
  emxArray_real_T *b_y_pos;
  emxArray_real_T *c_I;
  int32_T y;
  int32_T b_itmp;
  int32_T c_itmp;
  uint32_T d;
  int32_T ix;
  real_T apnd;
  real_T ndbl;
  real_T cdiff;
  uint32_T u0;
  int32_T d_itmp;
  uint32_T u1;
  real_T term_1;
  real_T term_2;
  real_T mtmp;
  boolean_T exitg10;
  real_T b_mtmp;
  boolean_T exitg9;
  real_T c_mtmp;
  boolean_T exitg8;
  real_T d_mtmp;
  boolean_T exitg7;
  real_T max_vect[4];
  int32_T e_itmp;
  boolean_T exitg6;
  int8_T f_itmp[4];
  boolean_T exitg5;
  boolean_T exitg4;
  boolean_T exitg3;
  real_T e_mtmp;
  boolean_T exitg2;
  int32_T g_itmp;
  boolean_T exitg1;
  int8_T h_itmp[4];
  int8_T i_itmp[4];
  int32_T b_S[1];
  emxArray_real_T c_S;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  emxInit_real_T(&A, 3, true);
  width = I->size[1];
  height = I->size[0];
  ixstart = I->size[0];
  itmp = A->size[0] * A->size[1] * A->size[2];
  A->size[0] = ixstart;
  emxEnsureCapacity((emxArray__common *)A, itmp, (int32_T)sizeof(real_T));
  ixstart = I->size[1];
  itmp = A->size[0] * A->size[1] * A->size[2];
  A->size[1] = ixstart;
  A->size[2] = 6;
  emxEnsureCapacity((emxArray__common *)A, itmp, (int32_T)sizeof(real_T));
  ixstart = I->size[0] * I->size[1] * 6;
  for (itmp = 0; itmp < ixstart; itmp++) {
    A->data[itmp] = 0.0;
  }

  emxInit_real_T(&E_h, 3, true);
  ixstart = I->size[0];
  itmp = E_h->size[0] * E_h->size[1] * E_h->size[2];
  E_h->size[0] = ixstart;
  emxEnsureCapacity((emxArray__common *)E_h, itmp, (int32_T)sizeof(real_T));
  ixstart = I->size[1];
  itmp = E_h->size[0] * E_h->size[1] * E_h->size[2];
  E_h->size[1] = ixstart;
  E_h->size[2] = 6;
  emxEnsureCapacity((emxArray__common *)E_h, itmp, (int32_T)sizeof(real_T));
  ixstart = I->size[0] * I->size[1] * 6;
  for (itmp = 0; itmp < ixstart; itmp++) {
    E_h->data[itmp] = 0.0;
  }

  emxInit_real_T(&E_v, 3, true);
  ixstart = I->size[0];
  itmp = E_v->size[0] * E_v->size[1] * E_v->size[2];
  E_v->size[0] = ixstart;
  emxEnsureCapacity((emxArray__common *)E_v, itmp, (int32_T)sizeof(real_T));
  ixstart = I->size[1];
  itmp = E_v->size[0] * E_v->size[1] * E_v->size[2];
  E_v->size[1] = ixstart;
  E_v->size[2] = 6;
  emxEnsureCapacity((emxArray__common *)E_v, itmp, (int32_T)sizeof(real_T));
  ixstart = I->size[0] * I->size[1] * 6;
  for (itmp = 0; itmp < ixstart; itmp++) {
    E_v->data[itmp] = 0.0;
  }

  emxInit_real_T(&E_dr, 3, true);
  ixstart = I->size[0];
  itmp = E_dr->size[0] * E_dr->size[1] * E_dr->size[2];
  E_dr->size[0] = ixstart;
  emxEnsureCapacity((emxArray__common *)E_dr, itmp, (int32_T)sizeof(real_T));
  ixstart = I->size[1];
  itmp = E_dr->size[0] * E_dr->size[1] * E_dr->size[2];
  E_dr->size[1] = ixstart;
  E_dr->size[2] = 6;
  emxEnsureCapacity((emxArray__common *)E_dr, itmp, (int32_T)sizeof(real_T));
  ixstart = I->size[0] * I->size[1] * 6;
  for (itmp = 0; itmp < ixstart; itmp++) {
    E_dr->data[itmp] = 0.0;
  }

  emxInit_real_T(&E_dl, 3, true);
  ixstart = I->size[0];
  itmp = E_dl->size[0] * E_dl->size[1] * E_dl->size[2];
  E_dl->size[0] = ixstart;
  emxEnsureCapacity((emxArray__common *)E_dl, itmp, (int32_T)sizeof(real_T));
  ixstart = I->size[1];
  itmp = E_dl->size[0] * E_dl->size[1] * E_dl->size[2];
  E_dl->size[1] = ixstart;
  E_dl->size[2] = 6;
  emxEnsureCapacity((emxArray__common *)E_dl, itmp, (int32_T)sizeof(real_T));
  ixstart = I->size[0] * I->size[1] * 6;
  for (itmp = 0; itmp < ixstart; itmp++) {
    E_dl->data[itmp] = 0.0;
  }

  b_emxInit_real_T(&S, 2, true);
  ixstart = I->size[0];
  itmp = S->size[0] * S->size[1];
  S->size[0] = ixstart;
  emxEnsureCapacity((emxArray__common *)S, itmp, (int32_T)sizeof(real_T));
  ixstart = I->size[1];
  itmp = S->size[0] * S->size[1];
  S->size[1] = ixstart;
  emxEnsureCapacity((emxArray__common *)S, itmp, (int32_T)sizeof(real_T));
  ixstart = I->size[0] * I->size[1];
  for (itmp = 0; itmp < ixstart; itmp++) {
    S->data[itmp] = 0.0;
  }

  x = 0;
  b_emxInit_real_T(&y_pos, 2, true);
  b_emxInit_real_T(&x_pos, 2, true);
  emxInit_boolean_T(&r0, 2, true);
  emxInit_boolean_T(&r1, 2, true);
  c_emxInit_real_T(&b_I, 1, true);
  c_emxInit_real_T(&b_x_pos, 1, true);
  c_emxInit_real_T(&b_y_pos, 1, true);
  b_emxInit_real_T(&c_I, 2, true);
  while (x <= height - 1) {
    for (y = 0; y < width; y++) {
      for (b_itmp = 0; b_itmp < 6; b_itmp++) {
        /*             %% as in the paper */
        /*             %% Step 1 */
        c_itmp = (y - (int32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) -
                   1.0)) + 1;
        d = y + (uint32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0);
        if ((real_T)d < c_itmp) {
          ix = -1;
          apnd = d;
        } else {
          ndbl = muDoubleScalarFloor(((real_T)d - (real_T)c_itmp) + 0.5);
          apnd = (real_T)c_itmp + ndbl;
          cdiff = apnd - (real_T)d;
          ixstart = (int32_T)muDoubleScalarAbs(c_itmp);
          u0 = (uint32_T)ixstart;
          if (muDoubleScalarAbs(cdiff) < 4.4408920985006262E-16 * (real_T)
              muIntScalarMax_uint32(u0, d)) {
            ndbl++;
            apnd = d;
          } else if (cdiff > 0.0) {
            apnd = (real_T)c_itmp + (ndbl - 1.0);
          } else {
            ndbl++;
          }

          if (ndbl >= 0.0) {
            ix = (int32_T)ndbl - 1;
          } else {
            ix = -1;
          }
        }

        itmp = y_pos->size[0] * y_pos->size[1];
        y_pos->size[0] = 1;
        y_pos->size[1] = ix + 1;
        emxEnsureCapacity((emxArray__common *)y_pos, itmp, (int32_T)sizeof
                          (real_T));
        if (ix + 1 > 0) {
          y_pos->data[0] = c_itmp;
          if (ix + 1 > 1) {
            y_pos->data[ix] = apnd;
            itmp = ix + (ix < 0);
            if (itmp >= 0) {
              ixstart = (int32_T)((uint32_T)itmp >> 1);
            } else {
              ixstart = (int32_T)~(~(uint32_T)itmp >> 1);
            }

            for (d_itmp = 1; d_itmp < ixstart; d_itmp++) {
              y_pos->data[d_itmp] = (real_T)c_itmp + (real_T)d_itmp;
              y_pos->data[ix - d_itmp] = apnd - (real_T)d_itmp;
            }

            if (ixstart << 1 == ix) {
              y_pos->data[ixstart] = ((real_T)c_itmp + apnd) / 2.0;
            } else {
              y_pos->data[ixstart] = (real_T)c_itmp + (real_T)ixstart;
              y_pos->data[ixstart + 1] = apnd - (real_T)ixstart;
            }
          }
        }

        itmp = r0->size[0] * r0->size[1];
        r0->size[0] = 1;
        r0->size[1] = y_pos->size[1];
        emxEnsureCapacity((emxArray__common *)r0, itmp, (int32_T)sizeof
                          (boolean_T));
        ixstart = y_pos->size[0] * y_pos->size[1];
        for (itmp = 0; itmp < ixstart; itmp++) {
          r0->data[itmp] = (y_pos->data[itmp] > 0.0);
        }

        itmp = r1->size[0] * r1->size[1];
        r1->size[0] = 1;
        r1->size[1] = y_pos->size[1];
        emxEnsureCapacity((emxArray__common *)r1, itmp, (int32_T)sizeof
                          (boolean_T));
        ixstart = y_pos->size[0] * y_pos->size[1];
        for (itmp = 0; itmp < ixstart; itmp++) {
          r1->data[itmp] = (y_pos->data[itmp] < width);
        }

        ixstart = r0->size[1] - 1;
        c_itmp = 0;
        for (d_itmp = 0; d_itmp <= ixstart; d_itmp++) {
          if (r0->data[d_itmp] && r1->data[d_itmp]) {
            c_itmp++;
          }
        }

        ix = 0;
        for (d_itmp = 0; d_itmp <= ixstart; d_itmp++) {
          if (r0->data[d_itmp] && r1->data[d_itmp]) {
            y_pos->data[ix] = y_pos->data[d_itmp];
            ix++;
          }
        }

        itmp = y_pos->size[0] * y_pos->size[1];
        y_pos->size[0] = 1;
        y_pos->size[1] = c_itmp;
        emxEnsureCapacity((emxArray__common *)y_pos, itmp, (int32_T)sizeof
                          (real_T));

        /*  make sure it's not out of bounds */
        c_itmp = (x - (int32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) -
                   1.0)) + 1;
        d = x + (uint32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0);
        if ((real_T)d < c_itmp) {
          ix = -1;
          apnd = d;
        } else {
          ndbl = muDoubleScalarFloor(((real_T)d - (real_T)c_itmp) + 0.5);
          apnd = (real_T)c_itmp + ndbl;
          cdiff = apnd - (real_T)d;
          ixstart = (int32_T)muDoubleScalarAbs(c_itmp);
          u1 = (uint32_T)ixstart;
          if (muDoubleScalarAbs(cdiff) < 4.4408920985006262E-16 * (real_T)
              muIntScalarMax_uint32(u1, d)) {
            ndbl++;
            apnd = d;
          } else if (cdiff > 0.0) {
            apnd = (real_T)c_itmp + (ndbl - 1.0);
          } else {
            ndbl++;
          }

          if (ndbl >= 0.0) {
            ix = (int32_T)ndbl - 1;
          } else {
            ix = -1;
          }
        }

        itmp = x_pos->size[0] * x_pos->size[1];
        x_pos->size[0] = 1;
        x_pos->size[1] = ix + 1;
        emxEnsureCapacity((emxArray__common *)x_pos, itmp, (int32_T)sizeof
                          (real_T));
        if (ix + 1 > 0) {
          x_pos->data[0] = c_itmp;
          if (ix + 1 > 1) {
            x_pos->data[ix] = apnd;
            itmp = ix + (ix < 0);
            if (itmp >= 0) {
              ixstart = (int32_T)((uint32_T)itmp >> 1);
            } else {
              ixstart = (int32_T)~(~(uint32_T)itmp >> 1);
            }

            for (d_itmp = 1; d_itmp < ixstart; d_itmp++) {
              x_pos->data[d_itmp] = (real_T)c_itmp + (real_T)d_itmp;
              x_pos->data[ix - d_itmp] = apnd - (real_T)d_itmp;
            }

            if (ixstart << 1 == ix) {
              x_pos->data[ixstart] = ((real_T)c_itmp + apnd) / 2.0;
            } else {
              x_pos->data[ixstart] = (real_T)c_itmp + (real_T)ixstart;
              x_pos->data[ixstart + 1] = apnd - (real_T)ixstart;
            }
          }
        }

        itmp = r0->size[0] * r0->size[1];
        r0->size[0] = 1;
        r0->size[1] = x_pos->size[1];
        emxEnsureCapacity((emxArray__common *)r0, itmp, (int32_T)sizeof
                          (boolean_T));
        ixstart = x_pos->size[0] * x_pos->size[1];
        for (itmp = 0; itmp < ixstart; itmp++) {
          r0->data[itmp] = (x_pos->data[itmp] > 0.0);
        }

        itmp = r1->size[0] * r1->size[1];
        r1->size[0] = 1;
        r1->size[1] = x_pos->size[1];
        emxEnsureCapacity((emxArray__common *)r1, itmp, (int32_T)sizeof
                          (boolean_T));
        ixstart = x_pos->size[0] * x_pos->size[1];
        for (itmp = 0; itmp < ixstart; itmp++) {
          r1->data[itmp] = (x_pos->data[itmp] < height);
        }

        ixstart = r0->size[1] - 1;
        c_itmp = 0;
        for (d_itmp = 0; d_itmp <= ixstart; d_itmp++) {
          if (r0->data[d_itmp] && r1->data[d_itmp]) {
            c_itmp++;
          }
        }

        ix = 0;
        for (d_itmp = 0; d_itmp <= ixstart; d_itmp++) {
          if (r0->data[d_itmp] && r1->data[d_itmp]) {
            x_pos->data[ix] = x_pos->data[d_itmp];
            ix++;
          }
        }

        itmp = x_pos->size[0] * x_pos->size[1];
        x_pos->size[0] = 1;
        x_pos->size[1] = c_itmp;
        emxEnsureCapacity((emxArray__common *)x_pos, itmp, (int32_T)sizeof
                          (real_T));

        /*  make sure it's not out of bounds */
        /*             %% Q: What happens at the boundaries? */
        itmp = b_x_pos->size[0];
        b_x_pos->size[0] = x_pos->size[1];
        emxEnsureCapacity((emxArray__common *)b_x_pos, itmp, (int32_T)sizeof
                          (real_T));
        ixstart = x_pos->size[1];
        for (itmp = 0; itmp < ixstart; itmp++) {
          b_x_pos->data[itmp] = x_pos->data[x_pos->size[0] * itmp];
        }

        itmp = b_y_pos->size[0];
        b_y_pos->size[0] = y_pos->size[1];
        emxEnsureCapacity((emxArray__common *)b_y_pos, itmp, (int32_T)sizeof
                          (real_T));
        ixstart = y_pos->size[1];
        for (itmp = 0; itmp < ixstart; itmp++) {
          b_y_pos->data[itmp] = y_pos->data[y_pos->size[0] * itmp];
        }

        itmp = c_I->size[0] * c_I->size[1];
        c_I->size[0] = x_pos->size[1];
        c_I->size[1] = y_pos->size[1];
        emxEnsureCapacity((emxArray__common *)c_I, itmp, (int32_T)sizeof(real_T));
        ixstart = y_pos->size[1];
        for (itmp = 0; itmp < ixstart; itmp++) {
          d_itmp = x_pos->size[1];
          for (ix = 0; ix < d_itmp; ix++) {
            c_I->data[ix + c_I->size[0] * itmp] = I->data[((int32_T)x_pos->
              data[x_pos->size[0] * ix] + I->size[0] * ((int32_T)y_pos->
              data[y_pos->size[0] * itmp] - 1)) - 1];
          }
        }

        ixstart = b_x_pos->size[0] * b_y_pos->size[0];
        itmp = b_I->size[0];
        b_I->size[0] = ixstart;
        emxEnsureCapacity((emxArray__common *)b_I, itmp, (int32_T)sizeof(real_T));
        for (itmp = 0; itmp < ixstart; itmp++) {
          b_I->data[itmp] = c_I->data[itmp];
        }

        ndbl = sum(b_I);
        A->data[(x + A->size[0] * y) + A->size[0] * A->size[1] * b_itmp] = ndbl /
          muDoubleScalarPower(2.0, 2.0 * (1.0 + (real_T)b_itmp));
      }
    }

    x++;
  }

  emxFree_real_T(&c_I);
  emxFree_real_T(&b_y_pos);
  emxFree_real_T(&b_x_pos);
  emxFree_real_T(&b_I);
  emxFree_boolean_T(&r1);
  emxFree_boolean_T(&r0);
  emxFree_real_T(&x_pos);
  emxFree_real_T(&y_pos);

  /* % Step 2 */
  for (x = 0; x < height; x++) {
    for (y = 0; y < width; y++) {
      for (b_itmp = 0; b_itmp < 6; b_itmp++) {
        /*             %% Q: What happens at the boundaries? */
        if ((x + (uint32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0))
            + 1U <= (uint32_T)height) {
          /*  make sure it's not out of bounds */
          term_1 = A->data[((int32_T)(x + (uint32_T)muDoubleScalarPower(2.0,
            (1.0 + (real_T)b_itmp) - 1.0)) + A->size[0] * y) + A->size[0] *
            A->size[1] * b_itmp];
        } else {
          term_1 = 0.0;
        }

        if ((x - (int32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0))
            + 1 >= 1) {
          /*  make sure it's not out of bounds */
          term_2 = A->data[((x - (int32_T)muDoubleScalarPower(2.0, (1.0 +
            (real_T)b_itmp) - 1.0)) + A->size[0] * y) + A->size[0] * A->size[1] *
            b_itmp];
        } else {
          term_2 = 0.0;
        }

        E_h->data[(x + E_h->size[0] * y) + E_h->size[0] * E_h->size[1] * b_itmp]
          = muDoubleScalarAbs(term_1 - term_2);
        if ((y + (uint32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0))
            + 1U <= (uint32_T)width) {
          /*  make sure it's not out of bounds */
          term_1 = A->data[(x + A->size[0] * (int32_T)(y + (uint32_T)
            muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0))) + A->size[0]
            * A->size[1] * b_itmp];
        } else {
          term_1 = 0.0;
        }

        if ((y - (int32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0))
            + 1 >= 1) {
          /*  make sure it's not out of bounds */
          term_2 = A->data[(x + A->size[0] * (y - (int32_T)muDoubleScalarPower
            (2.0, (1.0 + (real_T)b_itmp) - 1.0))) + A->size[0] * A->size[1] *
            b_itmp];
        } else {
          term_2 = 0.0;
        }

        E_v->data[(x + E_v->size[0] * y) + E_v->size[0] * E_v->size[1] * b_itmp]
          = muDoubleScalarAbs(term_1 - term_2);
        if (((x + (uint32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) -
               1.0)) + 1U <= (uint32_T)height) && ((y + (uint32_T)
              muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0)) + 1U <=
             (uint32_T)width)) {
          /*  make sure it's not out of bounds */
          term_1 = A->data[((int32_T)(x + (uint32_T)muDoubleScalarPower(2.0,
            (1.0 + (real_T)b_itmp) - 1.0)) + A->size[0] * (int32_T)(y +
            (uint32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0))) +
            A->size[0] * A->size[1] * b_itmp];
        } else {
          term_1 = 0.0;
        }

        if (((x - (int32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0))
             + 1 >= 1) && ((y - (int32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)
                b_itmp) - 1.0)) + 1 >= 1)) {
          /*  make sure it's not out of bounds */
          term_2 = A->data[((x - (int32_T)muDoubleScalarPower(2.0, (1.0 +
            (real_T)b_itmp) - 1.0)) + A->size[0] * (y - (int32_T)
            muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0))) + A->size[0]
            * A->size[1] * b_itmp];
        } else {
          term_2 = 0.0;
        }

        E_dr->data[(x + E_dr->size[0] * y) + E_dr->size[0] * E_dr->size[1] *
          b_itmp] = muDoubleScalarAbs(term_1 - term_2);
        if (((x + (uint32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) -
               1.0)) + 1U <= (uint32_T)height) && ((y - (int32_T)
              muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0)) + 1 >= 1))
        {
          /*  make sure it's not out of bounds */
          term_1 = A->data[((int32_T)(x + (uint32_T)muDoubleScalarPower(2.0,
            (1.0 + (real_T)b_itmp) - 1.0)) + A->size[0] * (y - (int32_T)
            muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0))) + A->size[0]
            * A->size[1] * b_itmp];
        } else {
          term_1 = 0.0;
        }

        if (((x - (int32_T)muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0))
             + 1 >= 1) && ((y + (uint32_T)muDoubleScalarPower(2.0, (1.0 +
                (real_T)b_itmp) - 1.0)) + 1U <= (uint32_T)width)) {
          /*  make sure it's not out of bounds */
          term_2 = A->data[((x - (int32_T)muDoubleScalarPower(2.0, (1.0 +
            (real_T)b_itmp) - 1.0)) + A->size[0] * (int32_T)(y + (uint32_T)
            muDoubleScalarPower(2.0, (1.0 + (real_T)b_itmp) - 1.0))) + A->size[0]
            * A->size[1] * b_itmp];
        } else {
          term_2 = 0.0;
        }

        E_dl->data[(x + E_dl->size[0] * y) + E_dl->size[0] * E_dl->size[1] *
          b_itmp] = muDoubleScalarAbs(term_1 - term_2);
      }
    }
  }

  emxFree_real_T(&A);

  /* % Step 3 */
  /*  for x=1:height */
  /*      for y=1:width */
  /*            % should we make sure that the max is unique!?  */
  /*          [max_h,k_h] = max(E_h(x,y,:)); */
  /*          [max_v,k_v] = max(E_v(x,y,:)); */
  /*          if max_h > max_v */
  /*              S(x,y) = 2.^k_h; */
  /*          else */
  /*              S(x,y) = 2.^k_v; */
  /*          end */
  /*      end */
  /*  end */
  for (x = 0; x < height; x++) {
    for (y = 0; y < width; y++) {
      /*  should we make sure that the max is unique!?  */
      ixstart = 1;
      mtmp = E_h->data[x + E_h->size[0] * y];
      d_itmp = 1;
      if (muDoubleScalarIsNaN(E_h->data[x + E_h->size[0] * y])) {
        ix = 2;
        exitg10 = false;
        while ((!exitg10) && (ix < 7)) {
          ixstart = ix;
          if (!muDoubleScalarIsNaN(E_h->data[(x + E_h->size[0] * y) + E_h->size
               [0] * E_h->size[1] * (ix - 1)])) {
            mtmp = E_h->data[(x + E_h->size[0] * y) + E_h->size[0] * E_h->size[1]
              * (ix - 1)];
            d_itmp = ix;
            exitg10 = true;
          } else {
            ix++;
          }
        }
      }

      if (ixstart < 6) {
        for (ix = ixstart + 1; ix < 7; ix++) {
          if (E_h->data[(x + E_h->size[0] * y) + E_h->size[0] * E_h->size[1] *
              (ix - 1)] > mtmp) {
            mtmp = E_h->data[(x + E_h->size[0] * y) + E_h->size[0] * E_h->size[1]
              * (ix - 1)];
            d_itmp = ix;
          }
        }
      }

      ixstart = 1;
      b_mtmp = E_v->data[x + E_v->size[0] * y];
      c_itmp = 1;
      if (muDoubleScalarIsNaN(E_v->data[x + E_v->size[0] * y])) {
        ix = 2;
        exitg9 = false;
        while ((!exitg9) && (ix < 7)) {
          ixstart = ix;
          if (!muDoubleScalarIsNaN(E_v->data[(x + E_v->size[0] * y) + E_v->size
               [0] * E_v->size[1] * (ix - 1)])) {
            b_mtmp = E_v->data[(x + E_v->size[0] * y) + E_v->size[0] * E_v->
              size[1] * (ix - 1)];
            c_itmp = ix;
            exitg9 = true;
          } else {
            ix++;
          }
        }
      }

      if (ixstart < 6) {
        for (ix = ixstart + 1; ix < 7; ix++) {
          if (E_v->data[(x + E_v->size[0] * y) + E_v->size[0] * E_v->size[1] *
              (ix - 1)] > b_mtmp) {
            b_mtmp = E_v->data[(x + E_v->size[0] * y) + E_v->size[0] * E_v->
              size[1] * (ix - 1)];
            c_itmp = ix;
          }
        }
      }

      ixstart = 1;
      c_mtmp = E_dr->data[x + E_dr->size[0] * y];
      itmp = 1;
      if (muDoubleScalarIsNaN(E_dr->data[x + E_dr->size[0] * y])) {
        ix = 2;
        exitg8 = false;
        while ((!exitg8) && (ix < 7)) {
          ixstart = ix;
          if (!muDoubleScalarIsNaN(E_dr->data[(x + E_dr->size[0] * y) +
               E_dr->size[0] * E_dr->size[1] * (ix - 1)])) {
            c_mtmp = E_dr->data[(x + E_dr->size[0] * y) + E_dr->size[0] *
              E_dr->size[1] * (ix - 1)];
            itmp = ix;
            exitg8 = true;
          } else {
            ix++;
          }
        }
      }

      if (ixstart < 6) {
        for (ix = ixstart + 1; ix < 7; ix++) {
          if (E_dr->data[(x + E_dr->size[0] * y) + E_dr->size[0] * E_dr->size[1]
              * (ix - 1)] > c_mtmp) {
            c_mtmp = E_dr->data[(x + E_dr->size[0] * y) + E_dr->size[0] *
              E_dr->size[1] * (ix - 1)];
            itmp = ix;
          }
        }
      }

      ixstart = 1;
      d_mtmp = E_dl->data[x + E_dl->size[0] * y];
      b_itmp = 1;
      if (muDoubleScalarIsNaN(E_dl->data[x + E_dl->size[0] * y])) {
        ix = 2;
        exitg7 = false;
        while ((!exitg7) && (ix < 7)) {
          ixstart = ix;
          if (!muDoubleScalarIsNaN(E_dl->data[(x + E_dl->size[0] * y) +
               E_dl->size[0] * E_dl->size[1] * (ix - 1)])) {
            d_mtmp = E_dl->data[(x + E_dl->size[0] * y) + E_dl->size[0] *
              E_dl->size[1] * (ix - 1)];
            b_itmp = ix;
            exitg7 = true;
          } else {
            ix++;
          }
        }
      }

      if (ixstart < 6) {
        for (ix = ixstart + 1; ix < 7; ix++) {
          if (E_dl->data[(x + E_dl->size[0] * y) + E_dl->size[0] * E_dl->size[1]
              * (ix - 1)] > d_mtmp) {
            d_mtmp = E_dl->data[(x + E_dl->size[0] * y) + E_dl->size[0] *
              E_dl->size[1] * (ix - 1)];
            b_itmp = ix;
          }
        }
      }

      max_vect[0] = mtmp;
      max_vect[1] = b_mtmp;
      max_vect[2] = c_mtmp;
      max_vect[3] = d_mtmp;
      ixstart = 1;
      e_itmp = 1;
      if (muDoubleScalarIsNaN(mtmp)) {
        ix = 2;
        exitg6 = false;
        while ((!exitg6) && (ix < 5)) {
          ixstart = ix;
          if (!muDoubleScalarIsNaN(max_vect[ix - 1])) {
            mtmp = max_vect[ix - 1];
            e_itmp = ix;
            exitg6 = true;
          } else {
            ix++;
          }
        }
      }

      if (ixstart < 4) {
        while (ixstart + 1 < 5) {
          if (max_vect[ixstart] > mtmp) {
            mtmp = max_vect[ixstart];
            e_itmp = ixstart + 1;
          }

          ixstart++;
        }
      }

      f_itmp[0] = (int8_T)d_itmp;
      f_itmp[1] = (int8_T)c_itmp;
      f_itmp[2] = (int8_T)itmp;
      f_itmp[3] = (int8_T)b_itmp;
      S->data[x + S->size[0] * y] = muDoubleScalarPower(2.0, f_itmp[e_itmp - 1]);
      if (e_itmp == 1) {
        E_h->data[(x + E_h->size[0] * y) + E_h->size[0] * E_h->size[1] * (d_itmp
          - 1)] = rtNaN;
      } else if (e_itmp == 2) {
        E_v->data[(x + E_v->size[0] * y) + E_v->size[0] * E_v->size[1] * (c_itmp
          - 1)] = rtNaN;
      } else if (e_itmp == 3) {
        E_dr->data[(x + E_dr->size[0] * y) + E_dr->size[0] * E_dr->size[1] *
          (itmp - 1)] = rtNaN;
      } else {
        E_dl->data[(x + E_dl->size[0] * y) + E_dl->size[0] * E_dl->size[1] *
          (b_itmp - 1)] = rtNaN;
      }

      ixstart = 1;
      b_mtmp = E_h->data[x + E_h->size[0] * y];
      d_itmp = 1;
      if (muDoubleScalarIsNaN(E_h->data[x + E_h->size[0] * y])) {
        ix = 2;
        exitg5 = false;
        while ((!exitg5) && (ix < 7)) {
          ixstart = ix;
          if (!muDoubleScalarIsNaN(E_h->data[(x + E_h->size[0] * y) + E_h->size
               [0] * E_h->size[1] * (ix - 1)])) {
            b_mtmp = E_h->data[(x + E_h->size[0] * y) + E_h->size[0] * E_h->
              size[1] * (ix - 1)];
            d_itmp = ix;
            exitg5 = true;
          } else {
            ix++;
          }
        }
      }

      if (ixstart < 6) {
        for (ix = ixstart + 1; ix < 7; ix++) {
          if (E_h->data[(x + E_h->size[0] * y) + E_h->size[0] * E_h->size[1] *
              (ix - 1)] > b_mtmp) {
            b_mtmp = E_h->data[(x + E_h->size[0] * y) + E_h->size[0] * E_h->
              size[1] * (ix - 1)];
            d_itmp = ix;
          }
        }
      }

      ixstart = 1;
      c_mtmp = E_v->data[x + E_v->size[0] * y];
      c_itmp = 1;
      if (muDoubleScalarIsNaN(E_v->data[x + E_v->size[0] * y])) {
        ix = 2;
        exitg4 = false;
        while ((!exitg4) && (ix < 7)) {
          ixstart = ix;
          if (!muDoubleScalarIsNaN(E_v->data[(x + E_v->size[0] * y) + E_v->size
               [0] * E_v->size[1] * (ix - 1)])) {
            c_mtmp = E_v->data[(x + E_v->size[0] * y) + E_v->size[0] * E_v->
              size[1] * (ix - 1)];
            c_itmp = ix;
            exitg4 = true;
          } else {
            ix++;
          }
        }
      }

      if (ixstart < 6) {
        for (ix = ixstart + 1; ix < 7; ix++) {
          if (E_v->data[(x + E_v->size[0] * y) + E_v->size[0] * E_v->size[1] *
              (ix - 1)] > c_mtmp) {
            c_mtmp = E_v->data[(x + E_v->size[0] * y) + E_v->size[0] * E_v->
              size[1] * (ix - 1)];
            c_itmp = ix;
          }
        }
      }

      ixstart = 1;
      d_mtmp = E_dr->data[x + E_dr->size[0] * y];
      itmp = 1;
      if (muDoubleScalarIsNaN(E_dr->data[x + E_dr->size[0] * y])) {
        ix = 2;
        exitg3 = false;
        while ((!exitg3) && (ix < 7)) {
          ixstart = ix;
          if (!muDoubleScalarIsNaN(E_dr->data[(x + E_dr->size[0] * y) +
               E_dr->size[0] * E_dr->size[1] * (ix - 1)])) {
            d_mtmp = E_dr->data[(x + E_dr->size[0] * y) + E_dr->size[0] *
              E_dr->size[1] * (ix - 1)];
            itmp = ix;
            exitg3 = true;
          } else {
            ix++;
          }
        }
      }

      if (ixstart < 6) {
        for (ix = ixstart + 1; ix < 7; ix++) {
          if (E_dr->data[(x + E_dr->size[0] * y) + E_dr->size[0] * E_dr->size[1]
              * (ix - 1)] > d_mtmp) {
            d_mtmp = E_dr->data[(x + E_dr->size[0] * y) + E_dr->size[0] *
              E_dr->size[1] * (ix - 1)];
            itmp = ix;
          }
        }
      }

      ixstart = 1;
      e_mtmp = E_dl->data[x + E_dl->size[0] * y];
      b_itmp = 1;
      if (muDoubleScalarIsNaN(E_dl->data[x + E_dl->size[0] * y])) {
        ix = 2;
        exitg2 = false;
        while ((!exitg2) && (ix < 7)) {
          ixstart = ix;
          if (!muDoubleScalarIsNaN(E_dl->data[(x + E_dl->size[0] * y) +
               E_dl->size[0] * E_dl->size[1] * (ix - 1)])) {
            e_mtmp = E_dl->data[(x + E_dl->size[0] * y) + E_dl->size[0] *
              E_dl->size[1] * (ix - 1)];
            b_itmp = ix;
            exitg2 = true;
          } else {
            ix++;
          }
        }
      }

      if (ixstart < 6) {
        for (ix = ixstart + 1; ix < 7; ix++) {
          if (E_dl->data[(x + E_dl->size[0] * y) + E_dl->size[0] * E_dl->size[1]
              * (ix - 1)] > e_mtmp) {
            e_mtmp = E_dl->data[(x + E_dl->size[0] * y) + E_dl->size[0] *
              E_dl->size[1] * (ix - 1)];
            b_itmp = ix;
          }
        }
      }

      max_vect[0] = b_mtmp;
      max_vect[1] = c_mtmp;
      max_vect[2] = d_mtmp;
      max_vect[3] = e_mtmp;
      ixstart = 1;
      g_itmp = 0;
      if (muDoubleScalarIsNaN(b_mtmp)) {
        ix = 1;
        exitg1 = false;
        while ((!exitg1) && (ix + 1 < 5)) {
          ixstart = ix + 1;
          if (!muDoubleScalarIsNaN(max_vect[ix])) {
            b_mtmp = max_vect[ix];
            g_itmp = ix;
            exitg1 = true;
          } else {
            ix++;
          }
        }
      }

      if (ixstart < 4) {
        while (ixstart + 1 < 5) {
          if (max_vect[ixstart] > b_mtmp) {
            b_mtmp = max_vect[ixstart];
            g_itmp = ixstart;
          }

          ixstart++;
        }
      }

      if (b_mtmp >= 0.9 * mtmp) {
        h_itmp[0] = (int8_T)d_itmp;
        h_itmp[1] = (int8_T)c_itmp;
        h_itmp[2] = (int8_T)itmp;
        h_itmp[3] = (int8_T)b_itmp;
        if (h_itmp[g_itmp] > f_itmp[e_itmp - 1]) {
          i_itmp[0] = (int8_T)d_itmp;
          i_itmp[1] = (int8_T)c_itmp;
          i_itmp[2] = (int8_T)itmp;
          i_itmp[3] = (int8_T)b_itmp;
          S->data[x + S->size[0] * y] = muDoubleScalarPower(2.0, i_itmp[g_itmp]);
        }
      }
    }
  }

  emxFree_real_T(&E_dl);
  emxFree_real_T(&E_dr);
  emxFree_real_T(&E_v);
  emxFree_real_T(&E_h);

  /* % Step 4 */
  /*  figure */
  /*  imshow(int8(S)) */
  b_S[0] = S->size[0] * S->size[1];
  c_S = *S;
  c_S.size = (int32_T *)&b_S;
  c_S.numDimensions = 1;
  ndbl = sum(&c_S);
  Fcoarseness = ndbl / ((real_T)I->size[0] * (real_T)I->size[1]);
  emxFree_real_T(&S);
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  return Fcoarseness;
}

/* End of code generation (coarseness.c) */
