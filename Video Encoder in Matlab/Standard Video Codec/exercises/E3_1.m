clear all
close all
clc

path (path, 'E:/IVC_labs_starting_point/functions');
ORIGINAL_image = double(imread('E:/IVC_labs_starting_point/data/images/lena.tif'));
ORIGINAL_image = ORIGINAL_image/256;
[height width dimensions] = size(ORIGINAL_image);

M = 5; % number of bits used for the quatization
INDEX_mat = UniQuant(ORIGINAL_image, M);
QUANTIZED_image = InvUniQuant(INDEX_mat, M);

MSE = calcMSE (QUANTIZED_image, ORIGINAL_image, height, width, dimensions);
PSNR = calcPSNR(MSE, QUANTIZED_image);

figure
imagesc(ORIGINAL_image);
title('Original image');

figure
imagesc(QUANTIZED_image);
title('QUANTIZED_image');

