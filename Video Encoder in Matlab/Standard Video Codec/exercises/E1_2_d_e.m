clear all
close all
clc

path (path, 'F:/IVC_labs_starting_point/functions');
ORIGINAL_image = double(imread('F:/IVC_labs_starting_point/data/images/satpic1.bmp'));
ORIGINAL_image = ORIGINAL_image/256;

W1 = [1 2 1; 2 4 2; 1 2 1];

[height width dimensions] = size(ORIGINAL_image);

%% with prefiltering
for i=1:dimensions  
    FILTERED_image(:,:,i) = prefilterlowpass2d(ORIGINAL_image(:,:,i), W1);
    FILTERED_image_d_r(:,:,i) = downsample(FILTERED_image(:,:,i),2);
    FILTERED_image_d_c(:,:,i) = downsample(FILTERED_image_d_r(:,:,i).',2).';
    FILTERED_image_u_r(:,:,i) = upsample(FILTERED_image_d_c(:,:,i),2);
    FILTERED_image_u_c(:,:,i) = upsample(FILTERED_image_u_r(:,:,i).',2).';
    RECONSTRUCTED_image(:,:,i) = FILTERED_image_u_c(:,:,i);
    POSTFILTERED_img(:,:,i) = prefilterlowpass2d(RECONSTRUCTED_image(:,:,i), W1);
    POSTFILTERED_image(:,:,i) = POSTFILTERED_img(:,:,i).*4; %% to reconstruct the energy
end

MSE_w_prefilter = calcMSE (POSTFILTERED_image, ORIGINAL_image, height, width, dimensions);
PSNR_w_prefilter = calcPSNR(MSE_w_prefilter, POSTFILTERED_image);

figure('Name','LPF Comparison with prefiltering');

subplot(2,2,1);
imshow(ORIGINAL_image);
title('Original image');

subplot(2,2,2);
imshow(FILTERED_image);
title('Filtered image');

subplot(2,2,3);
imshow(RECONSTRUCTED_image);
title('Down and UP sampled image');

subplot(2,2,4);
imshow(POSTFILTERED_image);
title('Down and UP sampled image');

clear FILTERED_image_d_r FILTERED_image_d_c FILTERED_image_u_r FILTERED_image_u_c RECONSTRUCTED_image POSTFILTERED_img POSTFILTERED_image;
for i=1:dimensions  
    FILTERED_image_d_r(:,:,i) = downsample(ORIGINAL_image(:,:,i),2);
    FILTERED_image_d_c(:,:,i) = downsample(FILTERED_image_d_r(:,:,i).',2).';
    FILTERED_image_u_r(:,:,i) = upsample(FILTERED_image_d_c(:,:,i),2);
    FILTERED_image_u_c(:,:,i) = upsample(FILTERED_image_u_r(:,:,i).',2).';
    RECONSTRUCTED_image(:,:,i) = FILTERED_image_u_c(:,:,i);
    POSTFILTERED_img(:,:,i) = prefilterlowpass2d(RECONSTRUCTED_image(:,:,i), W1);
    POSTFILTERED_image(:,:,i) = POSTFILTERED_img(:,:,i).*4;
end

MSE_wo_prefilter = calcMSE (POSTFILTERED_image, ORIGINAL_image, height, width, dimensions);
PSNR_wo_prefilter = calcPSNR(MSE_wo_prefilter, POSTFILTERED_image);

figure('Name','LPF Comparison without prefiltering');

subplot(2,2,1);
imshow(ORIGINAL_image);
title('Original image');

subplot(2,2,2);
imshow(FILTERED_image);
title('Filtered image');

subplot(2,2,3);
imshow(RECONSTRUCTED_image);
title('Down and UP sampled image');

subplot(2,2,4);
imshow(POSTFILTERED_image);
title('Down and UP sampled image');



