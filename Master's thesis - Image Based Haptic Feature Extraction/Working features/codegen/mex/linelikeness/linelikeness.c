/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * linelikeness.c
 *
 * Code generation for function 'linelikeness'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "linelikeness.h"
#include "sum.h"
#include "rdivide.h"

/* Function Definitions */
real_T linelikeness(const emxArray_real_T *I, const emxArray_real_T *theta,
                    real_T d)
{
  real_T Flinelikeness;
  real_T PDd[2048];
  int32_T w;
  int32_T h;
  int32_T i;
  int32_T j;
  int32_T k1;
  int32_T k2;
  int32_T k;
  real_T numerator[8];
  real_T denominator[8];
  real_T dv0[16];
  real_T dv1[8];

  /*  parfor j=1:10 */
  /*      linelikeness(j) = linelikeness3_mex(double(I),theta,j); */
  /*  end */
  /*   */
  /*  Flinelikeness1 = sum(linelikeness(1:10)); */
  memset(&PDd[0], 0, sizeof(real_T) << 11);

  /*  Co-occurrence matrix structure with 8 directions   */
  w = I->size[1];
  h = I->size[0];
  for (i = 0; i < h; i++) {
    for (j = 0; j < w; j++) {
      for (k1 = 0; k1 < 16; k1++) {
        for (k2 = 0; k2 < 16; k2++) {
          /*  We construct for each one of the eight possible */
          /*  directions a co-occurence matrix whose element PDd(i,j) */
          /*  is defined as the relative frequency with which two */
          /*  neighboring cells separated by a distance d along the */
          /*  edge direction occur on the image, one with the direction */
          /*  code i and the other with the direction code j */
          if ((theta->data[i + theta->size[0] * j] >= 2.0 * ((1.0 + (real_T)k1)
                - 1.0) * 3.1415926535897931 / 2.0 / 16.0) && (theta->data[i +
               theta->size[0] * j] < (2.0 * ((1.0 + (real_T)k1) - 1.0) + 1.0) *
               3.1415926535897931 / 2.0 / 16.0)) {
            /* Down direction */
            if (((1.0 + (real_T)i) + d <= h) && (theta->data[((int32_T)((1.0 +
                    (real_T)i) + d) + theta->size[0] * j) - 1] >= 2.0 * ((1.0 +
                   (real_T)k2) - 1.0) * 3.1415926535897931 / 2.0 / 16.0) &&
                (theta->data[((int32_T)((1.0 + (real_T)i) + d) + theta->size[0] *
                              j) - 1] < (2.0 * ((1.0 + (real_T)k2) - 1.0) + 1.0)
                 * 3.1415926535897931 / 2.0 / 16.0)) {
              PDd[k1 + (k2 << 4)]++;
            }

            /* Up Direction */
            if (((1.0 + (real_T)i) - d >= 1.0) && (theta->data[((int32_T)((1.0 +
                    (real_T)i) - d) + theta->size[0] * j) - 1] >= 2.0 * ((1.0 +
                   (real_T)k2) - 1.0) * 3.1415926535897931 / 2.0 / 16.0) &&
                (theta->data[((int32_T)((1.0 + (real_T)i) - d) + theta->size[0] *
                              j) - 1] < (2.0 * ((1.0 + (real_T)k2) - 1.0) + 1.0)
                 * 3.1415926535897931 / 2.0 / 16.0)) {
              PDd[256 + (k1 + (k2 << 4))]++;
            }

            if ((1.0 + (real_T)j) + d <= w) {
              /* Right direction */
              if ((theta->data[i + theta->size[0] * ((int32_T)((1.0 + (real_T)j)
                     + d) - 1)] >= 2.0 * ((1.0 + (real_T)k2) - 1.0) *
                   3.1415926535897931 / 2.0 / 16.0) && (theta->data[i +
                   theta->size[0] * ((int32_T)((1.0 + (real_T)j) + d) - 1)] <
                   (2.0 * ((1.0 + (real_T)k2) - 1.0) + 1.0) * 3.1415926535897931
                   / 2.0 / 16.0)) {
                PDd[512 + (k1 + (k2 << 4))]++;
              }

              if (((1.0 + (real_T)i) + d <= h) && (theta->data[((int32_T)((1.0 +
                      (real_T)i) + d) + theta->size[0] * ((int32_T)((1.0 +
                       (real_T)j) + d) - 1)) - 1] >= 2.0 * ((1.0 + (real_T)k2) -
                    1.0) * 3.1415926535897931 / 2.0 / 16.0) && (theta->data
                   [((int32_T)((1.0 + (real_T)i) + d) + theta->size[0] *
                     ((int32_T)((1.0 + (real_T)j) + d) - 1)) - 1] < (2.0 * ((1.0
                      + (real_T)k2) - 1.0) + 1.0) * 3.1415926535897931 / 2.0 /
                   16.0)) {
                /* Lower right direction */
                PDd[1024 + (k1 + (k2 << 4))]++;
              }

              if (((1.0 + (real_T)i) - d >= 1.0) && (theta->data[((int32_T)((1.0
                      + (real_T)i) - d) + theta->size[0] * ((int32_T)((1.0 +
                       (real_T)j) + d) - 1)) - 1] >= 2.0 * ((1.0 + (real_T)k2) -
                    1.0) * 3.1415926535897931 / 2.0 / 16.0) && (theta->data
                   [((int32_T)((1.0 + (real_T)i) - d) + theta->size[0] *
                     ((int32_T)((1.0 + (real_T)j) + d) - 1)) - 1] < (2.0 * ((1.0
                      + (real_T)k2) - 1.0) + 1.0) * 3.1415926535897931 / 2.0 /
                   16.0)) {
                /* Upper right direction */
                PDd[1280 + (k1 + (k2 << 4))]++;
              }
            }

            if ((1.0 + (real_T)j) - d >= 1.0) {
              /* Left direction */
              if ((theta->data[i + theta->size[0] * ((int32_T)((1.0 + (real_T)j)
                     - d) - 1)] >= 2.0 * ((1.0 + (real_T)k2) - 1.0) *
                   3.1415926535897931 / 2.0 / 16.0) && (theta->data[i +
                   theta->size[0] * ((int32_T)((1.0 + (real_T)j) - d) - 1)] <
                   (2.0 * ((1.0 + (real_T)k2) - 1.0) + 1.0) * 3.1415926535897931
                   / 2.0 / 16.0)) {
                PDd[768 + (k1 + (k2 << 4))]++;
              }

              if (((1.0 + (real_T)i) + d <= h) && (theta->data[((int32_T)((1.0 +
                      (real_T)i) + d) + theta->size[0] * ((int32_T)((1.0 +
                       (real_T)j) - d) - 1)) - 1] >= 2.0 * ((1.0 + (real_T)k2) -
                    1.0) * 3.1415926535897931 / 2.0 / 16.0) && (theta->data
                   [((int32_T)((1.0 + (real_T)i) + d) + theta->size[0] *
                     ((int32_T)((1.0 + (real_T)j) - d) - 1)) - 1] < (2.0 * ((1.0
                      + (real_T)k2) - 1.0) + 1.0) * 3.1415926535897931 / 2.0 /
                   16.0)) {
                /* Lower left direction */
                PDd[1536 + (k1 + (k2 << 4))]++;
              }

              if (((1.0 + (real_T)i) - d >= 1.0) && (theta->data[((int32_T)((1.0
                      + (real_T)i) - d) + theta->size[0] * ((int32_T)((1.0 +
                       (real_T)j) - d) - 1)) - 1] >= 2.0 * ((1.0 + (real_T)k2) -
                    1.0) * 3.1415926535897931 / 2.0 / 16.0) && (theta->data
                   [((int32_T)((1.0 + (real_T)i) - d) + theta->size[0] *
                     ((int32_T)((1.0 + (real_T)j) - d) - 1)) - 1] < (2.0 * ((1.0
                      + (real_T)k2) - 1.0) + 1.0) * 3.1415926535897931 / 2.0 /
                   16.0)) {
                /*  Upper left direction */
                PDd[1792 + (k1 + (k2 << 4))]++;
              }
            }
          }
        }
      }
    }
  }

  for (k = 0; k < 8; k++) {
    numerator[k] = 0.0;
    denominator[k] = 0.0;
    sum(*(real_T (*)[256])&PDd[k << 8], dv0);
    denominator[k] = b_sum(dv0);
    for (i = 0; i < 16; i++) {
      for (j = 0; j < 16; j++) {
        numerator[k] += PDd[(i + (j << 4)) + (k << 8)] * muDoubleScalarCos
          ((real_T)(i - j) * 2.0 * 3.1415926535897931 / 16.0);
      }
    }
  }

  /*  vector containing for each 45 deg direction the linelikeness value */
  rdivide(numerator, denominator, dv1);
  Flinelikeness = c_sum(dv1);

  /*  Flinelikeness = double(max(l));% I find taking the sum of linelikenesses for  */
  /*  each direction more relevant for the  */
  /*  linelikenesses of the image as a whole than */
  /*  taking the maximum value */
  return Flinelikeness;
}

/* End of code generation (linelikeness.c) */
