%shroeder reverberating mode 2 allpass filters and 4 comb filters;
[x,Fs,N]=wavread('..\speech.wav');
g=0.5;
Ts=1/Fs;
dry=0.4;
Mc=[1543 1764 1984 2205];%M for comb filters
Ma=[220 220];%M for allpass filters
T60=(3*Mc/Fs)/(log10(1/g));
%comb filters
for i=1:4;
  M=Mc(i);
   Delayline=ones(M,1);
        for n=1:length(x);
            y(n)=x(n)+g*Delayline(M);
            Delayline=[y(n);Delayline(1:M-1)];
        end;
end;
%allpass filters
for i=1:2;
    L=Ma(i);
    BL=-g;
    FB=g;
    FF=1;
    Delaylinex=ones(L,1);
    for n=1:length(y);
        xh=y(n)+FB*Delaylinex(L);
        z(n)=FF*Delaylinex(L)+BL*xh;
        Delaylinex=[xh;Delaylinex(1:L-1)];
        w(n)=z(n)+x(n);%*dry;
    end;
end;
disp('Apasati o tasta'),pause
sound(w,Fs,N);%play the filtered signal y
figure(1);
hold on
plot(w,'r');
plot(x,'b');
title('Schroeder');
wavwrite(y,Fs,N,'Schroeder.wav');