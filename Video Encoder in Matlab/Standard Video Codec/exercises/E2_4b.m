clear all
close all
clc

path (path, 'E:/IVC_labs_starting_point/functions');
ORIGINAL_image = double(imread('E:/IVC_labs_starting_point/data/images/lena.tif'));

[height width dimensions] = size(ORIGINAL_image);

YCbCr_image = ictRGB2YCbCr(ORIGINAL_image);

%% for each layer, the first row and column are the same for the predicted 
%% and decoded image

PREDICTED_image = YCbCr_image*0;
DECODED_image = YCbCr_image*0;
ERROR_image = YCbCr_image*0;

for i=1:3
    PREDICTED_image(1,:,i) = YCbCr_image(1,:,i);
    PREDICTED_image(:,1,i) = YCbCr_image(:,1,i);
    DECODED_image(1,:,i) = YCbCr_image(1,:,i);
    DECODED_image(:,1,i) = YCbCr_image(:,1,i);
    ERROR_image(1,:,i) = 0; %because the predicted image firts column and row are the same with the original
    ERROR_image(:,1,i) = 0;
end

i=1;

if i==1
    for j=2:height
        for k=2:width
            PREDICTED_image(j,k,i) = (7/8)*DECODED_image(j,k-1,i) - (1/2)*DECODED_image(j-1,k-1,i) + (5/8)*DECODED_image(j-1,k,i);
            ERROR_image(j,k,i) = YCbCr_image(j,k,i) -  PREDICTED_image(j,k,i);
            DECODED_image(j,k,i) = ERROR_image(j,k,i) + PREDICTED_image(j,k,i);
        end
    end
    i=i+1;
end

for i=2:3
    for j=2:height
        for k=2:width
            PREDICTED_image(j,k,i) = (3/8)*DECODED_image(j,k-1,i) - (1/4)*DECODED_image(j-1,k-1,i) + (7/8)*DECODED_image(j-1,k,i);
            ERROR_image(j,k,i) = YCbCr_image(j,k,i) -  PREDICTED_image(j,k,i);
            DECODED_image(j,k,i) = ERROR_image(j,k,i) + PREDICTED_image(j,k,i);
        end
    end
end

pmf_error = stats_marg(ERROR_image);

ERROR_image = ictYCbCr2RGB(round(ERROR_image));

figure
plot(pmf_error)
figure
imshow(uint8(ERROR_image))
imwrite(ERROR_image, 'Error_image_2_4_b.jpg')
H_error = calc_entropy(pmf_error);
                
            

        
