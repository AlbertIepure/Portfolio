clear all
close all
clc

B =56;% GHz
lambda_0 = 1550; %nm
D=16; %ps/nm/km
L = 23; %km
c = 299792458; %m/s
alpha = lambda_0^2*B^2*D*L/(4*pi*c*1000);
N_IIR = ceil(lambda_0^2*B^2*D*L/(2*c*1000));
[rho,theta] = abel_smith(alpha,N_IIR);