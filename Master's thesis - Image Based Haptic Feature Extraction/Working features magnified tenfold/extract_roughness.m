clear all
close all
clc

% The study included 48 subjects and 16 patterns.

% paths to recorded files
path = 'D:\Dropbox\München\MSCE\Magnified_Images_Cropped\';

textureImageFiles       = dir(strcat(path,'*.jpg'));
number_of_images = numel(textureImageFiles);
results = struct;
img_per_texture = 10;

Data = zeros(number_of_images,2);
output = zeros(40,3);

% for d=33:34
%     d
for i=1:number_of_images
    disp(strcat(num2str(i),'/',num2str(number_of_images)));
    textureImageFiles(i).name(end-2:end) = 'jpg';
    str = strcat(path,textureImageFiles(i).name);
    I = imread(str);
    RGB = imread(str);
    I = rgb2gray(RGB); %convert to grayscale
%     imshow(I)
    I = double(I);

%     Fcoarseness = coarseness_mex(I);
    tic
    Froughness = roughness_not_symmetric(I);
    Data(i,1:14) = Froughness;
    Data(i,15) = toc;
end

save('roughness_parameters_not_symmetric.mat','Data');
    