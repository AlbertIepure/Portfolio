function h = lpf(Fc,Fs,N,window)
% Fc: cut-off frequency
% Fs: sampling frequency
% N: no. of taps of filter
% window: type of window
omega_c = 2*pi*Fc/Fs;
M = N/2;
if strcmp(window,'rectangular')
    for n = 0:2*M
        if n == M
            h(n+1) = omega_c/pi;
        else
            h(n+1) = (omega_c/pi)*(sin(omega_c*(n-M))/(omega_c*(n-M)));
        end;
    end;
end;

%     h = ifft(fft(h)/max(abs(fft(h))));%normalize the magnitude response such that it has the magnitude 
                                      %of approximately 0 dB in the pass-band
end