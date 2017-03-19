for i = 0:11
    a(i+1) = floor(1000*cos(2*pi*i/12));
end
plot(a);
csvwrite('csvlist.dat',a);