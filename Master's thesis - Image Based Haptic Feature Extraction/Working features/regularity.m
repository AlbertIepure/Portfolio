function Solidity = regularity(I)
%% With bilinear filtering and histogram equalization
% addpath(folder_path);

% Set bilateral filter parameters.
w     = 5;       % bilateral filter half-width
sigma = [3 30]; % bilateral filter standard deviations
tol   = 0.01;

I = double(I)./255;
% Apply bilateral filter to each image.
% Source: http://www.mathworks.com/matlabcentral/fileexchange/12191-bilateral-filtering

%     bflt_I = bfilter2(I,w,sigma);

[I, ~] =  shiftableBF(I, sigma(1), sigma(2), w, tol);

%% Histogram equalization to improve contrast
I = histeq(I);

for i=1:2
    if i==1
        F = fft2(I);
    else
        F = fft2(F);
    end
    
    F = fftshift(F); % Center FFT
    F = abs(F); % Get the magnitude
end

T_min = min(min(F));
T_max = max(max(F));
F = floor((F-T_min)*255/(T_max-T_min)+0.5);

% % figure
% IM = mat2gray(F,[150 180]);
% IM = uint8(255.*IM);

% figure

i = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Working
    % inspired by: http://stackoverflow.com/questions/29350867/is-there-any-regularity-detection-tool-for-regions-inside-an-image
    hLocalMax = vision.LocalMaximaFinder;
    hLocalMax.MaximumNumLocalMaxima = 1024;
    %     hLocalMax.NeighborhoodSize = [5 5]; %standard is [5 7]
hLocalMax.Threshold = 10;
% while i==1
%     imshow(F,[lower_threshold 180]);
%     IM = export_fig(gca);
%     close
%     IM = mat2gray(F,[lower_threshold 180]);
%     IM = IM.*255;
%     imshow(IM,[]);
    
    % Other ideas
    % http://www.mathworks.com/matlabcentral/fileexchange/35784-sample-entropy
    % http://www.mathworks.com/matlabcentral/fileexchange/32427-fast-approximate-entropy
    % http://de.mathworks.com/help/stats/ttest.html
    
%     hLocalMax.Threshold = 100;
    
    
    location = step(hLocalMax, F); %(2:end-1,2:end-1)
    
%     if size(location,1) >= 150
%         i=0;
%     else
%         hLocalMax.Threshold = hLocalMax.Threshold - 10;
%     end
%      no_points = [no_points (hLocalMax.Threshold+10)*(-1) size(location,1)];
% end

l_1 = min(size(I))/2;
l_2 = max(size(I))/2;

a = find(location(:,1) >= l_2 - 2 & location(:,1) <= l_2 + 2);
b = find(location(:,2) >= l_1 - 2 & location(:,2) <= l_1 + 2);

if (length(a) + length(b)) >= length(location)
    if length(a)<length(b)
        location(b,:) = [];
    else
        location(a,:) = [];
    end
else
    location([a;b],:) = [];
end

location(find(location(:,1)==1),:)=[];

[r,c] = size(F);
BW = zeros(r,c);
%     BW = IM*0;
for j=1:size(location,1)
    BW(location(j,2),location(j,1)) = 1;
end

% BW(1,1) = 0;

% figure
% imshow(BW,[])
Solidity = regionprops(BW,'solidity');
Solidity = Solidity.Solidity;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%