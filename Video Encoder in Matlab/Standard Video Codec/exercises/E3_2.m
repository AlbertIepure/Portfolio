clear all
close all
clc

path (path, 'E:/IVC_labs_starting_point/functions');
ORIGINAL_image = double(imread('E:/IVC_labs_starting_point/data/images/lena.tif'));
[height width dimensions] = size(ORIGINAL_image);

tic
M = 3; % number of bits used for the quatization
QUANTIZED_image = LloydMax3(ORIGINAL_image, M);
toc

MSE = calcMSE (QUANTIZED_image, ORIGINAL_image, height, width, dimensions);
PSNR = calcPSNR(MSE, QUANTIZED_image);

figure
imagesc(ORIGINAL_image/256);
title('Original image');

figure
imagesc(QUANTIZED_image/256);
title('QUANTIZED image');
