close all
clear all
clc

%% input
n=0:5000;
f=1000;
Fs=8000;
input=sin((2*pi*f/Fs).*n);

%% ratio
M=4;
L=3;

%%
output = sampling_rate_conversion(input,Fs,M,L)