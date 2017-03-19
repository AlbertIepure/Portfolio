clear all
close all
clc

x = [0.375 0.375 0.625 0.875 -0.875 -0.375 -0.625 -0.375];

x_1_b_q = [1 1 1 1 -1 -1 -1 -1].*1/2;

mse1=0;
for i=1:length(x)
    mse1=mse1+(x(i)-x_1_b_q(i))^2;
end
mse1=mse1/length(x);

x_2_b_q = [1 1 3 3 -3 -1 -3 -1].*1/4;

mse2=0;
for i=1:length(x)
    mse2=mse2+(x(i)-x_2_b_q(i))^2;
end
mse2=mse2/length(x);

x_3_b_q = [3 3 5 7 -7 -3 -5 -3].*1/8;

mse3=0;
for i=1:length(x)
    mse3=mse3+(x(i)-x_3_b_q(i))^2;
end
mse3=mse3/length(x);

s=0;
for i=1:length(x)
    s=s+x(i)^2;
end
s=s/length(x);

v=var(x);
