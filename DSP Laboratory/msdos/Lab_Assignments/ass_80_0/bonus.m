N=5;
n=0:20;
z=(1/N)*(1+exp(1i*(2*pi/N).*n)+exp(1i*(2*pi/N).*2*n)+exp(1i*(2*pi/N).*3*n)+exp(1i*(2*pi/N).*4*n));
stem(abs(z))