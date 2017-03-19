function [H_total, zero, pole, impulse] = design_lpf(F_c,F_stop,F_s,a_s)
% F_c: cut-off frequency
% F_stop: stop-band edge frequency
% F_s: sampling frequency
% a_s: attenuation at frequency F_stop in dB

omega_c = 2*pi*F_c/F_s;
omega_s = 2*pi*F_stop/F_s;

Omega_c = 2*tan(omega_c/2);
Omega_s = 2*tan(omega_s/2);

delta_s = power(10,-a_s/20);

N = ceil(log10(power(delta_s,-2)-1)/(2*log10(Omega_s/Omega_c)));

M = 1000; %number of points used in the plot
omega = 0:pi/M:pi-pi/M;%generate the pulsation in rad
z = exp(1i*omega);

H_total = ones(1,length(omega));
for k = 0:N-1
    s(k+1) = Omega_c * exp(1i*pi/2) * exp(1i*(2*k+1)*pi/(2*N));
    z_k(k+1) = (s(k+1)+2)/(2-s(k+1));
    H_z(k+1,:) = (z+1)./(z-z_k(k+1));
    H_total = H_total .* H_z(k+1,:);
end


H_total = abs(H_total)/max(abs(H_total));
H_total_dB = 20*log10(H_total);

% figure(1)
% plot(omega/pi,H_total_dB);
% title('Magnitude of the transfer function');
% xlabel('Normalized frequency (*pi samples/sample)');
% ylabel('Magnitude [dB]');
% grid on;

%create impulse
impulse = zeros(1,M);
impulse(1) = 1;

zero = -ones(1,N); %the zeros of the LPf are -1
pole = z_k;       %the poles of the LPF

for i=1:N
    b = [1 -zero(i)];
    a = [1 -pole(i)];
    impulse = filter(b,a,impulse);
end

% figure(2)
% stem(impulse);
% 
% figure(3)
% zplane(zero.', pole.')
    
end