function X = GetArrayOutput(M,mu,SNR,N)

    d = length(mu);
    X = exp(i*([0:M-1]')*mu')*randn(d,N) + sqrt(d)*(randn(M,N))*10^(-SNR/20);

end

