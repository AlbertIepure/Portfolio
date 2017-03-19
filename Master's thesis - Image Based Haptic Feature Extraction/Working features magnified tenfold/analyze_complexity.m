clear all
close all
clc

load('complexity_1_to_60_new.mat')

row=1;
for i=1:2:size(Data,2)
    h = kstest(Data(:,i)); %One-sample Kolmogorov-Smirnov test
    [p,tbl,stats] = kruskalwallis(reshape(Data(:,i),[10,69]),[],'off');
    alpha = 0.05;
%     h = figure
    c = multcompare(stats,'Alpha',alpha,'CType','bonferroni');    
%     saveTightFigure(h,'p_values_low.pdf');
    pValues = c(:,6);
    correctedAlpha = alpha/(69*34);
    results(row,1) = row; %d value
    results(row,2) = h; %h value
    results(row,3) = tbl{2,5}; %chi squared metric
%     results(row,4) = numel(find(pValues < correctedAlpha)) / numel(pValues);
%     results(row,4) = sum(pValues(find(pValues < alpha)))/numel(find(pValues < alpha)); % GFC
    results(row,4) = numel(pValues(find(pValues < correctedAlpha)))*100 / numel(pValues); % GFC
    results(row,5) = mean(Data(:,i+1));
    FDR = mafdr(pValues);
    results(row,6) = numel(FDR(find(FDR < alpha)))*100 / numel(pValues);
    row=row+1;
end

h=figure
plot(results(:,1),results(:,4))
xlabel('d');
ylabel('GFC');
title('GFC as function of d');
saveTightFigure(h,'complexity_GFC_function_d.pdf')
h=figure
plot(results(:,1),results(:,5))
xlabel('d');
ylabel('Computation time (s)');
title('Computation time as a function of d');
saveTightFigure(h,'complexity_comp_time_function_d.pdf')
% figure
% plot(results(:,1),results(:,6))
% xlabel('d');
% ylabel('FDR');
% title('FDR as function of d');
    
    