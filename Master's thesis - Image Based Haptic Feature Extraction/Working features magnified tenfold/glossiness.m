function [ratio,s] = glossiness(RGB)

I = rgb2gray(RGB);
YCbCr = rgb2ycbcr(RGB);
Y = YCbCr(:,:,1);

I= imadjust(I);

H = imhist(I);
H_Y = imhist(Y);
title('Histogram of the luminance layer')
s = skewness(H_Y(:));

t_min = 250;
t_max = 256;

% Fglossiness = sum(H(t_min:end))/sum(H);
ratio = trapz([t_min:t_max],H(t_min:t_max))/trapz([1:t_max],H(1:t_max));
