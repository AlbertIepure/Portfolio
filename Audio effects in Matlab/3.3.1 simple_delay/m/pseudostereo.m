% se citeste un fisier wav
% x este vector COLOANA care contine esantioanele
% Fs este frecventa de esantionare
% N este numarul de biti pe esantion
[x,Fs,N]=wavread('..\speech.wav');
n=0:length(x)-1;
time=n/Fs;
xlen=length(x);%Calc. the number of samples in the file
%Initialize constants
wet=1; 
dry=1; 
delay=0.040; 
s=1/(wet+dry);
D=round(delay*Fs); %Calculate the number of samples in the delay
y=zeros(length(x),2);
% filter the signal
for i=D+1:1:xlen
y(i,1)=dry*x(i);
y(i,2)=wet*x(i-D);
end;

% reprezentarea lui x in timp (in secunde)
figure(2),plot(time,x),grid,title('Semnalul de test'),xlabel('Timp (s)');
% semnalul audio
% sound(x,Fs,N);
disp('Apasati o tasta'),pause
sound(y,Fs,N);%play the filtered signal y
wavwrite(y,Fs,N,'pseudostereo.wav');

 

