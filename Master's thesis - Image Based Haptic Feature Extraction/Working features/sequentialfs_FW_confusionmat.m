% http://de.mathworks.com/help/stats/examples/selecting-features-for-classifying-high-dimensional-data.html
% http://de.mathworks.com/help/stats/feature-selection.html
% http://de.mathworks.com/help/stats/sequentialfs.html

clear all
close all
clc

path = 'D:\Dropbox\München\MSCE\Image_Database\';

load('Feature_Matrix.mat');

img_per_texture = 10;
number_of_features = size(Feature_Matrix,2);

textureImageFiles       = dir(strcat(path,'*.jpg'));
number_of_images = numel(textureImageFiles);
classes = cell(number_of_images/img_per_texture,1);

for i=1:number_of_images
    class_name = textureImageFiles(i).name;
    classes{i,1} = class_name(1:end-6);
end
labels = unique(classes);

comb = nchoosek([1:number_of_features],2);
for i=1:size(comb,1)
            corr_mat = corrcoef(Feature_Matrix(:,comb(i,1)),Feature_Matrix(:,comb(i,2)));
            comb(i,3) = corr_mat(1,2);
end
            

X = Feature_Matrix;
y = classes;
rng(0,'twister');
c = cvpartition(classes,'kfold',10)

opts = statset('display','iter',...
              'TolTypeFun','abs');
fun = @(XT,yT,Xt,yt)...
      (sum(~strcmp(yt,classify(Xt,XT,yT,'linear'))));
  
h=figure
% [fs,history] = sequentialfs(fun,X,y,'cv',c,'direction','backward','options',opts,'Nf',1)
[fs,history] = sequentialfs(fun,X,y,'cv',c,'direction','forward','options',opts,'Nf',11)
hold on
% plot([0:10],history.Crit,'o');
plot(history.Crit,'o');
% xlabel('Number of Removed Features');
xlabel('Number of Features');
ylabel('CV MCE');
% title('Backward Sequential Feature Selection with cross-validation');
title('Forward Sequential Feature Selection with cross-validation');

% [fs,history] = sequentialfs(fun,X,y,'cv','resubstitution','direction','backward','options',opts,'Nf',1)
[fs,history] = sequentialfs(fun,X,y,'cv','resubstitution','direction','forward','options',opts,'Nf',11)
% plot([0:10],history.Crit,'r^');
plot(history.Crit,'r^');
% xlabel('Number of Removed Features');
xlabel('Number of Features');
ylabel('MCE');
title('MCE for cross-validation and resubstitution');
legend({'10-fold CV MCE' 'Resubstitution MCE'},'location','NE');
hold off
% xlim([0 8.1]);
saveTightFigure(h,'CV_resub_MCE_FW_LDA.pdf')
% clear y
% y = [1:number_of_images];
% for i=1:number_of_images
%     y(i,1) = ceil(i/10);
% end
%     
% stepwisefit(X,[1:number_of_images]','penter',0.01,'premove',0.06);

% First Method: without cross-validation
figure
Mdl = fitcnb(X(:,find(fs)),classes, 'Classnames', labels, 'DistributionNames','normal'); % max kfoldpredict : 'kernel','Kernel', 'triangle'; max success rate: normal
error_rate = resubLoss(Mdl);
isLabels = resubPredict(Mdl);
ConfusionMat = confusionmat(classes,isLabels);
heatmap(ConfusionMat, [1:number_of_images/img_per_texture], [1:number_of_images/img_per_texture], 1,'ShowAllTicks',1,'UseLogColorMap', true,'Colorbar',true);
title(strcat('Naive Bayes Success Rate:',num2str(sum(diag(ConfusionMat))*100/sum(sum(ConfusionMat))),'%', ' vs ', num2str((1-error_rate)*100),'%'));

%Third method: with cross-validation
figure
CVMdl = crossval(Mdl,'CVPartition',c);
% Estimate the generalization error.
error_rate_CV = kfoldLoss(CVMdl);
isLabelsCV = kfoldPredict(CVMdl);
ConfusionMatCV = confusionmat(classes,isLabelsCV);
heatmap(ConfusionMatCV, [1:number_of_images/img_per_texture], [1:number_of_images/img_per_texture], 1,'ShowAllTicks',1,'UseLogColorMap',true,'Colorbar',true);
title(strcat('Naive Bayes k-fold Cross Validation Success Rate:',num2str(sum(diag(ConfusionMatCV))*100/sum(sum(ConfusionMatCV))),'%', ' vs ', num2str((1-error_rate_CV)*100),'%'));

% Second method: without cross-validation
figure
Mdl = NaiveBayes.fit(X(:,find(fs)),classes, 'Distribution','normal');
% error_rate = resubLoss(Mdl);
isLabels = predict(Mdl,X(:,find(fs)));
ConfusionMat = confusionmat(classes,isLabels);
heatmap(ConfusionMat, [1:number_of_images/img_per_texture], [1:number_of_images/img_per_texture], 1,'ShowAllTicks',1,'UseLogColorMap', true,'Colorbar',true);
title(strcat('Naive Bayes Success Rate:',num2str(sum(diag(ConfusionMat))*100/sum(sum(ConfusionMat))),'%'));

