Fs = 16000;
f = Fs/20:Fs/20:Fs/2;
magn_p2p = [2 1.641 1.219 0.765 0.437 0.265 0.235 0.314 0.368 0.221];
magn = magn_p2p/2;
figure
plot(f, magn);
title('LPF frequency characteristic');
xlabel('Frequency in Hz');
ylabel('Amplitude in volts');