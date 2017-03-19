function [pulsation,amplitude] = frequency_grid(f_pass, f_stop, f_sampling, N , K)
M = N-1;
no_points_total = M*K;
initial_stepsize = pi/(no_points_total-1);
omega_p = 2*pi*f_pass/f_sampling;
omega_s = 2*pi*f_stop/f_sampling;
omega = linspace(0,pi,M*K);
no_points_stopband = length(omega(omega<=omega_s));
no_points_passband = length(omega(omega>=omega_p));
stopband = linspace(0, omega_s, no_points_stopband);
passband = linspace(omega_p, pi, no_points_passband);

for i=1:no_points_stopband
    amplitude(i) = 0;
end;

for i=no_points_stopband+1:no_points_passband+no_points_stopband
    amplitude(i) = 1;
end;

pulsation = [stopband, passband];
end