clear all
close all
clc

% inspired by:
% https://charlesleifer.com/blog/using-python-and-k-means-to-find-the-dominant-colors-in-images/
% https://makarandtapaswi.wordpress.com/2010/09/07/mpeg-7-colour-dominant-colour-descriptor/
% http://www.mathworks.com/matlabcentral/fileexchange/28790-colorspace-transformations
% https://vis4.net/blog/posts/avoid-equidistant-hsv-colors/
% http://stevehanov.ca/blog/index.php?id=116
% http://stackoverflow.com/questions/9018016/how-to-compare-two-colors
% https://en.wikipedia.org/wiki/Additive_color
% https://en.wikipedia.org/wiki/Color_difference
% http://de.mathworks.com/discovery/image-segmentation.html
% http://encycolorpedia.de/7d7755

% for the machine learning part we are going to output the rgb components
% of the dominant color because if we yield only the label, we are going to
% restict the dimensions from 3 to 1, which is not good. Concerning the
% textures with two dominant colors, these are outlyers in our feature space
% Sometimes one of teh colors are either black and white, which suggests
% that bichromaticity might also be due to illumination. That's why we have
% decided that in this case to average the two dominant colors and get the
% characteristic color of the textures (the three rgb components without
% the labeling, which the machine learning is going to do by itself). In
% this way we make it illumination independent
tic
% RGB = imresize(imread('G1PlasticMeshVersion2_1.jpg'),0.25);
path = 'D:\Dropbox\München\MSCE\Image_Database\';
% RGB = (imread(strcat(path,'G9TableClothVersion1_0.jpg')));

threshold_monochromatic = 41;

textureImageFiles       = dir(strcat(path,'*.jpg'));
number_of_images = numel(textureImageFiles);

colors12 = zeros(number_of_images,7);
colors12(:,1) = [1:1:number_of_images]';
DominantColors = cell(number_of_images,3);
for m=161:number_of_images
    m
    close all
    clc
    texture_name = textureImageFiles(m).name;
    texture_name(end-2:end) = 'jpg'; %make sure that the extension is .jpg and not .JPG
    
    DominantColors(m,1) = {texture_name};
    
    str = strcat(path,texture_name);
    RGB = imread(str);
    height = size(RGB,1);
    width = size(RGB,2);
    
    %convert to lab
    % labTransformation = makecform('rgb2lab');
    % labI = applycform(RGB,labTransformation);
    
    if height > 1000  && width > 1000
        RGB = imresize(RGB, 0.25);
    end
    
    figure
    subplot(2,2,1);
    imshow(RGB,[])
    
    lchI = colorspace('Lch<-RGB',RGB);
    
    %seperate l,a,b
    L = lchI(:,:,1);
