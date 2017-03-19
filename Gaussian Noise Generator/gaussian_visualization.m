clear all
close all
clc

g = textread('gaussian_distribution.txt','%f');

variance_r = var(g);
mean_r = mean(g);

% plot the Gaussian distribution
figure
hist(g,length(g)/100);

