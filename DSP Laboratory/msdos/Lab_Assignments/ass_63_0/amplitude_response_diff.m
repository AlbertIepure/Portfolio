function A = amplitude_response_diff(N,Fs,Fp,Fstop)
if (mod(N,2)==0)
    k=0:N/2;
else
    k=0:(N-1)/2;
end

omega_k = 2*pi*k/N;
omega_k_normalized = 2*k/N;
f_k = omega_k*Fs/(2*pi);

for i=1:length(f_k)
    if (f_k(i)<=Fp)
        A(i)=omega_k(i);
    elseif (f_k(i)>Fstop)
        A(i)=omega_k(i);
    elseif ((f_k(i)<Fstop)&&(f_k(i+1)>Fstop))
        A(i)=0.4;
    elseif ((f_k(i)<Fstop)&&(f_k(i+1)<Fstop))
        A(i)=0.59;
        A(i+1)=0.11;
        i=i+1;
    end;
end;

end
