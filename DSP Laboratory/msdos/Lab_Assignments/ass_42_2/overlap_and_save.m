function output = overlap_and_save(input, h, N)
    M = length(input); %length of the input sequence
    K = length(h);     %length of the filter
    L = N-K+1;         
    output = zeros(1, M+K-1); %the length of the convolution of a signal of length M with a signal of length K is M+K-1
    input = [zeros(1,K-1), input, zeros(1,K-1)]; %append K-1 zeros at the beginning and at the end
    a = length(input); %length of the input zero padded array
    H = fft(h, N); %FFT transform of the FIR filter
    segments = ceil((length(input)-N)/L);
    input = [input, zeros(1,segments*L+N-a)];
    b = length(input);
    
    for i=1:segments+1
        for j=1:N
            if (j+(i-1)*L < a)
                partial_input(j) = input(j+(i-1)*L);
            else
                partial_input(j) = 0;
            end;
        end;
        
        partial_output = ifft(fft(partial_input,N).*H,N);
        
        for j=K:N
            if (i-1)*L+j-K+1<=M+K-1
                output((i-1)*L+j-K+1) = partial_output(j);
            end;
        end;
    end;
end
    
    
            
    
    
    
    