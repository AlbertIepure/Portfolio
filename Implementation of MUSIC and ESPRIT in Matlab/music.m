clear all

M = 12;
N = 100;
d = 3;
mu_b = 2*pi/M;

figure(1)
title('Two beamwidth separation, SNR=10 dB')
power_spectra(M,N,d,2  ,mu_b,10);
figure(2)
title('One beamwidth separation, SNR=10 dB')
power_spectra(M,N,d,1  ,mu_b,10);
figure(3)
title('One half beamwidth separation, SNR=10 dB')
power_spectra(M,N,d,0.5,mu_b,10);
figure(4)
title('One tenth beamwidth separation, SNR=10 dB')
power_spectra(M,N,d,0.1,mu_b,10);
figure(5)
title('Two beamwidth separation, SNR=20 dB')
power_spectra(M,N,d,2  ,mu_b,20);
figure(6)
title('One beamwidth separation, SNR=20 dB')
power_spectra(M,N,d,1  ,mu_b,20);
figure(7)
title('One half beamwidth separation, SNR=20 dB')
power_spectra(M,N,d,0.5,mu_b,20);
figure(8)
title('One tenth beamwidth separation, SNR=20 dB')
power_spectra(M,N,d,0.1,mu_b,20);