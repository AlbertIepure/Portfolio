[x,Fs,N]=wavread('..\guitar.wav');
n=0:length(x)-1;
time=n/Fs;
xlen=length(x);%Calc. the number of samples in the file

%Initialize constants
dry= 0.8;%-0.35; %trebuie sa fie fix sau variabil in (-1,1)????
wet= 0.6;%0.67;
g=0.3;%-0.6;
delay=0.010;%0.013; 
amount=0.003;
advance=1; %rate of flange in Hz

% sin reference to create oscillating delay
sin_ref = (sin(2*pi*(n+1)*(advance/Fs)));
%convert amount in ms to amount in samples
samp_delay=round(amount*Fs);
D=round(delay*Fs); %Calculate the number of samples in the delay
A1=dry/(abs(dry)+abs(wet*(1-g)))
A2=(wet*(1-g))/(abs(dry)+abs(wet*(1-g)))

%y1=zeros(length(x),1);
y=zeros(length(x),1);
y(1:D+samp_delay)=x(1:D+samp_delay);
%cur_delay=zeros(size(x));

for i = (D+samp_delay+1):length(x),
cur_delay=D+ceil(sin_ref(i)*samp_delay);
y(i)=(dry*x(i)+wet*x(i-cur_delay));
end

%M=max(cur_delay);
%Delayline=zeros(M,1); % memory allocation for length M

%for n=1:length(x);
%y1(n)=x(n)+g*Delayline(M); %scalat cu s=1-g
%Delayline=[y1(n);Delayline(1:M-1)];
%end;

%for n=1:length(x);
 %   y(n)=A1*x(n)+A2*y1(n);
%end
% reprezentarea lui x in timp (in secunde)
figure(2),plot(time,x),grid,title('Semnalul de test'),xlabel('Timp (s)');
% audio signal
%sound(x,Fs,N);
%disp('Press a key'),pause
sound(y,Fs,N);%play the filtered signal y
wavwrite(y,Fs,N,'IIR_flanger.wav');






