function h_tot=impulse_response_channel(alpha,freq_pts)
%% Generate the impulse response in Time domain
% alpha: channel characteristic alpha= lambda_o^2*B^2*D*L/(4*pi*c)
% freq_pts: Number of Frequency points
% h_CD: column vector with time domain values


%% Sampling Frequency Response
omega = 0:2*pi/freq_pts:2*pi-2*pi/freq_pts;
for i=1:length(omega)
    if omega(i)<=pi
        omega(i)=omega(i);
    else
        omega(i)=omega(i)-2*pi;
    end
end
H_CD = exp(-1i*alpha*omega.^2);

%% IFFT and normalization
h = ifft(H_CD);
h_tot = h./max(abs(h));

% return column vector
h_tot = h_tot.';
stem(abs(h_tot));
end