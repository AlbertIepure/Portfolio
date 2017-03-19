clear all
close all
clc

ORIGINAL_image = imread('F:/IVC_labs_starting_point/data/images/noiseRGB.tif');

% [height width dimensions] = size(ORIGINAL_image);
% 
% for i=1:dimensions
%     figure
%     imhist(ORIGINAL_image(:,:,i))
% end

GRAYSCALE_image = rgb2gray(ORIGINAL_image);

figure
imhist(GRAYSCALE_image);

table = tabulate(GRAYSCALE_image(:)');

figure
plot(table(:,1)',table(:,3)');

[rows columns] = size(table);
H = 0;

for i=1:rows
    if table(i,2) ~= 0
        H = H - (table(i,3)/100)*log2(table(i,3)/100);
    end
end