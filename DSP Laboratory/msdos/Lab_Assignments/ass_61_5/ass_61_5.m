clear all
close all
clc

Fc1 = 1500; %first cutoff frequency in Hz
Fc2 = 2000; %second cutoff frequency in Hz
Fs = 8000;%sampling frequency in Hz
N = 20; % no. of taps of filter

bsf(Fc1,Fc2,Fs,N);