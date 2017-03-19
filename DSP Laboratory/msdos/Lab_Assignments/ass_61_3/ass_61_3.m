clear all
close all
clc

Fc = 3200; %cutoff frequency in Hz
Fs = 8000;%sampling frequency in Hz
N = 10; % no. of taps of filter
window = 'rectangular'; % type of window

hpf(Fc,Fs,N,window);
