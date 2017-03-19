clear all
close all
clc

path (path, 'F:/IVC_labs_starting_point/functions');
ORIGINAL_image = double(imread('F:/IVC_labs_starting_point/data/images/sail.tif'));
ORIGINAL_image = ORIGINAL_image/256;

TRANSFORM_image = ictRGB2YCbCr(ORIGINAL_image);

figure
imshow(ORIGINAL_image);
title('Original image');

figure
imshow(TRANSFORM_image);
title('TRANSFORM image');