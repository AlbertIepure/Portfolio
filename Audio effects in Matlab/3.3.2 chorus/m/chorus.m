% se citeste un fisier wav
% x este vector COLOANA care contine esantioanele
% Fs este frecventa de esantionare
% N este numarul de biti pe esantion
[x,Fs,N]=wavread('..\..\guitar.wav');
n=0:length(x)-1;
time=n/Fs;
xlen=length(x);%Calc. the number of samples in the file
%Initialize constants
wet=1; 
dry=1; 
delay=0.013; 
amount=0.002;
advance=1.34; %rate of flange in Hz
s=1/(wet+dry);
D=round(delay*Fs); %Calculate the number of samples in the delay
y=zeros(size(x));
% sin reference to create oscillating delay
sin_ref = (sin(2*pi*(n+1)*(advance/Fs)));
%convert amount in ms to amount in samples
samp_delay=round(amount*Fs);
% for each sample
for i = (D+samp_delay+1):length(x),
cur_delay=D+ceil(sin_ref(i)*samp_delay); 
y(i)=s*(dry*x(i)+wet*x(i-cur_delay));
end
% reprezentarea lui x in timp (in secunde)
figure(2),plot(time,x),grid,title('Semnalul de test'),xlabel('Timp (s)');
% audio signal
sound(x,Fs,N);
disp('Press a key'),pause
sound(y,Fs,N);%play the filtered signal y
wavwrite(y,Fs,N,'chorus.wav');
 

