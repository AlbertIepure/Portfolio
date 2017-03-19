clear all
close all
clc

for k=0:6
    s_k(k+1)=1000*pi*exp(1j*pi/2)*exp(1j*(2*k+1)*pi/14);
end

s_k_re=real(s_k);
s_k_im=imag(s_k);

z = [];
p = s_k;
K = 1;

G = zpk(z,p,K);
[num,den]=tfdata(G,'v');
G2=tf(num,den)

figure(1);
freqs(num,den);

figure(2);
H = tf(num,den); 
sgrid;
pzmap(H);
grid on;

figure(3);
stem(s_k_re,s_k_im);