function design_filter(F_c1,F_c2,F_stop1,F_stop2,F_s,a_s)
% F_c: cut-off frequency
% F_stop: stop-band edge frequency
% F_s: sampling frequency
% a_s: attenuation at frequency F_stop in dB

[H_total_lpf, zero_lpf, pole_lpf, impulse_lpf] = design_lpf(max([F_c1,F_c2]), max([F_stop1,F_stop2]), F_s, a_s);
[H_total_hpf, zero_hpf, pole_hpf, impulse_hpf] = design_hpf(min([F_c1,F_c2]), min([F_stop1,F_stop2]), F_s, a_s);

M = 1000; %number of points used in the plot
omega = 0:pi/M:pi-pi/M;%generate the pulsation in rad

H_total_bpf = H_total_lpf .* H_total_hpf;
H_total_bpf = H_total_bpf/max(H_total_bpf);
H_total_dB = 20*log10(H_total_bpf);


figure(1)
plot(omega/pi,H_total_dB);
title('Magnitude of the transfer function');
xlabel('Normalized frequency (*pi samples/sample)');
ylabel('Magnitude [dB]');
grid on;

%create impulse
impulse = zeros(1,M);
impulse(1) = 1;

zero_bpf = [zero_lpf, zero_hpf];
pole_bpf = [pole_lpf, pole_hpf];

for i=1:length(zero_bpf)
    b = [1 -zero_bpf(i)];
    a = [1 -pole_bpf(i)];
    impulse = filter(b,a,impulse);
end

figure(2)
stem(impulse);

zero_bpf = zero_bpf(:);
pole_bpf = pole_bpf(:);

figure(3)
zplane(zero_bpf, pole_bpf)
    
end