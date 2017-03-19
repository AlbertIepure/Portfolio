clear all
close all
clc

load('Dominant_Color_RGB.mat');
for i=1:size(colors12,1)
    if colors12(i,5:7) == [0,0,0]
        RGB(i,:) = colors12(i,2:4);
    else
        RGB(i,:) = (colors12(i,2:4) + colors12(i,5:7))/2;
    end
end

color_difference = zeros(size(colors12,1),1);
optimum_color_difference = zeros(size(colors12,1),1);
% color_references_to_test = [0 0 0; 0 0 1; 0 1 2;
%                             30 31 32; 32 32 32; 32 33 34;
%                             62 63 64; 64 64 64; 64 65 66;
%                             94 95 96; 96 96 96; 96 97 98;
%                             126 127 128; 128 128 128; 128 129 130;
%                             158 159 160; 160 160 160; 160 161 162;
%                             190 191 192; 192 192 192; 192 193 194;
%                             222 223 224; 224 224 224; 224 225 226;
%                             253 254 255; 254 254 254; 255 255 255];

color_references_to_test = [0 0 0; 
                            32 32 32;
                            64 64 64; 
                            96 96 96;
                            128 128 128; 
                            160 160 160;
                            192 192 192; 
                            224 224 224; 
                            255 255 255];
                            

tic
for j=1:size(color_references_to_test,1)
            r = color_references_to_test(j,1); 
            g = color_references_to_test(j,2);   
            b = color_references_to_test(j,3);   
            [L_r c_r h_r] = colorspace('Lab<-RGB',[r g b]);
            for i=1:size(colors12,1)
                [L c h] = colorspace('Lab<-RGB',round(RGB(i,:).*255));
                color_difference(i) = ColorDifference(L,c,h,L_r,c_r,h_r);
            end
            x = sort(color_difference);
            minimum = x(1);
            maximum = x(end);
            color_difference(:,1) = (color_difference(:,1) - minimum)./(maximum - minimum);
            [p,tbl,stats]  = kruskalwallis(reshape(color_difference(:,1),[10,69]),[],'off');
            results(j,1) = tbl{2,5};
            alpha = 0.05;
            c = multcompare(stats,'Alpha',alpha,'CType','bonferroni');
            pValues = c(:,6);
            correctedAlpha = alpha/numel(pValues);
%             results(j,2) = numel(find(pValues < correctedAlpha)) / numel(pValues);
%             results(j,2) = sum(pValues(find(pValues < alpha)))/numel(find(pValues < alpha)); % GFC
%             results(j,2) = numel(find(pValues < alpha)); % GFC
            results(j,2) = numel(pValues(find(pValues < correctedAlpha)))*100/numel(pValues);
            results(j,3) = j;
            FDR = mafdr(pValues);
            results(j,4) = numel(FDR(find(FDR < alpha)))*100 / numel(pValues);
end
toc            
            
figure
plot(results(:,3),results(:,2))
xlabel('Configuration number');
ylabel('GFC');
title('GFC as function of the configuration number');            

figure
plot(results(:,3),results(:,4))
xlabel('Configuration number');
ylabel('FDR');
title('FDR as function of the configuration number'); 