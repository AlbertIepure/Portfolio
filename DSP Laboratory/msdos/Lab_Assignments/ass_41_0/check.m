for n=1:8
    x(n) = n + j*n
end;

% x = [0.7071, 0.0000, -0.7071, -1.0000, -0.7071, -0.0000, 0.7071, 1.0000]
fft(x)