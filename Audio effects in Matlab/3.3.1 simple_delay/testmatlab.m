clear all
close all
clc

[x,Fs,N]=wavread('..\guitar.wav');
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
wavwrite(y,Fs,N,'echo_simplu.wav');
