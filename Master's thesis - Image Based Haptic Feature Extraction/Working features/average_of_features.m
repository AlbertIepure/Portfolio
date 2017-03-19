clear all
close all
clc

load ('Feature_Matrix.mat');

results = zeros(69,11);
row = 1;
for i=1:10:size(Feature_Matrix,1)
    for j=1:size(Feature_Matrix,2)
        results(row,j) = mean(Feature_Matrix(i:i+9,j));
    end
    row = row + 1;
end
  
for i=1:690
    for j=1:11
        if j== 1 || j==5 || j==6 || j==10 || j==11
            results(i,j) = 0;
        end
    end
end
