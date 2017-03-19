clear all
close all
clc

% I = imread('D:\Dropbox\München\MSCE\Thesis Albert\Features\Pics\Small\dground.jpg');
I = imread('D:\Dropbox\München\MSCE\Image_Database\G7ProfiledFoam_5.jpg');
I = imread('D:\Dropbox\München\MSCE\Original Brodatz\D111.gif');
% I=rgb2gray(I);
% YCBCR = rgb2ycbcr(I);
% Y = YCBCR(:,:,1);
% [Fdirectionality,theta] = directionality(I);
% Solidity = regularity(I);

% Let's compute and display the histogram.
h=figure;
imhist(I)
ylim('auto');
% xlim([0 260])
% [pixelCount, grayLevels] = imhist(I);
% bar(grayLevels, pixelCount); % Plot it as a bar chart.
% grid on;
title('Histogram of image I');
xlabel('Gray level');
ylabel('Number of pixels');
% xlim([0 grayLevels(end)]); % Scale x axis manually.