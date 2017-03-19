clear all
close all
clc

path (path, 'F:/IVC_labs_starting_point/functions');
ORIGINAL_image = double(imread('F:/IVC_labs_starting_point/data/images/satpic1.bmp'));
ORIGINAL_image = ORIGINAL_image/256;

W1 = [1 2 1; 2 4 2; 1 2 1];

[height width dimensions] = size(ORIGINAL_image);

tic

for i=1:dimensions  
    FILTERED_image(:,:,i) = prefilterlowpass2d(ORIGINAL_image(:,:,i), W1);
    DIFF_image(:,:,i) = FILTERED_image(1:height,1:width,i) - ORIGINAL_image(:,:,i);
    DIFF_image(:,:,i) = abs(DIFF_image(:,:,i));
end

toc


figure('Name','LPF Comparison');

subplot(1,3,1);
imagesc(ORIGINAL_image);
title('Original image');

subplot(1,3,2);
imagesc(FILTERED_image);
title('Filtered image');

subplot(1,3,3);
imagesc(DIFF_image);
title('Difference image');


