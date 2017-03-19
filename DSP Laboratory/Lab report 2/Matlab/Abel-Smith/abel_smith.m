function [ rho,theta ] = abel_smith( alpha,N_IIR )
% The filter coefficients for cascaded filter 
% rho: radius
% Theta: phase
% xi: facultative correction factor between 0.75 and 0.85

xi = 0.8;
omega_seg = abel_smith_divide(alpha, N_IIR);

for i=1:N_IIR
    theta(i) = 0.5 * (omega_seg(i) + omega_seg(i+1));
    delta(i) = 0.5 * (omega_seg(i+1) - omega_seg(i));
    miu(i) = (1 - xi*cos(delta(i)))/(1-xi);
    rho(i) = miu(i) - sqrt(power(miu(i),2)-1);
end

