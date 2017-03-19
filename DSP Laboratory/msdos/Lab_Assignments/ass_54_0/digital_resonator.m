clear all;
close all;
clc;
omega_zero = pi/4;
r = 0.99;
z = exp(1i*omega_zero);
b0 = abs(1 - 2*r*cos(omega_zero) * power(z,-1) + power(r,2) * power(z,-2));
fvtool(b0, [1, -2*r*cos(omega_zero), power(r,2)]);
saveas(gcf,'results_0.99.jpg');
