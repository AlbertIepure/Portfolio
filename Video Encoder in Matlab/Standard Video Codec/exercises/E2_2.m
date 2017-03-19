clear all
close all
clc

path (path, 'E:/IVC_labs_starting_point/functions');
ORIGINAL_image = imread('E:/IVC_labs_starting_point/data/images/lena.tif');

tic
pmf_joint = stats_joint(ORIGINAL_image);
toc

figure
mesh(pmf_joint)
title('Joint histogram of every two horizontally adjacent pixels for lena.tif');

H = 0;
total_samples = sum(sum(pmf_joint));
pmf_joint = pmf_joint/total_samples;
for i=1:256
    for j=1:256
        if pmf_joint(i,j) ~= 0
            H = H - pmf_joint(i,j)*log2(pmf_joint(i,j));
        end
    end
end

        
