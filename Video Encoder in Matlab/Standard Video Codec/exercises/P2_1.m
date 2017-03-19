clear all
close all
clc

ORIGINAL_image = imread('E:/IVC_labs_starting_point/data/images/satpic1.bmp');

figure
imhist(ORIGINAL_image(:)); %vectorize the matrix: convert all the three layers into a column vector