Fc = 3200; %cutoff frequency in Hz
Fs = 8000;%sampling frequency in Hz
N = 50; % no. of taps of filter
window = 'rectangular'; % type of window

lpf(Fc,Fs,N,window);