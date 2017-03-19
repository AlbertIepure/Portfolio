function power_spectra(M,N,d,b,mu_b,SNR)

mu = [-b*mu_b; 0; b*mu_b];
X = exp(i*([0:M-1]')*mu')*(sign(randn(d,N))+i*sign(randn(d,N)))/(sqrt(2)) + sqrt(d)*(randn(M,N)+i*randn(M,N))/(sqrt(2)*10^(SNR/20));
Rxx_est = X*X'/N;
[U,D] = SortedEig(Rxx_est);
U0 = U(:,d+1:M);

mu = linspace(-3*mu_b, 3*mu_b, 200)';
k = 0:M-1;
n = 1:N;
for l = 1:length(mu)
    a = exp(i*([0:M-1]')*mu(l));
    S_MVDR(l) = 1/(a'*inv(Rxx_est)*a);
    S_PER(l) = norm(abs(a'*X))^2/(N*M^2);
    S_MUSIC(l) = (norm(a)/norm(a'*U0))^2;
end

plot(mu, S_MVDR/max(S_MVDR), 'r')
hold on
plot(mu, S_PER/max(S_PER), 'g')
hold on
plot(mu, S_MUSIC/max(S_MUSIC), 'b')
legend('MVDR Spectrum','Fourier Spectrum', 'MUSIC Spectrum')
xlabel('Spatial frequency mu')
ylabel('Normalized to max value power spectrum')