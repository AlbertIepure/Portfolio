%Moorer reverberating mode Auditorium;
[x,Fs,N]=wavread('E:\ETTI\An 4\proiect 3\efecte\old\demo1\speech.wav');
g=0.5;
Ts=1/Fs;
dry=0.4;
Mc=[1543 1764 1984 2205 2427 2650];%M for comb filters
Ma=220;%M for allpass filters
%T60=(3*Mc/Fs)/(log10(1/g)); %pentru shroeder;
T60=2;%de la early echoes;
a=10;
if g/(1-a)<1
    disp('a is good, system is stable');
else disp('the system is not stable, give corect values!');
end;
%fir early echoes
l=2;
li=[4 5 3 6]; %distanta pana la sursa imagine a reflexiei i, se alege valoarea
c=344; %[m/s] viteza sunetului în aer 
di=(li-l)*Fs/c; %timpul de întârziere relativ al reflexiei i în raport cu semnalul direct.
Tdi=di/Fs;
r=(log(1000))/T60;%coeficientul de absorbtie al peretilor
for j=1:1:4
weti(j)=(l/li(j))*exp(-r*Tdi(j));  %amplitudinea relativa a semnalului direct in raport cu reflexia i
end
dryfir=20; %se alege valoarea
k=abs(dry)+ sum(abs(weti));
s=1/k;
y=zeros(size(x));
n_min=ceil(max(di));
for j=n_min+1:1:length(x)
    for i=1:1:4
        y(j)=s*dryfir*x(j)+s*weti(i)*x(j-ceil(di(i)));%ecuatia cu diferente finite pt FIR
    end
end
%Moorer's comb filters
for i=1:6;
  M=Mc(i);
   Delayline=ones(M,1);
   delayline= ones(a,1);
        for n=1:length(x);
            u(n)=x(n)+g*Delayline(M)*delayline(a); 
            Delayline=[u(n);Delayline(1:M-1)];
            delayline=[u(n);Delayline(1:a-1)];
        end;
end;
%allpass filters
    BL=-g;
    FB=g;
    FF=1;
    Delaylinex=ones(Ma,1);
    for n=1:length(x);
        xh=x(n)+FB*Delaylinex(Ma);
        v(n)=FF*Delaylinex(Ma)+BL*xh;
        Delaylinex=[xh;Delaylinex(1:Ma-1)];
        w(n)=y(n)+u(n)+v(n);%teoretic insumeaza toate efectele
    end;

disp('Apasati o tasta'),pause
sound(w,Fs,N);%play the filtered signal y
figure(1);
hold on
plot(w,'r');
plot(x,'b');
title('Audititorium');