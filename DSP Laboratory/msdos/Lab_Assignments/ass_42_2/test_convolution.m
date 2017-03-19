M = 10000;
K = 16;

for i=1:M
    input(i)=mod(i-1,64);
end;

for i=1:K
    h(i)=i;
end;

output = zeros(1, M+K-1);
input =[input, zeros(1,K-1)];
for i=1:M+K-1
    for j=1:i
        output(i) = output(i) x(j)*h(i-j+1);
    end;
end;