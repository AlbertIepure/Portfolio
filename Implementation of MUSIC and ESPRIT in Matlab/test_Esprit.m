clear all

N = 100;
M = 12;
mu_b = 2*pi/M;
mu = [-1; -0.5; 0.6; 1.5]*mu_b

SNR = 20;
X = GetArrayOutput(M,mu,SNR,N);
mu_est1 = Esprit(X,length(mu))

SNR = 80;
X = GetArrayOutput(M,mu,SNR,N);
mu_est2 = Esprit(X,length(mu))
