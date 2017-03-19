function h_tot=impulse_response_channel(alpha,freq_pts)
%% Generate the impulse response in Time domain
% alpha: channel characteristic alpha= lambda_o^2*B^2*D*L/(4*pi*c)
% freq_pts: Number of Frequency points
% h_CD: column vector with time domain values


%% Sampling Frequency Response
omega = -pi:2*pi/freq_pts:pi-2*pi/freq_pts;
H_CD = exp(-1i*alpha*omega.^2);
H_CD = ifftshift(H_CD);

%% IFFT and normalization

h_CD = ifft(H_CD, freq_pts);
h_CD = h_CD(:); %assure that it is a column vector
h_tot = fftshift(h_CD);

% return column vector
stem(abs(h_tot));
end