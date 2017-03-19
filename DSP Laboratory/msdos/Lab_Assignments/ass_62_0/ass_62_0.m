clear all
close all
clc

f_pass = 800;
f_stop = 1000;
f_sampling = 8000;
N = 10;
K = 16; %choose K integer number in the interval [8;16]
filter_type = 'Type II';

[w,D] = frequency_grid(f_pass,f_stop,f_sampling,N, K);
W = ones(1,length(w));%because delta_s and delta_p are the same
design_filter(N,filter_type,f_sampling,w,D,W);

