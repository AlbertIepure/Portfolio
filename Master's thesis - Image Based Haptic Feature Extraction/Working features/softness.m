function Fsoftness = softness(I)

ratio_circles = find_air_bubbles(I);

% addpath('D:\Dropbox\München\MSCE\Thesis Albert\Features\export_fig\');
Lh = 210;

% figure
% imshow(I, [])

I = histeq (I);
I = medfilt2(I);

[rows, columns] = size(I);

I = double(I);
for i=1:rows
    for j=1:columns
        if I(i,j) <= Lh
            I(i,j) = Lh/(sqrt(Lh-I(i,j))+1) - Lh/(sqrt(Lh)+1);
        end
        
    end
end

% figure
% imshow(I, [])

I = uint8(round(I));
level = graythresh(I);
BW = im2bw(I,level);
% figure
% imshow(BW)

% IL = bwlabel(BW);
% R = regionprops(BW,'Area');

LB = 2000;
% UB = max([R.Area]);
% if UB > 150000 %most likely  a highlight
    UB = 150000;
% end

% ind = find([R.Area] >= LB & [R.Area] <= UB);
% Iout = ismember(IL,ind);
Iout = bwareafilt(BW,[LB UB]);
% figure
% imshow(Iout);

% Calculate its connected regions
L = bwlabel(Iout); % Not using bwconncomps() for older version users
stats = regionprops(Iout,'Extent');
% Find the ones that are like a circle
minExtent = 0.55;
keepMask = [stats.Extent]>minExtent;

% Extract the image of circles only and display
BWcircles = ismember(L, find(keepMask));
BWnonCircles = Iout & ~BWcircles;

se = strel('diamond',4);        
BWnonCircles = imerode(BWnonCircles,se);
% figure
% imshow(BWnonCircles)

% Show the things we removed
% figure, imshow(BWnonCircles)

% F = fft2(BWnonCircles);
% F = fftshift(F);
% F = abs(F);
% F = log2(F+1);
% T_min = min(min(F));
% T_max = max(max(F));
% F = floor((F-T_min)*255/(T_max-T_min)+0.5);
% 
% lower_threshold = 150;
% imshow(F,[lower_threshold 180]);
% IM = export_fig(gca);
% 
% hLocalMax = vision.LocalMaximaFinder;
% hLocalMax.MaximumNumLocalMaxima = 1024;
% hLocalMax.Threshold = 100;
% location = step(hLocalMax, IM(2:end-1,2:end-1));
% [r,c] = size(IM);
% BW = zeros(r,c);
% for j=1:size(location,1)
%     BW(location(j,2),location(j,1)) = 1;
% end
% Solidity = regionprops(BW,'solidity');
% 
% if ~isempty(Solidity)
%     Solidity = Solidity.Solidity;
% end
% 
% if strcmp(Ftextured,'YES')
%     
%     % Rmin = 20;
%     % Rmax = 50;
%     % [centers, radii] = imfindcircles(Iout,[Rmin Rmax]);
%     % viscircles(centers, radii,'EdgeColor','b');
%     %
%     [H,T,R] = hough(BWnonCircles);
%     %     imshow(H,[],'XData',T,'YData',R,...
%     %         'InitialMagnification','fit');
%     %     xlabel('\theta'), ylabel('\rho');
%     %     axis on, axis normal, hold on;
%     P  = houghpeaks(H,200,'threshold',ceil(0.3*max(H(:))));
%     %         x = T(P(:,2)); y = R(P(:,1));
%     %     plot(x,y,'s','color','white');
%     % Find lines and plot them
%     lines = houghlines(BWnonCircles,T,R,P,'FillGap',5,'MinLength',40);
%     %     figure, imshow(BWnonCircles), hold on
%     for k = 1:length(lines)
%         xy = [lines(k).point1; lines(k).point2];
%         %         %    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
%         BWnonCircles(xy(1,2):xy(2,2),xy(1,1):xy(2,1)) = zeros(xy(2,2)-xy(1,2)+1,xy(2,1)-xy(1,1)+1) ; % remove line
%         %    imshow(BWnonCircles)
%         % Plot beginnings and ends of lines
%         %    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%         %    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
%         
%     end
%     %     imshow(BWnonCircles)
% end

IL = bwlabel(BWnonCircles);

R = regionprops(BWnonCircles,'Area','Extrema');
if ~isempty(R)
    no_of_objects = size([R.Area],2);
    for i=1:no_of_objects
        MaxRadius = max([R(i).Extrema(14) - R(i).Extrema(9), R(i).Extrema(13) - R(i).Extrema(10), R(i).Extrema(3) - R(i).Extrema(8), R(i).Extrema(4) - R(i).Extrema(7)]);
        R(i).Circularity = R(i).Area/(pi*MaxRadius^2);
    end
    ind = find([R.Circularity] <= 0.08);
    Iout = ismember(IL,ind);
    
    LB = 1000;
%     if UB > 150000 %most likely  a highlight
        UB = 50000;
%     end
    
%     IL = bwlabel(Iout);
%     ind = find([R.Area] >= LB & [R.Area] <= UB);
%     Iout = ismember(IL,ind);
      Iout = bwareafilt(Iout, [LB UB]);
%     figure
%     imshow(Iout);
end

% points = detectSURFFeatures(Iout);
% scale = points.Scale;
% [val,pos] = sort(scale,'descend');
% % imshow(Iout); hold on;
% % plot(points.selectStrongest(100));
% large_scale_SURF_features = numel(val);
% avg_scale = 0;
% 
% if large_scale_SURF_features >200
%     limit = 200;
% else
%     limit = large_scale_SURF_features;
% end

% for i=1:limit
%     plot(points(pos(i)));
% end

% if large_scale_SURF_features ~= 0
%     avg_scale = mean(val(1:limit));
% else
%     avg_scale = 0;
% end

ratio_hairiness = bwarea(Iout)*100/(size(Iout,1)*size(Iout,2));
Fsoftness = ratio_hairiness + ratio_circles;

% R = regionprops(Iout,'Area','Perimeter','Extent');
% for i=1:size(R,1)
%     if R(i).Perimeter < 1000
%         R(i).linelike = (R(i).Perimeter.^2)/R(i).Area;
%     else
%         R(i).linelike = 0;
%     end
% end

% % IL = bwlabel(Iout);
% Area = [];
% if strcmp(Ftextured,'YES')
%         n_hairs = 0;        
% elseif ~isempty(R)
%     ind = find([R.linelike] >= 50 & [R.Extent] < 0.2);
% %     Iout = ismember(IL,ind);
%     n_hairs = size(ind,2);
%     Area = sum([R(ind).Area]);
% else
%     n_hairs = 0;
% end
% -------------------------------------------------------------------------
% % imshow(Iout)
% 
% % A = regionprops(Iout,'area');
% % area_before = sum([A.Area]);
% % % figure
% % Iout_edge = edge(Iout,'canny');
% % % imshow(Iout_edge)
% % A = regionprops(Iout_edge,'area');
% % area_after = sum([A.Area]);
