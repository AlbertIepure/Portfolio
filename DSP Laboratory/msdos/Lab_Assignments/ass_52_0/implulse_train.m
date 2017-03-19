t = linspace(0,3/2700,1000);
n_cos = 17;
x = 1;
for i=1:n_cos
    x = x + 2*cos(2*pi*2700*i*t);
end
figure; plot(t,x)