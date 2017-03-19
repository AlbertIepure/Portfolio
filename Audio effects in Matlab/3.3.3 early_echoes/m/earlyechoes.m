% se citeste un fisier wav
% x este vector COLOANA care contine esantioanele
% Fs este frecventa de esantionare
% N este numarul de biti pe esantion
[x,Fs,N]=wavread('..\..\guitar.wav');
n=0:length(x)-1;
time=n/Fs;
xlen=length(x);%Calc. the number of samples in the file
%Initialize constants
l=2; %distanta pana la sursa, se alege valoarea
li=[4 5 3 6]; %distanta pana la sursa imagine a reflexiei i, se alege valoarea
c=344; %[m/s] viteza sunetului în aer 
di=(li-l)*Fs/c; %timpul de întârziere relativ al reflexiei i în raport cu semnalul direct.
Tdi=di/Fs;
T60=2; %timpul de reverbera?ie al camerei, se alege valoarea
r=(log(1000))/T60;%coeficientul de absorbtie al peretilor
for j=1:1:4
weti(j)=(l/li(j))*exp(-r*Tdi(j));  %amplitudinea relativa a semnalului direct in raport cu reflexia i
end
dry=0.5; %se alege valoarea
k=abs(dry)+ sum(abs(weti));
s=1/k;
y=zeros(size(x));
n_min=ceil(max(di));
for j=n_min+1:1:xlen
    for i=1:1:4
        y(j)=s*dry*x(j)+s*weti(i)*x(j-ceil(di(i)));%ecuatia cu diferente finite pt FIR
    end
end
% reprezentarea lui x in timp (in secunde)
figure(2),plot(time,x),grid,title('Semnalul de test'),xlabel('Timp (s)');
% semnalul audio
sound(x,Fs,N);
disp('Apasati o tasta'),pause
sound(y,Fs,N);%play the filtered signal y
wavwrite(y,Fs,N,'earlyechoes.wav');

 

