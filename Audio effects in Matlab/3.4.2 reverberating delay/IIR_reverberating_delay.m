[x,Fs,N]=wavread('..\guitar.wav');
n=0:length(x)-1;
time=n/Fs;
xlen=length(x);%Calc. the number of samples in the file
%Initialize constants
dry=0.35; %trebuie sa fie fix sau variabil in (-1,1)????
wet=0.67;
g=0.6;
M=100;
A1=dry/(abs(dry)+abs(wet*(1-g)))
A2=(wet*(1-g))/(abs(dry)+abs(wet*(1-g)))

y=zeros(length(x),1);
y(1:M)=x(1:M);

for i = (M+1):length(x),
y(i)=(A1*x(i)+A2*x(i-M));
end

%Delayline=zeros(M,1); % memory allocation for length 10
%for n=1:length(x);
%y1(n)=x(n)+g*Delayline(M); %scalat cu s=1-g
%Delayline=[y1(n);Delayline(1:M-1)];
%end;
%for n=1:length(x);
%    y(n)=A1*x(n)+A2*y1(n);
%end
% reprezentarea lui x in timp (in secunde)
figure(2),plot(time,x),grid,title('Semnalul de test'),xlabel('Timp (s)');
% audio signal
sound(x,Fs,N);
%disp('Press a key'),pause
sound(y,Fs,N);%play the filtered signal y

figure(1);
hold on
plot(y,'r');
plot(x,'b');
title('Reverberating delay');
wavwrite(y,Fs,N,'reverberatingdelay.wav');