clear all
close all
clc

path(path, 'F:/IVC_labs_starting_point/functions');

ORIGINAL_image = double(imread('F:/IVC_labs_starting_point/data/images/sail.tif'));
ORIGINAL_image = ORIGINAL_image/256;

[height width dimensions] = size(ORIGINAL_image);

downsampling_factor = 2;
upsampling_factor = 2;

DOWNSAMPLED_image = resampling(ORIGINAL_image, downsampling_factor, 1); 
RECONSTRUCTED_image = resampling(DOWNSAMPLED_image, 1, upsampling_factor);

MSE = calcMSE (RECONSTRUCTED_image, ORIGINAL_image, height, width, dimensions);
PSNR = calcPSNR(MSE, ORIGINAL_image);

figure
imshow(ORIGINAL_image);
title('Original image');

figure
imshow(RECONSTRUCTED_image);
title('RECONSTRUCTED image');

save('F:/IVC_labs_starting_point/exercises/RGB_subsampling_CIF','PSNR');