%     L = adapthisteq(L);
    C = lchI(:,:,2);
    H = lchI(:,:,3);
    % For typical images, u* and v* range ±100. By definition, 0 ? L* ? 100.
    % https://en.wikipedia.org/wiki/CIELUV
    
    % figure, imshow(L,[]) , title('L');
    % figure, imshow(C,[]) , title('A');
    % figure, imshow(H,[]) , title('B');
    
    x = C(:);
    y = H(:);
    % color_matrix = [R(:),G(:),B(:)];
    % scatter(x,y,[],[R(:),G(:),B(:)]);
    % figure
    subplot(2,2,2);
    plot(x,y,'.');
    xlabel('Chroma values');
    ylabel('Hue values');
    ylabh = get(gca,'ylabel');
    set(ylabh,'Position',get(ylabh,'Position') - [0.1 0 0])
    
    X = [x,y];
    
    k = 5;
    opts = statset('Display','final');
    [idx,C,~,distances] = kmeans(X,k,'Distance','cityblock','Replicates',5,'Options',opts);
    
    colors = {'r.','g.','b.','y.','m.','c.','r.','b.'};
    % figure
    subplot(2,2,3);
    for i=1:k
        n_rgb(i,1) = numel(find(idx==i));
        n_lab(i,1) = numel(find(idx==i));
        [~,pos] = min(distances(:,i));
        plot(X(idx==i,1),X(idx==i,2),colors{i},'MarkerSize',12);
        hold on
        
        l=L(pos);
        c=C(i,1);
        h=C(i,2);
        
        %     rgb=lab2rgb([l a b]); % some colors are out of gamut
        % http://www.mathworks.com/examples/image/2096-determine-if-l-a-b-value-is-in-rgb-gamut
        rgb=colorspace('RGB<-Lch',[l c h]);
        
        n_rgb(i,2:4) = rgb; %save the color combination
        n_lab(i,2:4) = colorspace('Lab<-Lch',[l c h]); %save the color combination
    end
    plot(C(:,1),C(:,2),'kx',...
        'MarkerSize',15,'LineWidth',3)
    legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5','Centroids',...
        'Location','NE')
    title('Cluster Assignments and Centroids')
    xlabel('Chroma values');
    ylabel('Hue values');
    ylabh = get(gca,'ylabel');
    set(ylabh,'Position',get(ylabh,'Position') - [0.1 0 0])
    hold off
    
    [Y,I]=sort(n_rgb(:,1),'descend');
    n_rgb_sorted = n_rgb(I,:);
    n_lab_sorted = n_lab(I,:);
    
    for j=1:5
        for i=1:k
            L1 = n_lab_sorted(j,2);
            L2 = n_lab_sorted(i,2);
            a1 = n_lab_sorted(j,3);
            a2 = n_lab_sorted(i,3);
            b1 = n_lab_sorted(j,4);
            b2 = n_lab_sorted(i,4);
            n_lab_sorted(i,4+j) = ColorDifference(L1,a1,b1,L2,a2,b2);
        end
    end
    
    for i=1:3
        vector = n_lab_sorted(i,5:7);
        sorted = sort(vector);
        if i==1
             minimum_initial = sorted(2);
             maximum_initial = sorted(3);
             row = 1;
        else
            minimum = sorted(2);
            maximum = sorted(3);
            if maximum - minimum < maximum_initial - minimum_initial
                maximum_initial = maximum;
                minimum_initial = minimum;
                row = i;
            end
        end
    end
    
    position = find(n_lab_sorted(row,5:7) < threshold_monochromatic);
    if numel(position) == 3
        number_of_colors = 1;
        average_color = [mean(n_rgb_sorted(1:3,2)) mean(n_rgb_sorted(1:3,3)) mean(n_rgb_sorted(1:3,4))];
        color_name_1 = IdentifyColor(average_color(1),average_color(2),average_color(3));
        DominantColors(m,2) = {color_name_1};
    elseif numel(position) == 2
        number_of_colors = 2;
        color1 = [mean([n_rgb_sorted(position(1),2) n_rgb_sorted(position(2),3)]) mean([n_rgb_sorted(position(1),3) n_rgb_sorted(position(2),3)]) mean([n_rgb_sorted(position(1),4) n_rgb_sorted(position(2),4)])];
        color_name_1 = IdentifyColor(color1(1),color1(2),color1(3));
        DominantColors(m,2) = {color_name_1};
        position = find(n_lab_sorted(row,5:7) >= threshold_monochromatic);
        color2 = [n_rgb_sorted(position,2) n_rgb_sorted(position,3) n_rgb_sorted(position,4)];
        color_name_2 = IdentifyColor(color2(1),color2(2),color2(3));
        DominantColors(m,3) = {color_name_2};
    else
        number_of_colors = 2;
        color1 = [n_rgb_sorted(position,2) n_rgb_sorted(position,3) n_rgb_sorted(position,4)];
        color_name_1 = IdentifyColor(color1(1),color1(2),color1(3));
        DominantColors(m,2) = {color_name_1};
        position = find(n_lab_sorted(row,5:7) >= threshold_monochromatic);
        color2 = [mean([n_rgb_sorted(position(1),2) n_rgb_sorted(position(2),3)]) mean([n_rgb_sorted(position(1),3) n_rgb_sorted(position(2),3)]) mean([n_rgb_sorted(position(1),4) n_rgb_sorted(position(2),4)])];
        color_name_2 = IdentifyColor(color2(1),color2(2),color2(3));
        DominantColors(m,3) = {color_name_2};
    end
    
    % figure
    subplot(2,2,4);
    for i=1:k
        hold on
        bar(i,n_rgb_sorted(i,1),'FaceColor', n_rgb_sorted(i,2:4));
        xlabel('Dominant color number');
        ylabel('Number of pixels');
        legend('Dominant color','Location','north');
    end
    if number_of_colors == 1
        bar(7,n_rgb_sorted(1,1),'FaceColor', average_color);
        text(7, max(n_lab_sorted(:,1))*1.2, color_name_1, 'VerticalAlignment', 'top', 'FontSize', 6);
        colors12(m,2:4) = average_color;
        colors12(m,5:7) = [0 0 0];
    else
        bar(7,n_rgb_sorted(1,1),'FaceColor', color1);
        text(7, max(n_lab_sorted(:,1))*1.2, color_name_1, 'VerticalAlignment', 'top', 'FontSize', 6);
        bar(8,n_rgb_sorted(1,1),'FaceColor', color2);
        text(8, max(n_lab_sorted(:,1))*1.2, color_name_2, 'VerticalAlignment', 'top', 'FontSize', 6);
        colors12(m,2:7) = [color1 color2];
    end
    
    hold off
    
    ylim([0, max(n_lab_sorted(:,1)) * 2]);
    %# Add a text string above each bin
    for j=1:5
        for i = 1:k
            text(i-0.4, max(n_lab_sorted(:,1))*(2 - 0.15*j), ['', num2str(n_lab_sorted(i,4+j))], 'VerticalAlignment', 'top', 'FontSize', 6)
        end
    end
    text(7, max(n_lab_sorted(:,1))*1.6, ['row = ', num2str(row)], 'VerticalAlignment', 'top', 'FontSize', 6)
    
    saveas(gcf,[path 'Results\' texture_name])
end

% save([path 'Results\' 'DominantColorsNames_magnified.mat'],'DominantColors');
save('Dominant_Color_RGB.mat','colors12');

% [r,c] = size(colors12);
% CharacteristicColor = zeros(r,3);
% 
% for i=1:r
%     if colors12(i,5:7) == [0 0 0]
%         CharacteristicColor(i,1:3) = colors12(i,2:4);
%     else
%         CharacteristicColor(i,1:3) = mean([colors12(i,2:4);colors12(i,5:7)],1);
%     end
% end
% 
% save('CharacteristicColors.mat','CharacteristicColor');
toc