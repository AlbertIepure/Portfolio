clear all;
close all;
clc;

N = 50; %number of taps
M = N+1; % numebr of filter coefficients

% y = rectwin(M);
% y = hamming(M);
% y = hanning(M);
% y = bartlett(M);
y = tukeywin(M);

y_fft = fft(y);
y_normalized = ifft(y_fft/max(abs(y_fft)));
fvtool(y_normalized,1);