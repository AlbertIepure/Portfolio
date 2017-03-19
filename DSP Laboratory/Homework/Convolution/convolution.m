function output = convolution(input, h)
M = length(input);
K = length(h);
output = zeros(1, M+K-1);
H = toeplitz([h(1),zeros(1,M-1)],[h,zeros(1,M-1)]);
output = input*H;
end


