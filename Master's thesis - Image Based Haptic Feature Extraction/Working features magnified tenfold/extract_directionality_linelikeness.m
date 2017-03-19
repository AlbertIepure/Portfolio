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
    linelikeness_range = zeros(1,10);
    disp(strcat(num2str(i),'/',num2str(number_of_images)));
    textureImageFiles(i).name(end-2:end) = 'jpg';
    str = strcat(path,textureImageFiles(i).name);
    I = imread(str);
    RGB = imread(str);
    I = rgb2gray(RGB); %convert to grayscale
%     imshow(I)
    I = double(I);

    tic
    [Fdirectionality,theta] = directionality(I);
    results(i).time1 = toc;
    
    tic
    parfor j=2:10
        linelikeness_range(j) = linelikeness_mex(I,theta,double(j));
    end
    
    Flinelikeness = sum(linelikeness_range(2:10));

    results(i).time2 = toc;
    results(i).name = textureImageFiles(i).name;
    results(i).directionality = Fdirectionality;
    results(i).linelikeness = Flinelikeness;
end

for i=1:690
        Data(i,1) = results(i).directionality;
        Data(i,2) = results(i).time1;
        Data(i,3) = results(i).linelikeness;
        Data(i,4) = results(i).time2;
end

for i=1:2:4
minimum = min(Data(:,i));
maximum = max(Data(:,i));
Data(:,i) = (Data(:,i) - minimum)./(maximum - minimum);
end

save('directionality_linelikeness_new.mat','Data');
    