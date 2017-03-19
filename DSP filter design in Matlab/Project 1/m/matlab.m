N=40;
n=0:N-1;
a=0.25*cos(2*pi/5*n);

fid=fopen('C:\Users\Albert\Desktop\442G_Iepure_Albert\a.dat','w','b');
fwrite(fid,a.*2^15,'int16');
fclose(fid);

matlab_energy=sum(a.*a)

fid=fopen('C:\Users\Albert\Desktop\442G_Iepure_Albert\signalenergy.dat','r','b');
e=fscanf(fid,'%d');
e=e/(2^15);
fclose(fid);

fid=fopen('C:\Users\Albert\Desktop\442G_Iepure_Albert\scalefactor.dat','r','b');
scalefactor=fscanf(fid,'%d');
starcore_energy=e*2^(2*scalefactor)
fclose(fid);

error=matlab_energy-starcore_energy