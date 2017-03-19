clear all
close all
clc

% The study included 48 subjects and 16 patterns.

% paths to recorded files
path = 'D:\Dropbox\München\MSCE\Image_Database\';

textureImageFiles       = dir(strcat(path,'*.jpg'));
number_of_images = numel(textureImageFiles);
results = struct;
img_per_texture = 10;

Data = zeros(number_of_images,2);
output = zeros(40,3);

% for d=33:34
%     d
parfor i=1:number_of_images
    linelikeness = zeros(1,10);
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
%     Fcontrast = contrast(I);
%     Fedginess = edginess(I);
%     [Fdirectionality,theta] = directionality(I);
    Fregularity = regularity(I);
%     results(i).time1 = toc;
%     
%     tic
%     parfor j=1:10
%         linelikeness(j) = linelikeness_mex(I,theta,j);
%     end
%     
%     Flinelikeness = sum(linelikeness(1:10));
% 
%     
%     results(i).time2 = toc;
    results(i).time = toc;
    results(i).name = textureImageFiles(i).name;
%     results(i).coarseness = Fcoarseness;
%     results(i).contrast = Fcontrast;
%     results(i).directionality = Fdirectionality;
%     results(i).linelikeness = Flinelikeness;  
%     results(i).edginess = Fedginess;  
    results(i).regularity = Fregularity;  
end

for i=1:690
        Data(i,1) = results(i).regularity;
        Data(i,2) = results(i).time;
end

for i=1:1
minimum = min(Data(:,i));
maximum = max(Data(:,i));
Data(:,i) = (Data(:,i) - minimum)./(maximum - minimum);
end

save('regularity_new.mat','Data');
    