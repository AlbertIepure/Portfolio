clear all
close all
clc

path (path, 'E:/IVC_labs_starting_point/functions');
ORIGINAL_image = imread('E:/IVC_labs_starting_point/data/images/lena.tif');

tic
pmf_cond = stats_cond(ORIGINAL_image);
toc

figure
mesh(pmf_cond)
title('Joint histogram of every two horizontally adjacent pixels for lena.tif');

sum_on_columns = sum(pmf_cond);
pmf_cond_normalized = pmf_cond;

H = 0;

for i=1:256
    if sum_on_columns(i) ~= 0
        pmf_cond_normalized(:,i) = pmf_cond(:,i)/sum_on_columns(i);
    end
end

total_samples = sum(sum(pmf_cond));
pmf_cond = pmf_cond/total_samples;

for i=1:256
    for j=1:256
        if pmf_cond_normalized(i,j) ~= 0
            H = H - pmf_cond(i,j)*log2(pmf_cond_normalized(i,j));
        end
    end
end

        
