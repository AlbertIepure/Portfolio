function [sample_time,signal] =gnss_signal(tau)
%% This function calculates a sample signal
% tau: time-delay of the signal
% signal: signal value in time domain
% sample points of the signal
%%----------------------------%%
%% Parameters
% Code length
Lc=1023;

% Bandwidth
B=1.023e6;

% Chip-length
Tc=1/B;

% Number of samples
N=2*Lc;

% basic frequency
f0=2*B/N;

%% Calculations
% sampling points
sample = ((-N/2):(N/2-1))';
sample_freq=f0*sample;
sample_time=sample./f0;

% Code
load('code.mat')
code=fft(code);
IDSPEC=repmat(code,2,1);
IDSPEC=2*IDSPEC;
% spectrum
PULSE = fftshift(sinc(sample_freq*Tc));
PULSE=PULSE.*IDSPEC;

% time-shift
T=fftshift(exp(-1i*sample*2*pi*B/N*tau));

% signal
signal=real(ifft(T.*PULSE));

end

