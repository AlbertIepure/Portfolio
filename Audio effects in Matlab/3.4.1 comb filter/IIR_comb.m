[x,Fs,N]=wavread('..\speech.wav');
n=0:length(x)-1;
time=n/Fs;
xlen=length(x);%Calc. the number of samples in the file
%Initialize constants
g=0.5;
M=100;
y=zeros(size(x));
Delayline=zeros(M,1); % memory allocation for length 10
for n=1:length(x);
y(n)=x(n)+g*(1-g)*Delayline(M); %scalat cu s=1-g
Delayline=[y(n);Delayline(1:M-1)];
end;
% reprezentarea lui x in timp (in secunde)
figure(2),plot(time,x),grid,title('Semnalul de test'),xlabel('Timp (s)');
% audio signal
%sound(x,Fs,N);
disp('Press a key'),pause
sound(y,Fs,N);%play the filtered signal y
figure(1);
hold on
plot(y,'r');
plot(x,'b');
title('Comb filter');
wavwrite(y,Fs,N,'IIR_comb.wav');