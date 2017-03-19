clear all
close all
clc

path (path, 'F:/IVC_labs_starting_point/functions');
ORIGINAL_image = double(imread('F:/IVC_labs_starting_point/data/images/sail.tif'));
% ORIGINAL_image = ORIGINAL_image/256;

[height width dimensions] = size(ORIGINAL_image);

YCbCr_image = ictRGB2YCbCr(ORIGINAL_image);

upsampling_factor = 1;
downsampling_factor = 2;

for i=2:dimensions  
    DOWNSAMPLED_image_r(:,:,i) = (resample(YCbCr_image(:,:,i),upsampling_factor,downsampling_factor));
    DOWNSAMPLED_image_c(:,:,i) = (resample(DOWNSAMPLED_image_r(:,:,i).',upsampling_factor,downsampling_factor).');
end

upsampling_factor = 2;
downsampling_factor = 1;

for i=2:dimensions  
    UPSAMPLED_image_r(:,:,i) = (resample(DOWNSAMPLED_image_c(:,:,i),upsampling_factor,downsampling_factor));
    UPSAMPLED_image_c(:,:,i) = (resample(UPSAMPLED_image_r(:,:,i).',upsampling_factor,downsampling_factor).');
end

UPSAMPLED_image_c(:,:,1) = YCbCr_image(:,:,1);

RECONSTRUCTED_image = ictYCbCr2RGB(round(UPSAMPLED_image_c));

RECONSTRUCTED_image = RECONSTRUCTED_image/256;
ORIGINAL_image = ORIGINAL_image/256;

% DIFF_image = RECONSTRUCTED_image - ORIGINAL_image;

MSE = calcMSE (RECONSTRUCTED_image, ORIGINAL_image, height, width, dimensions);
PSNR = calcPSNR(MSE, ORIGINAL_image);

figure
imshow(ORIGINAL_image);
title('Original image');

figure
imshow(RECONSTRUCTED_image);
title('RECONSTRUCTED image');

% figure
% imshow(DIFF_image);
% title('DIFF image');

save('F:/IVC_labs_starting_point/exercises/chrominance_subsampling','PSNR');