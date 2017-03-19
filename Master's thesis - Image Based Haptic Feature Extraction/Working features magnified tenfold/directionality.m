function [Fdirectionality,theta] = directionality(I)
%#codegen

% im[lemented as described in the paper : 
% A GEOMETRIC METHOD TO COMPUTE DIRECTIONALITY FEATURES FOR TEXTURE
% IMAGES

threshold = 12;
n_bins = 16;
Prewitt_H_kernel = [-1 0 1; -1 0 1; -1 0 1];
Prewitt_V_kernel = [1 1 1; 0 0 0; -1 -1 -1];

I_H = conv2(I,double(Prewitt_H_kernel),'same');
I_V = conv2(I,double(Prewitt_V_kernel),'same');
% Edge_I = (abs(I_H) + abs(I_V))./2;
% Edge_I = sqrt(I_H.^2 + I_V.^2); % according to wiki
% contour(flipdim(imrotate(Edge_I,180),2),'-k')
% figure
% imshow(edge(I))
theta = atan(I_V./(I_H + realmin))+pi/2; % some values are NaN (originating from 0/0). realmin avoids this situation
%numel(find(isnan(theta)))
I_1 = I>=threshold;
num_el = zeros(1,n_bins+1);
for k = 0:n_bins
    lower_limit = (2*k-1)*pi/(2*n_bins);
    upper_limit = (2*k+1)*pi/(2*n_bins);
    I_2 = theta>=lower_limit & theta<upper_limit;
    I_3 = I_1 & I_2;
    num_el(k+1) = numel(find(I_3));
end

H_D = num_el./sum(num_el);
% h=figure;
% plot(0:n_bins,H_D);
% title('Directional histogram');
% set(h,'defaulttextinterpreter','latex');
% xlabel('$\times \pi/16$ rad');
% ylabel('$H_d$');
% saveTightFigure(h,'dground.pdf')

[pks,pks_locs,~,~] = findpeaks(H_D);
l = length(pks);
sharpness = zeros(1,l);
if l>1
    for i=1:l
        if i==1 % for the first peak
            start = 1; %always start at the beginning
            valley = min(H_D(pks_locs(i):pks_locs(i+1))); %find the valley between two consecutive peaks
            finish = find(H_D==valley);           
        elseif i<l
            start = finish; %always start where the previous step ended
            valley = min(H_D(pks_locs(i):pks_locs(i+1))); %find the valley between two consecutive peaks
            finish = find(H_D==valley);
        else
            start = finish;
            finish = n_bins + 1;
        end
        range = start: finish;
        slope = abs(H_D(range(2:end)) - H_D(range(1:end-1))); % this is actually delta_h, but the denominator in our case is 1
        weight = 2.^(-abs(range(range~=pks_locs(i)) - pks_locs(i))+1);
        sharpness(i) = sum(weight.*slope);
    end
else
    start = 1;
    finish = n_bins + 1;
    range = start : finish;
    slope = abs(H_D(range(2:end)) - H_D(range(1:end-1))); % this is actually delta_h, but the denominator in our case is 1
    weight = 2.^(-abs(range(range~=pks_locs) - pks_locs)+1);
    sharpness = sum(weight.*slope);
end

weight_of_peaks = pks./sum(pks);

Fdirectionality =sum(sharpness.*weight_of_peaks)*numel(pks);
theta = theta.*I_1; % keep in theta only the angles corresponding to the 
                    % pixels whose values are >= t
