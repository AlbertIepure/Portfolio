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
d_max = 40;

Data = zeros(number_of_images,2*d_max);

for d=41:60
    d
    parfor i=1:number_of_images
        disp(strcat(num2str(i),'/',num2str(number_of_images)));
        textureImageFiles(i).name(end-2:end) = 'jpg';
        str = strcat(path,textureImageFiles(i).name);
        RGB = imread(str);
        I = rgb2gray(RGB);
        I = double(I);
        
        tic
        Fcomplexity = complexity_mex(I,double(d));
        
        results(i).time = toc;
        results(i).name = textureImageFiles(i).name;
        results(i).complexity = Fcomplexity;
    end
    
    for i=1:690
        Data(i,2*d-1) = results(i).complexity;
        Data(i,2*d) = results(i).time;
    end

    for i=1:1
        minimum = min(Data(:,2*d-1));
        maximum = max(Data(:,2*d-1));
        Data(:,2*d-1) = (Data(:,2*d-1) - minimum)./(maximum - minimum);
    end
end

save('complexity_41_60_new.mat','Data');
    