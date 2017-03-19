function output=conv_anyinput_allpass_eqaulaizer(rho,theta,phi,input)
%% Convolution of any Filter specified by rho/theta/ Phi with input
% rho: column vector with N_IIR filter radii
% theta: column vector with N_IIR filter phases
% phi: Phase correction term phi_0
% input: signal to be filtered
% output:filtered signal
% Hint: Use filter() function

input = input(:);
for k=1:length(rho)
    b = [-rho(k)*exp(-1i*theta(k)), 1];
    a = [1, -rho(k)*exp(1i*theta(k))];
    output = filter(b,a,input);
    input = output;
end

output = exp(-1i*phi).*output;
stem(abs(output));
end