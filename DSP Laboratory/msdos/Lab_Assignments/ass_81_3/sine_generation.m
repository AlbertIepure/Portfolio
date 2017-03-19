clear all
close all
clc

k=5;
n=16;
for i=0:n-1
    a(i+1) = floor(1000*sin(2*pi*k*i/n));
end

