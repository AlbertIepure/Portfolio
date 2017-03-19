% http://de.mathworks.com/help/stats/anova1.html
% http://de.mathworks.com/help/stats/kruskalwallis.html?refresh=true
% http://de.mathworks.com/help/symbolic/mupad_ref/plot-boxplot.html
% http://www.cs.utsa.edu/~cs1173/lessons/BoxPlotQuestions/BoxPlotQuestions.html
% http://de.mathworks.com/help/stats/multcompare.html
% The question is whether the chis^2 is the right metric to use. All the
% other parameters yielded by the ANOVA alalysis are highly correlated with
% it

clear all
close all
clc

tic
load('Tamura_Feature_Matrix.mat');
% CBIR_PlainFile_v16

% Feature_Matrix(:,1) = []; % remove busyness
no_features = size(Feature_Matrix,2);
path = 'D:\Dropbox\München\MSCE\Image_Database\';
img_per_texture = 10;

textureImageFiles       = dir(strcat(path,'*.jpg'));
number_of_images = numel(textureImageFiles);
classes = cell(number_of_images/img_per_texture,1);

for i=1:number_of_images
    class_name = textureImageFiles(i).name;
    classes{i,1} = class_name(1:end-6);
end
labels = unique(classes);

metric = zeros(2,no_features); 

for i=1:no_features
    [p,tbl,stats] = kruskalwallis(reshape(Feature_Matrix(:,i),[img_per_texture,number_of_images/img_per_texture]),[],'off');
    alpha = 0.05;
    c = multcompare(stats,'Alpha',alpha,'CType','bonferroni');    
    pValues = c(:,6);
    correctedAlpha = alpha/(69*34);
    metric(1,i) = numel(pValues(find(pValues < correctedAlpha)))*100 / numel(pValues); % GFC
    metric(2,i) = sum(pValues(find(pValues < 0.001))) / numel(pValues); % GFC
%     metric(2,i) = sum(pValues(find(pValues < correctedAlpha))); % GFC
%     metric(3,i) = sum(pValues(find(pValues < alpha))); % GFC
%     metric(4,i) = numel(find(pValues < alpha)); % GFC
%     metric(5,i) = sum(pValues(find(pValues < alpha)))/numel(find(pValues < alpha)); % GFC
%     metric(6,i) = sum(pValues(find(pValues < correctedAlpha)))/numel(find(pValues < correctedAlpha)); % GFC
%     metric(7,i) = tbl{2,5}; % Chi squared distance
      metric(3,i) = var(Feature_Matrix(:,i));
end

combinations = cell(1,2);
arrangements = cell(1,2);
l = 1;
for i=1:no_features
    c = combnk([1:no_features],i);
    for j=1:size(c,1)
        combinations{l,1} = c(j,:);
        l=l+1;
    end
end
recognition_rate_1 = zeros(size(combinations,1),1);   
recognition_rate_2 = zeros(size(combinations,1),1);  
for i=1%:size(combinations,1)
    i
    feature_config = [1:6];
    rng(0,'twister'); %for reproductibility
    Mdl = fitcnb(Feature_Matrix(:,feature_config),classes, 'Classnames', labels, 'DistributionNames', 'normal');%'Kernel','Kernel','epanechnikov');
    cp = cvpartition(classes,'KFold',10); %stratified cross-validation
    CVMdl = crossval(Mdl,'CVPartition',cp);
    % Estimate the generalization error.
    isLabelsCV = kfoldPredict(CVMdl);
    ConfusionMatCV = confusionmat(classes,isLabelsCV);
    h=figure;
    heatmap(ConfusionMatCV, [1:number_of_images/img_per_texture], [1:number_of_images/img_per_texture], 1,'ShowAllTicks',1,'Colormap',colormap(flipud(gray)),'Colorbar',true,'TextColor','black','TickFontSize',7);
    error_rate_CV = kfoldLoss(CVMdl);
    recognition_rate_1(i,1) = (1-error_rate_CV)*100;
    recognition_rate_2(i,1) = (sum(diag(ConfusionMatCV))*100/sum(sum(ConfusionMatCV)));
    title(strcat(['Accuracy of Naive Bayes Classifier : ',num2str(recognition_rate_2(i,1)),'%']),'FontSize', 11);
    xlabel('Texture ID','FontSize',11);
    ylabel('Texture ID','FontSize',11);
    %message = sprintf('.');
    %text(73.5,71,message);
    %set(h,'PaperPositionMode','auto');
    %set(h,'PaperOrientation','landscape');
    saveTightFigure(h,'TamuraConfusionMatrix6F.pdf');
%     combinations{i,2} = (1-error_rate_CV)*100;
end