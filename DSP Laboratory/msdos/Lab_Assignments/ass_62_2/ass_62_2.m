clear all
close all
clc

f_pass = 2000;
f_stop = 2200;
f_sampling = 8000;
N = 20;
K = 16; %choose K integer number in the interval [8;16]
filter_type = 'Type IV';

[w,D,W] = frequency_grid(f_pass,f_stop,f_sampling,N, K);
l=length(w);
design_filter(N,filter_type,f_sampling,w(2:l),D(2:l),W(2:l));
%ignoring the first element in the weight function because of the < sign
%implies ignoring also the first element for D and w because all vectors
%must be of the same length
                                                          

