clear all
close all
clc

no_textures = 69;
ranks = [1:no_textures];
miu = mean(ranks);

a = 3;
b = 4.5;

for r=1:no_textures
    f(r) = a + b*(1 - exp(-2*r/miu));
end

f_int = floor(f);

H = [45;42;50;9;28;36;10;33;7;5;4;44;8;37;69;24;67;3;16;54;26;39;66;13;40;38;6;2;14;12;65;59;25;60;31;32;51;34;46;47;62;41;43;53;68;55;15;29;30;48;61;57;63;52;23;49;1;27;64;56;11;58;35;19;20;17;18;22;21];
I = [45;9;28;50;42;36;59;7;37;33;51;26;4;5;6;43;39;2;54;62;41;8;46;3;63;10;1;32;67;44;24;34;69;16;66;38;25;68;65;60;12;14;61;53;13;15;31;11;48;17;20;49;29;64;47;55;23;40;30;52;27;22;19;56;18;35;21;57;58];

h=figure;
plot(ranks,f);
hold on
plot(ranks,f_int,'r')
ylim([0 8]);
xlabel('Rank r');
ylabel('Tolerance d');
title('Tolerance d as a function of rank r');
legend('d(r)','floor(d(r))','Location','northwest');
hold off
saveTightFigure(h,'tolerance_d_function_r.pdf');

accuracy = ranking_accuracy(I,H,f_int);