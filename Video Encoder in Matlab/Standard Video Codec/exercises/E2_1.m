clear all
close all
clc

path (path, 'E:/IVC_labs_starting_point/functions');
ORIGINAL_image_1 = imread('E:/IVC_labs_starting_point/data/images/lena.tif');
ORIGINAL_image_2 = imread('E:/IVC_labs_starting_point/data/images/sail.tif');
ORIGINAL_image_3 = imread('E:/IVC_labs_starting_point/data/images/smandril.tif');

pmf_1 = stats_marg(ORIGINAL_image_1);
pmf_2 = stats_marg(ORIGINAL_image_2);
pmf_3 = stats_marg(ORIGINAL_image_3);

pmf_merged = pmf_1 + pmf_2 + pmf_3;
% H = calc_entropy(pmf);
H = calc_entropy_common_table(pmf_3, pmf_merged);
