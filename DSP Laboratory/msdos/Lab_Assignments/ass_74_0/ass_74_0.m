clear all
close all
clc

F_c1 = 1500; %cut-off frequency1
F_c2 = 2000; %cut-off frequency2
F_stop1 = 1550; %stop-band edge frequency1
F_stop2 = 1950; %stop-band edge frequency2
F_s = 8000; % sampling frequency
a_s = 40; % attenuation at frequency F_stop in dB

design_filter(F_c1,F_c2,F_stop1,F_stop2,F_s,a_s);