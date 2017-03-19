clear all
close all
clc

load('labels.mat')
Data = load('busyness_complexity_R_G_B_coarseness_contrast_directionality_linelikeness_glossyness_regularity.mat');
Data = Data.Data;

% don't forget to leave the RGB components unnormalized, if given
% names = fieldnames(results);

for i=1:690
        Data(i,1) = results(i).contrast;
end

for i=1:1
    minimum = min(Data(:,i));
    maximum = max(Data(:,i));
    Data(:,i) = (Data(:,i) - minimum)./(maximum - minimum);
end

for i=1:11
    to_plot = reshape(Data(:,1),[10,69]);
    figure
    boxplot(to_plot);
end

i=1
[p,tbl,stats] = kruskalwallis(reshape(Data(:,i),[10,69]),[],'on');
h=figure;
boxplot(reshape(Data(:,i),[10,69]))
ylim([0,1]);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',8)
b = get(gca,'YTickLabel');
set(gca,'YTickLabel',b,'fontsize',8)
title('Feature: Coarseness','FontSize',11)
ylabel('Normalized Feature Value','FontSize',11)
xlabel('Texture ID','FontSize',11);
saveTightFigure(h,'Coarseness_New.pdf')
% iptsetpref('ImshowBorder','tight');

c = multcompare(stats);
save('complexity_30.mat','Data');