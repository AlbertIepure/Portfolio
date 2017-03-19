clear all
close all
clc

%% 1. Low-pass Filter
Fp = 800;
Fstop = 1000;
Fs = 8000;
N = 10;
type=2;

A_lpf = amplitude_response_lpf(N,Fs,Fp,Fstop);
design_filter(N,type,Fs,A_lpf);

%% 2. High-pass Filter
Fp = 3100;
Fstop = 3000;
Fs = 8000;
N = 10;
type=4;

A_hpf = amplitude_response_hpf(N,Fs,Fp,Fstop);
design_filter(N,type,Fs,A_hpf);

%% 3. Differentiator
Fp = 2000;
Fstop = 2200;
Fs = 8000;
N = 20;
type=4;

A_diff = amplitude_response_diff(N,Fs,Fp,Fstop);
design_filter(N,type,Fs,A_diff);