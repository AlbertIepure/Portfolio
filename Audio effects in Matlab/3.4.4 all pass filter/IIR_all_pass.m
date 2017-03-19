% se citeste un fisier wav
% x este vector COLOANA care contine esantioanele
% Fs este frecventa de esantionare
% N este numarul de biti pe esantion
[x,Fs,N]=wavread('..\speech.wav');
n=0:length(x)-1;
time=n/Fs;
xlen=length(x);%Calc. the number of samples in the file

BL=0.6; %Blend
FB=-BL; %Feedbackward
M=50;
Delayline=zeros(M,1); % memory allocation for length 10

for n=1:length(x);
xh=x(n)+FB*Delayline(M);
y(n)=Delayline(M)+BL*xh;
Delayline=[xh;Delayline(1:M-1)];
end;

% reprezentarea lui x in timp (in secunde)
figure(2),plot(time,x),grid,title('Semnalul de test'),xlabel('Timp (s)');
% audio signal
sound(x,Fs,N);
disp('Press a key'),pause
sound(y,Fs,N);%play the filtered signal y
figure(1);
hold on
plot(y,'r');
plot(x,'b');
title('Allpass filter');
wavwrite(y,Fs,N,'IIR_all_pass.wav');