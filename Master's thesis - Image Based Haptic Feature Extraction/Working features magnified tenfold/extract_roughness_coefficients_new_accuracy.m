clear all
close all
clc
% http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3518362/
% http://de.mathworks.com/help/stats/mvregress.html
% http://www.mathworks.com/matlabcentral/newsreader/view_thread/236859

load('final_ordering_I.mat');
[Y,I] = sort(score,1,'ascend'); % in I we have in column 2 the texture number from the roughest (pos 1) to the smoothest (pos 69)

load('roughness_parameters_symmetric.mat'); % the computed coefficients W1 to W14
load('roughness_parameters_combinations.mat'); % all possible combinations of the 14 coefficients

no_textures = 69;
ranks = [1:no_textures];
miu = mean(ranks);

a = 3;
b = 4.5;

for r=1:no_textures
    f(r) = a + b*(1 - exp(-2*r/miu));
end

f_int = floor(f);

no_images = size(Data,1);
no_images_per_texture = 10;
y = zeros(no_images,1);
y_verify = y;

for k=1:size(combinations,1)
    k
    columns = combinations{k,1}; %[6 8 14]; % combinations{k,1};
    X = zeros(no_images, size(columns,2));
    
    for i=1:no_images_per_texture:no_images
        texture_ID = I(floor(i/no_images_per_texture) + 1,2); % the texture number is retrieved from I
        y(i:i+no_images_per_texture-1,1) = floor(i/no_images_per_texture) + 1; % it's a vector with the texture number from 1 to 69 10 times for each image belonging to a texture
        X(i:i+no_images_per_texture-1,:) = Data((texture_ID-1)*no_images_per_texture + 1 : texture_ID * no_images_per_texture,columns); % with the texture number we go to the right location in the Data matrix and take the 10x14 block of numbers and move it in the X matrix at the correct postion considering the hierarchy considered (1-roughest and 69 smoothest)
    end
    
    % b = regress(y,X);
    b = mvregress(X,y); % the regression coefficients
    
    for i=1:no_images
        y_verify(i) = sum(b'.*X(i,:)); %obtain the computer texture ordering 
    end
    
    for i=1:no_images_per_texture:no_images
        y_verify_mean(floor(i/no_images_per_texture) + 1,1) = mean(y_verify(i:i+no_images_per_texture-1,1));% obtain the mean roughness per each group of 10 pictures (texture)
    end
    
    [~,y_verify_ordered] = sort(y_verify_mean,1,'ascend'); %order the textures in terms of roughness value and keep the texture ID ordering
    
    accuracy = ranking_accuracy(I(:,2),y_verify_ordered,f_int);
    
    [p,tbl,stats] = kruskalwallis(reshape(y_verify(:,1),[10,69]),[],'off');
    combinations{k,2} = tbl{2,5}; % the chi^2 distance as metric
    
    c = multcompare(stats);
    p_values = c(:,end);
    combinations{k,3} = numel(p_values(p_values < 0.001));
    combinations{k,4} = numel(p_values(p_values < 0.01));
    combinations{k,5} = numel(p_values(p_values < 0.05));
    
    alpha = 0.05;
    c = multcompare(stats,'Alpha',alpha,'CType','bonferroni');    
    pValues = c(:,6);
    correctedAlpha = alpha/(69*34);
    
    combinations{k,6} = numel(pValues(find(pValues < correctedAlpha)))*100 / numel(pValues);
    combinations{k,7} = sum(pValues(find(pValues < 0.001))) / numel(pValues);
    combinations{k,8} = accuracy;
    
    combinations{k,9} = b; %save also the regression coefficients
    combinations{k,10} = k;
    close all
end
% combinations = sortrows(combinations,-2);
save('roughness_best_parameter_configuration_symmetric_new_accuracy_I.mat','combinations');