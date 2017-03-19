function h = design_filter(N,type,Fs,A)
%N: no of taps of filter
%type: FIR filter type (Type I, Type II, Type III and Type IV)
%Fs: sampling frequency
%A: function handle of desired amplitude response
M = N;
    if ((type==1)||(type==3))
        for k=0:(M-1)/2
            H(k+1) = A(k+1);
            H(k+1) = H(k+1)*exp(-1i*pi*k*(M-1)/M);
            if (type==3)
                H(k+1) = 1i*H(k+1);
            end
        end
        
    else %type 2 or type 4: M odd implies N even
         for k=0:M/2
            H(k+1) = A(k+1);
            H(k+1) = H(k+1)*exp(-1i*pi*k*(M-1)/M);
            if (type==4)
                H(k+1) = 1i*H(k+1);
            end
        end
    end
    
    if ((type==1)||(type==3))
        for k=1:(M-1)/2
            H(M-k+1) = conj(H(k+1));
        end
    end;
    
    if ((type==2)||(type==4))
        for k=1:M/2 - 1
            H(M-k+1) = conj(H(k+1));
        end
    end
    
    h = real(ifft(H,N));
    fvtool(h,1);
end