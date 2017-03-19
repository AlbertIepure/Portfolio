clear all;
close all;
clc;

load('x.mat');

figure(1);
freqz(x,1);
saveas(gcf,'signal_plus_noise.jpg');

Fs = 8000; %sampling frequency, in Hz
omega_zero = pi*0.25;%normalized pulsation of the noise
f_noise = Fs*omega_zero/(2*pi);%frequency of the noise component
r = 0.9;
z = exp(1i*pi);

b0 = power(abs(1 - 2*cos(omega_zero) * power(z,-1) + power(z,-2))/abs(1 - 2*r*cos(omega_zero) * power(z,-1) + power(z,-2)*power(r,2)),-1);

figure(2);
freqz(b0.*[1,  -2*cos(omega_zero), 1], [1, - 2*r*cos(omega_zero), power(r,2)]);

fvtool(b0*[1  -2*cos(omega_zero) 1], [1 - 2*r*cos(omega_zero) power(r,2)]);

y = filter(b0.*[1,  -2*cos(omega_zero), 1], [1, - 2*r*cos(omega_zero), power(r,2)],x);

figure(4);
freqz(y,1);
saveas(gcf,'signal_without_noise_r_0.9.jpg');

