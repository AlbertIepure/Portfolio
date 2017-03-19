x=zeros(100,1);x(1)=1; % unit impulse signal of length 100
g=0.5;
M=10;
Delayline=zeros(M,1); % memory allocation for length 10
for n=1:length(x);
y(n)=x(n)+g*Delayline(M);
Delayline=[y(n);Delayline(1:M-1)];
end;