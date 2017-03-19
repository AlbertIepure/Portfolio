function [pulsation,amplitude] = frequency_grid(f_pass, f_stop, f_sampling, N , K)
M = N-1;
no_points_total = M*K;
initial_stepsize = pi/(no_points_total-1);
omega_p = 2*pi*f_pass/f_sampling;
omega_s = 2*pi*f_stop/f_sampling;
omega = linspace(0,pi,M*K);
no_points_passband = length(omega(omega<=omega_p));
no_points_stopband = length(omega(omega>=omega_s));
passband = linspace(0,omega_p, no_points_passband);
stopband = linspace(omega_s, pi, no_points_stopband);

for i=1:no_points_passband
    amplitude(i) = 1;
end;

for i=no_points_passband+1:no_points_passband+no_points_stopband
    amplitude(i) = 0;
end;

pulsation = [passband,stopband];
end