function bit_error_rate(h_opt,g_eq)

%% Simulation parameters
% QPSK, modulation Format
M = 4; 
hMod = modem.pskmod('M', M, 'PhaseOffset', pi/4, 'SymbolOrder', 'Gray','InputType', 'Bit');

% QPSK, demodulation format
hDemod = modem.pskdemod('M', M, 'PhaseOffset', pi/4,...
    'SymbolOrder', 'Gray', 'OutputType', 'Bit');

%% Send an impulse through an optical channel. Convolve the output of the channel with the equalizer.
%% Finding the index where the impulse occurs after the channel. 
gh=conv(h_opt,g_eq);
% subplot(2,1,1)
% stem(abs(h_opt))
% title('Channel Impulse Response')

[val index]=max(abs(gh));
% subplot(2,1,2)
% stem(abs(gh))
% title('Channel with Equalizer Impulse Response')

%% Simulation
SNR=-4:2:12;
len_SNR=length(SNR);

% Original message
numSymb = 4*25000;  % number of binary symbols  
msg_orig = (sign(randn(numSymb,1))+1)/2; 

% QPSK modulation
out_qpsk = modulate(hMod,msg_orig);
        
% Signal through the optical channel
out_channel=conv(h_opt,out_qpsk);        
        
% AWG Noise
channel_noise = (randn(length(out_channel),1)+1i*randn(length(out_channel),1))/sqrt(2);

for j=1:len_SNR       
        
        % Channel + Noise    
        sigma_n=1/sqrt(10^(SNR(j)/10));
        out_channel_plus_noise=out_channel+channel_noise*sigma_n;
        
        % Equalizer
        tstart0=tic;
        out_eq_conv=conv(g_eq,out_channel_plus_noise);
        telapsed0=toc(tstart0);
        
        tstart1=tic;
        out_eq_conv=(overlap_and_save(out_channel_plus_noise',g_eq',64))';
        telapsed1=toc(tstart1);
        
%         tstart2=tic;
%         out_eq_conv=(convolution(out_channel_plus_noise',g_eq'))';
%         telapsed2=toc(tstart2);
        
        % Parsing out the desired signal which was send before the CD channel
        parsed_out_eq_conv=out_eq_conv(index:index+length(out_qpsk)-1);
               
        % QPSK demodulation
        msg_demod = demodulate(hDemod, parsed_out_eq_conv);
                
        % Bit Error Rate
        [errorBit(j) ratioBit(j)] = biterr(msg_orig, msg_demod);        

end

figure
semilogy(SNR,ratioBit)
hold on
semilogy(SNR,0.5*erfc(sqrt(10.^(0.1*SNR)/2)),'--r')
grid
title('BER vs SNR')
xlabel('SNR (dB)')
ylabel('BER')
legend('Convolution Method','AWGN Channel')

end