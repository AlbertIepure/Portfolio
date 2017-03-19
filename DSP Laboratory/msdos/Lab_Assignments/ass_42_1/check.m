M = 1000;
K = 10;
N = 64;

for i = 1: M
    x(i) = mod(i-1, 64) + j*0;
end;

for i = 1:K
    h(i) = (i-1) + j*0;
end;

conv(x,h)