function lpf(Fc,Fs,N,window)
% Fc: cut-off frequency
% Fs: sampling frequency
% N: no. of taps of filter
% window: type of window
omega_c = pi - 2*pi*Fc/Fs;
M = N/2;
if strcmp(window,'rectangular')
    for n = 0:2*M
        if n == M
            h_lp(n+1) = omega_c/pi;
        else
            h_lp(n+1) = (omega_c/pi)*(sin(omega_c*(n-M))/(omega_c*(n-M)));
        end;
        h_hp(n+1) = cos(pi*n) * h_lp(n+1);
    end;
end;

    h_hp = ifft(fft(h_hp)/max(abs(fft(h_hp))));%normalize the magnitude response such that it has the magnitude 
                                               %of approximately 0 dB in the pass-band
    
%     freqz(h_hp,1);
%     saveas(gcf,'magnitude_and_frequency_plot.jpg');
    fvtool(h_hp,1);
    zplane(h_hp);
end