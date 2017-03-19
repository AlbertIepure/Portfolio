for i = 0:95
    a(i+1) = floor(1000*sin(20*pi*i/96));
end
csvwrite('csvlist.dat',a);