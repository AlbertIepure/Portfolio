clear all
close all
clc

dry=0.5;
N1=128;%valori din early echoes matlab
N2=192;
N3=64;
N4=256;
wet1=0.4901;
wet2=0.3881;
wet3=0.6600;
wet4=0.3202;

[x,Fs,N] = wavread('..\guitar.wav');
L=400*160;

fid=fopen('input.dat','w','b');
fwrite(fid,x.*2^15,'int16');
fclose(fid);

display('APASA O TASTA');
pause

fid=fopen('output.dat','r','b');
y=fread(fid,L,'int16');
fclose(fid);
y=y'/(2^15);

sound(y,Fs,N);
wavwrite(y,Fs,N,'early_echoes.wav');