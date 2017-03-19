clear all
close all
clc

path (path, 'F:/IVC_labs_starting_point/functions');
ORIGINAL_image = double(imread('F:/IVC_labs_starting_point/data/images/lena.tif'));

[height width dimensions] = size(ORIGINAL_image);

for i=1:dimensions
    for j=1:height
        for k=1:width
            if k==1
                PREDICTED_image(j,k,i) = ORIGINAL_image(j,k,i);
                DECODED_image(j,k,i) = ORIGINAL_image(j,k,i);
                ERROR_image(j,k,i) = ORIGINAL_image(j,k,i) - PREDICTED_image(j,k,i);
            else
                PREDICTED_image(j,k,i) = DECODED_image(j,k-1,i);
                ERROR_image(j,k,i) = ORIGINAL_image(j,k,i) -  PREDICTED_image(j,k,i);
                DECODED_image(j,k,i) = ERROR_image(j,k,i) + PREDICTED_image(j,k,i);
            end
        end
    end
end
 
pmf_error = stats_marg(ERROR_image);
figure
plot(pmf_error)
figure
imshow(uint8(ERROR_image))
imwrite(ERROR_image, 'Error_image_2_4_a.jpg')
H_error = calc_entropy(pmf_error);
                
            

        
