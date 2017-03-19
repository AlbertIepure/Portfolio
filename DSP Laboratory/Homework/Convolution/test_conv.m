M = 1000;
K = 10;

for i=1:M
    x(i)=mod(i-1,64);
end;

for i=1:K
    h(i)=i;
end;

tstart1=tic;
y1=conv(x,h);
telapsed1=toc(tstart1);

tstart2=tic;
y2=convolution(x,h);
telapsed2=toc(tstart2);

y3=y1-y2;