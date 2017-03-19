function output = convolution(input,h)
M = length(input);
K = length(h);
output = zeros(1, M+K-1);
input =[input, zeros(1,K-1)];
h =[h, zeros(1,M-1)];
for i=1:M+K-1
    for j=1:i
        output(i) = output(i) + input(j)*h(i-j+1);
    end;
end;
end