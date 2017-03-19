function kaiser_window (omega_c, delta_omega, delta)
% Normalized cut-off frequency omega_c
% passband cutoff frequency omega_p of the low-pass filter is defined to be the highest frequency
% such that |H (?omega)| ? 1?delta. 
% The stopband cutoff frequency ?omega_s is defined to be the lowest frequency
% such that |H (omega)| ? ?.
% Transition bandwidth delta_omega = omega_s - omega_p
% Peak approximation error delta

A = -20*log10(delta);

if A <= 21
    beta = 0;
else
    if A <= 50
        beta = 0.5842 * power(A - 21, 0.4) + 0.07886 * (A - 21);
    else
        beta = 0.1102 * (A - 8.7);
    end;
end;

M = ceil((A-8)/(2.285 * delta_omega));
alpha = M/2;

for n = 0:M
    h(n+1) = (sin(omega_c *(n - alpha)) / (pi*(n-alpha))) * besseli(0,beta*power(1-power((n-alpha)/alpha,2),0.5))/besseli(0,beta);
end;

fvtool(h,1);


end
