%% Project 1: Time-Delay Estimation in GNSS %%
% you do not need the code file %

%% Load measurements: received signal
load('proj_1_sample.mat');

%% Correlation
% sampling rate
f=1.023e6;

% Calculation
% Here goes your code

%Parallel Code Phase Search Acquisition
tic
pace=1/f;
tau = 0:pace:size(REC_SIGNAL)*pace-pace;
y_freq_domain = (fft(REC_SIGNAL));
[time, c] =gnss_signal(0);
c_freq_domain= conj(fft(c));
correlation = (ifft(y_freq_domain.*c_freq_domain)).^2;
toc 

[maxCorr,maxA] = max(real(correlation));
tau_shift = tau(maxA);
tau_shift_chips = tau_shift/pace;

%% Please print your result

figure
plot(tau,correlation); title('Correlation of y(n) with c(tau)'); xlabel('tau [s]'); ylabel ('Correlation result');

