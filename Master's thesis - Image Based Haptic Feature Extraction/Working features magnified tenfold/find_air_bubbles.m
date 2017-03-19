function ratio = find_air_bubbles(I)

% imshow(I)
[centers, radii, metric] = imfindcircles(I,[2 20]);
% viscircles(centers, radii,'EdgeColor','b');
Area_Bubbles = sum(pi*radii.^2);
Area_Image = size(I,1) * size(I,2);
ratio = (Area_Bubbles / Area_Image) * 100;