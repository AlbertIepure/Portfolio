clear all;
close all;
clc;

Fc = 800; %cutoff frequency in Hz
Fs = 8000;%sampling frequency in Hz
N = 50; % no. of taps of filter
window = 'rectangular'; % type of window
h = lpf(Fc,Fs,N,window);

M = N+1; % numebr of filter coefficients

% y = rectwin(M);
y = hamming(M);
% y = hanning(M);
% y = bartlett(M);
% y = tukeywin(M);

% y = ifft(fft(y)/max(abs(y)));

y_mult = (y.').*h;

% y_mult = ifft(fft(y_mult)/max(abs(fft(y_mult))));
a = freqz(y_mult);
count = length(a);
magnitude = abs(a);

plot([0:pi/count:pi-pi/count]./pi,magnitude);
fvtool(h,1,y_mult,1);
legend('Rectangular window', 'Hamming window');