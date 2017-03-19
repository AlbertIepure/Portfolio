clear all;
close all
clc;

Fs=16000;  
F1=3200;
F2=6400;
w1=2*pi*F1/Fs;
w2=2*pi*F2/Fs;
O1=w1*Fs;
O2=w2*Fs;
N=4;
Ost=[O1 O2];

[b,a]=cheby2(N/2, 40, Ost,'s');
figure(1), freqs(b,a);
[bd,ad]= impinvar (b,a,Fs);
figure(2), freqz(bd,ad);
figure(3),impz(bd,ad),grid;
figure(4),zplane(bd,ad);

[SOS,G]=tf2sos(bd,ad);

bd1=SOS(1,1:3)
bd2=SOS(2,1:3)
ad1=SOS(1,4:6)
ad2=SOS(2,4:6)

h1=impz(bd1,ad1);
k1=sum(abs(h1));
s01=1/k1        %factorul de scalare pentru prima structura
h2=impz(bd2,ad2);
k2=sum(abs(h2));
s02=1/k2        %factorul de scalare pentru a doua structura

g=G/(s01*s02)

hin1=impz(1,ad1);
s1=1/sum(abs(hin1));
hin2=impz(1,ad2);
s2=1/sum(abs(hin2));

bs1=bd1.*s01 %scalarea coeficientilor pentru a evita depasirile la iesirile functiilor de transfer
bs2=bd2.*s02

% Simulare cu un semnal sinusoidal cu frecventa liniar crescatoare
t = 0:1/Fs:2-1/Fs;              
x=chirp(t,100,2,Fs/2);      
k=fix(length(x)/160)
L=k*160;

x1=x*g*s1;
w=filter(bs1,ad1,x1)*s2/s1;
y_fin=filter(bs2,ad2,w)/s2;

n=0:L-1;
figure(5),plot(n,x)
figure(6),plot(n,y_fin),grid
y_init=filter(bd,ad,x);
figure(7),plot(n,y_init),grid
figure(8),plot(n,y_init-y_fin),grid

fid=fopen('L:\442Ga_Iepure_Albert_Constantin\filtru_ceb_2\input.dat','w','b');
fwrite(fid,x.*2^15,'int16');
fclose(fid);

display('APASA O TASTA');
pause

fid=fopen('L:\442Ga_Iepure_Albert_Constantin\filtru_ceb_2\output.dat','r','b');
y=fread(fid,L,'int16');
fclose(fid);
y=y'/(2^15);

figure(9),plot(n,y),grid