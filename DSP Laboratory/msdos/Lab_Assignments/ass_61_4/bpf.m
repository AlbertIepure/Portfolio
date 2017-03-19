function bpf(Fc1,Fc2,Fs,N)
% Fc: cut-off frequency
% Fs: sampling frequency
% N: no. of taps of filter
% window: type of window
omega_c1 = 2*pi*Fc1/Fs;
omega_c2 = 2*pi*Fc2/Fs;

M = N/2;

for n = 0:2*M
    if n == M
        h(n+1) = (omega_c2-omega_c1)/pi;
    else
        h(n+1) = (omega_c2/pi)*(sin(omega_c2*(n-M))/(omega_c2*(n-M))) - (omega_c1/pi)*(sin(omega_c1*(n-M))/(omega_c1*(n-M)));
    end;
end;

y = hamming(N+1);

y_mult = (y.').*h;
y_mult = ifft(fft(y_mult)/max(abs(fft(y_mult))));

y_mult = ifft(fft(y_mult)/max(abs(fft(y_mult))));%normalize the magnitude response such that it has the magnitude 
                                                 %of approximately 0 dB in the pass-band
    
%     freqz(h,1);
%     saveas(gcf,'magnitude_and_frequency_plot.jpg');
    fvtool(h,1,y_mult,1);
    legend('BPF with rectangular window','BPF with Hamming window');
end