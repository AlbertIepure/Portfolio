function output = sampling_rate_conversion(input,Fs,M,L)
% input: input signal from a user
% Fs: original sampling frequency
% M: downsampling factor
% L: upsampling factor
% output: resulting output signal
figure; plot((0:length(input)-1)*Fs/length(input),abs(fft(input)));
title('Before upsampling');
upsampled = zeros(L*length(input),1);
for i=1:length(input)
    upsampled(L*(i-1)+1) = input(i);
    upsampled(L*(i-1)+2:L*(i-1)+L) = zeros(L-1,1);
end
figure; plot((0:length(upsampled)-1)*L*Fs/length(upsampled),abs(fft(upsampled)));
title('After upsampling, before filtering');
cutoff = min(pi/M,pi/L);
lpf = low_pass_2(cutoff/pi);
filtered = filter(lpf,1,upsampled);
figure; plot((0:length(filtered)-1)*L*Fs/length(filtered),abs(fft(filtered)));
title('After filtering, before downsampling');
output = zeros(floor(length(filtered)/M),1);
for i=1:M:length(filtered)
    output((i-1)/M+1) = filtered(i);
end
figure; plot((0:length(output)-1)*L*Fs/M/length(output),abs(fft(output)));
title('After downsampling');
end
