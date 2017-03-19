x = [0 0 0 0 0 0 2 -2 2 -2 2 -2 2 -2 2 -2 2 -2 2 0 0 0 0 0 0];
dtx = -12:12;
stem (dtx,x);
for i = 2:6
    y(i) = x(i) + x(i-1)*x(2*i);
end;
figure
stem(dtx,x);