clear all;
close all;
clc;

[x,Fs] = wavread('..\guitar.wav');
N = length(x);
n=0:length(x)-1;
time=n/Fs;


dry = 1;
wet = 0.5;
delay = round(0.02*Fs)    %20 ms       
amount = round(0.01*Fs)   %10 ms
advance=1.43;
w0=2*pi*(advance/Fs);
n=1:1:N;
sinus = round(delay + amount*sin(w0*n));
y=zeros(size(x));
for n = delay + amount:1:N - delay - amount
    y(n) = dry*x(n) + wet*x(n-sinus(n));
end

fid=fopen('x.dat','w','b');
fwrite(fid,x.*2^15,'int16');
fclose(fid);
fid=fopen('sinus.dat','w','b');
fwrite(fid,sinus,'int16');
fclose(fid);

display('APASA O TASTA');
pause


fid=fopen('y.dat','r','b');
y_cw=fread(fid,N,'int16');
fclose(fid);
y_cw=y_cw'/(2^15);

% reprezentarea lui x in timp (in secunde)
figure(1),plot(time,x),grid,title('Semnalul de test'),xlabel('Timp (s)');
%sound(x, Fs);
figure(2),plot(time,y),grid,title('Semnalul chorus'),xlabel('Timp (s)');
sound(y, Fs);
figure(3),plot(y_cw),grid,title('Semnalul chorus'),xlabel('Timp (s)');
sound(y_cw, Fs);

