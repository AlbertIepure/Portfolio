for i = 0:143
    a(i+1) = floor(1000*cos(2*pi*i/144));
end
plot(a);
csvwrite('csvlist.dat',a);