close all
clear all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Input parameters set by the user
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 100000;
desired_mean = 0;
desired_variance = 2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Start of the algorithm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r = rand(N,1); % start by generating N uniform-distributed numbers in [0,1]

variance_r = var(r);
mean_r = mean(r);

% plot the uniform distribution
figure
hist(r,N/100);

% Box-Muller method
for i=1:2:length(r)
    u1 = r(i);
    u2 = r(i+1);
    n(i) = sqrt(-2*log(u1))*cos(2*pi*u2);
    n(i+1) = sqrt(-2*log(u1))*sin(2*pi*u2);
end

variance_n = var(n);
mean_n = mean(n); 

% plot the Gaussian distribution 
figure
hist(n,N/100);

% adjust the mean to zero
n = n - mean(n);
variance_n = var(n);
mean_n = mean(n); 

% adjust the variance to the desired value
n = n./sqrt(variance_n); % obtain unit variance by dividing the values to the standard deviation, i.e. sqrt(variance)
n = n.*sqrt(desired_variance); %multiply the values which have a standard deviation of 1 by the desired standard deviation
variance_n = var(n); %verify that the actual variance matches the desired one
mean_n = mean(n); %mean should be zero

% adjust the mean
n = n + desired_mean; %add the desired mean to the zero mean values
variance_n = var(n); %the variance should be left unchanged
mean_n = mean(n);  %the mean should match the desired one

% plot the distribution of desired mean and variance
figure
hist(n,N/100);