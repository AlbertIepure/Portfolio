clear all; 
close all;
clc;
for M=[2 4 8]
    [numerator,denominator] = comb_filter(M);
    figure; 
    freqz(numerator,denominator);
    str = sprintf('M=%d',M);
    title(str);
end