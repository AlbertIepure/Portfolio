function I_out = crop_image(I)

[h w dim] = size(I);

crop_percentage = 20;
h_crop = round(h*crop_percentage/100);
w_crop = round(w*crop_percentage/100);
I_out(:,:,1:dim) = I(h_crop:h-h_crop+1,w_crop:w-w_crop+1,1:dim);

% figure
% imshow(I)
% figure
% imshow(I_out)