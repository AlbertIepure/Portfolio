Ts = 0.5;

for i = 0:7
    a(i+1) = i;
    x(i+1) = power(0.8, i*Ts);
end;

stem(a,x)