N = 64;
M = 51023;
K = 16;
L = N-K+1;

for i=1:M
    x(i)=mod(i-1,64);
end;

for i=1:K
    h(i)=i;
end;

y1=conv(x,h);
y2=overlap_and_save(x,h,N);
y3=y1-y2;