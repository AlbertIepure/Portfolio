function main_program()

clc
close all

%% CD channel is generated with the following configuration 
    % L=100;                    % length of fiber in kilometers;
    % lambda_0=1550nm           % operating wavelength
    % D=17ps/nm/km              % dispersion parameter

load h_CD;

%% Configuration Parameters For the Equalizer
I_eq=2^4;          % no_of_taps_equalizer (maximum value is at most 1024). I_eq must be taken as power of 2.

%% Generating equalizer impulse response
g_CD=equalizer_generation(I_eq);

%% calculating BER
bit_error_rate(h_CD,g_CD)

end