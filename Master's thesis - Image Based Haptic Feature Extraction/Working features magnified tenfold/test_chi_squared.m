% http://de.mathworks.com/help/stats/multcompare.html
% http://de.mathworks.com/help/stats/multiple-comparisons.html#bum7ugh
% https://statistics.laerd.com/spss-tutorials/kruskal-wallis-h-test-using-spss-statistics.php

clear all
close all
clc

load('CBIR_PlainFile_v16.mat');

for i=1:size(Feature_Matrix,2)
    h = kstest(Feature_Matrix(:,i)); %One-sample Kolmogorov-Smirnov test
    [p,tbl,stats] = kruskalwallis(reshape(Feature_Matrix(:,i),[10,69]),[],'off');
    c = multcompare(stats);
    metric(i,1) = tbl{2,5};
    p_values = c(:,end);
    metric(i,2) = numel(p_values(p_values < 0.01));
    metric(i,3) = numel(p_values(p_values < 0.05));
    metric(i,4) = numel(p_values(p_values < 0.10));
    
    %% Statistic Evaluation

    alpha = 0.05;
    
    %c = multcompare(stats,'Alpha',alpha,'CType','hsd')
    c = multcompare(stats,'Alpha',alpha,'CType','bonferroni');    
    pValues = c(:,6);
    correctedAlpha = alpha/(69*34);
%     goodnessCriterion(i,1) = tbl{2,5};
%     goodnessCriterion(i,2) = numel(find(pValues < correctedAlpha)) / numel(pValues);
    metric(i,5) = numel(find(pValues < correctedAlpha)) / numel(pValues);
end