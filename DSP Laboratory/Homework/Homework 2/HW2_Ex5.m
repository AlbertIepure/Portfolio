tau = 2;
omega = [-50:0.001:50];
arg = pi*omega*tau/2;
plot(omega, (tau*sin(arg))./arg);
