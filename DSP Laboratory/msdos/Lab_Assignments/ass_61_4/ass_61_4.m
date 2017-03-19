clear all
close all
clc

Fc1 = 500; %first cutoff frequency in Hz
Fc2 = 1500; %second cutoff frequency in Hz
Fs = 8000;%sampling frequency in Hz
N = 20; % no. of taps of filter

bpf(Fc1,Fc2,Fs,N);