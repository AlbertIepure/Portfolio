clear all

N = [100 200 500 1000];
M = 3;
mu_b = 2*pi/M;
SNR = 20;
R = 100;
d = 2;
mu_k = mu_b*0.1*logspace(0, 1, 11);

figure
c = ['b','r','k','g'];
for i = 1:length(N)
    for k = 1:length(mu_k)
        for r = 1:R
            m_k = [0; mu_k(k)];
            X = GetArrayOutput(M,m_k,SNR,N(i));
            m_k_est = Esprit(X,d);
            err(r) = norm(m_k-m_k_est)^2;
        end
        k
        m_k
        m_k_est
        e_k(k) = sqrt(mean(err)/d)/mu_k(k);
    end
    semilogy(mu_k/mu_b,e_k,c(i))
    hold on
end
legend('N = 100','N = 200','N = 500','N = 1000')
title('Relative root mean squared error as a function of spatial separation mu_k ')
xlabel('Spatial separation mu_k')
ylabel('Relative root mean squared error')