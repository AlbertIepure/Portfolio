function design_filter(F_c1,F_c2,F_stop1,F_stop2,F_s,a_s)
% F_c: cut-off frequency
% F_stop: stop-band edge frequency
% F_s: sampling frequency
% a_s: attenuation at frequency F_stop in dB

[H_total_lpf, zero_lpf, pole_lpf, impulse_lpf] = design_lpf(min([F_c1,F_c2]), min([F_stop1,F_stop2]), F_s, a_s);
[H_total_hpf, zero_hpf, pole_hpf, impulse_hpf] = design_hpf(max([F_c1,F_c2]), max([F_stop1,F_stop2]), F_s, a_s);

M = 1000; %number of points used in the plot
omega = 0:pi/M:pi-pi/M;%generate the pulsation in rad

H_total_spf = H_total_lpf + H_total_hpf;
H_total_spf = H_total_spf/max(H_total_spf);
H_total_dB = 20*log10(H_total_spf);


figure(1)
plot(omega/pi,H_total_dB);
title('Magnitude of the transfer function');
xlabel('Normalized frequency (*pi samples/sample)');
ylabel('Magnitude [dB]');
grid on;

% impulse response
impulse_sbf = conv(impulse_lpf,impulse_hpf);

figure(2)
stem(impulse_sbf);

ZERO_LPF = poly(zero_lpf);
ZERO_HPF = poly(zero_hpf);
POLE_LPF = poly(pole_lpf);
POLE_HPF = poly(pole_hpf);
zero_sbf = roots(conv(ZERO_LPF,POLE_HPF) + conv(ZERO_HPF,POLE_LPF));
pole_sbf = [pole_lpf, pole_hpf];
zero_sbf = zero_sbf(:);
pole_sbf = pole_sbf(:);

figure(3)
zplane(zero_sbf, pole_sbf)
    
end