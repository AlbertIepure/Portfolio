function design_filter(N,type,Fs,w,D,W)
%N: no of taps of filter
%type: FIR filter type (Type I, Type II, Type III and Type IV)
%Fs: sampling frequency
%w: frequency grid (vector of pulsation points in radians)
%D: vector containing the values of the desired amplitude
%response at the frequencies specified in f
%W: vector containing the values of the weighting function at the
%frequencies specified in f

M= N-1;

if strcmp(type,'Type IV')
    Q = sin(w./2);
    L=(M-1)/2;
end;

W_q = W.*Q;
D_q = D./Q;


W_q_matrix = diag(W_q);
d_q = D_q.';

for i=1:length(w)
    for j=1:L+1
        if j==1
            U(i,j) = 1;
        else
            U(i,j) = cos((j-1)*w(i));
        end;
    end;
end;

p = inv((U.'*power(W_q_matrix,2)*U))*U.'*power(W_q_matrix,2)*d_q;

if (strcmp(type, 'Type IV'))
    for m=1:L+1
        if m==1
            b(m) = p(1)-0.5*p(2);
        else
            if m==L+1
                b(m) = 0.5*p(L+1);
            else
                b(m) = 0.5*(p(m-1+1)-p(m+1));
            end;
        end;
    end;
end;

for m=1:L+1
    h(L+1-m+1) = 0.5*b(m);
end;

h = [h, -fliplr(h)];%because the filter has an antisymmetric impulse response

h = ifft(fft(h)/max(abs(fft(h))));%normalize the magnitude response such that it has the magnitude 
                                      %of approximately 0 dB in the pass-band
fvtool(h,1);  
end