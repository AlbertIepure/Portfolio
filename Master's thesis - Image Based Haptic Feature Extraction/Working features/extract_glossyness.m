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

Data = zeros(number_of_images,4);
output = zeros(40,3);

% for d=33:34
%     d
for i=506:number_of_images
    disp(strcat(num2str(i),'/',num2str(number_of_images)));
    textureImageFiles(i).name(end-2:end) = 'jpg';
    str = strcat(path,textureImageFiles(i).name);
    I = imread(str);
   
    tic
    [ratio,s] = glossiness(I);

    results(i).time = toc;
    results(i).name = textureImageFiles(i).name;
    results(i).ratio = ratio;  
    results(i).s = s; 
end

for i=1:690
        Data(i,1) = results(i).ratio;
        Data(i,2) = results(i).s;
        Data(i,3) = i;
        Data(i,4) = results(i).time;
end

Data(:,3) = Data(:,1)+Data(:,2);
Data(:,1:2) = [];

for i=1:1
minimum = min(Data(:,i));
maximum = max(Data(:,i));
Data(:,i) = (Data(:,i) - minimum)./(maximum - minimum);
end

save('glossiness_new.mat','Data');
    