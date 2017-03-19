clear all
close all
clc

path (path, 'D:/IVC_labs_starting_point/functions');
path (path, 'D:/IVC_labs_starting_point/analysis');
ORIGINAL_image = double(imread('D:/IVC_labs_starting_point/data/images/lena.tif'));

[height width dimensions] = size(ORIGINAL_image);

YCbCr_image = ictRGB2YCbCr(ORIGINAL_image);

% the chroma layer is left unchanged
DOWNSAMPLED_YCbCr_image_1 = YCbCr_image(:,:,1);

% downsample the chroma layers
upsampling_factor = 1;
downsampling_factor = 2;

DOWNSAMPLED_YCbCr_image_r_2 = (resample(YCbCr_image(:,:,2),upsampling_factor,downsampling_factor));
DOWNSAMPLED_YCbCr_image_2 = (resample(DOWNSAMPLED_YCbCr_image_r_2.',upsampling_factor,downsampling_factor).');
DOWNSAMPLED_YCbCr_image_r_3 = (resample(YCbCr_image(:,:,3),upsampling_factor,downsampling_factor));
DOWNSAMPLED_YCbCr_image_3 = (resample(DOWNSAMPLED_YCbCr_image_r_3.',upsampling_factor,downsampling_factor).');
    
%% for each layer, the first row and column are the same for the predicted 
%% and decoded image

PREDICTED_image_1 = DOWNSAMPLED_YCbCr_image_1*0;
PREDICTED_image_2 = DOWNSAMPLED_YCbCr_image_2*0;
PREDICTED_image_3 = DOWNSAMPLED_YCbCr_image_3*0;

DECODED_image_1 = DOWNSAMPLED_YCbCr_image_1*0;
DECODED_image_2 = DOWNSAMPLED_YCbCr_image_2*0;
DECODED_image_3 = DOWNSAMPLED_YCbCr_image_3*0;

ERROR_image_1 = DOWNSAMPLED_YCbCr_image_1*0;
ERROR_image_2 = DOWNSAMPLED_YCbCr_image_2*0;
ERROR_image_3 = DOWNSAMPLED_YCbCr_image_3*0;


PREDICTED_image_1(1,:) = DOWNSAMPLED_YCbCr_image_1(1,:);
PREDICTED_image_1(:,1) = DOWNSAMPLED_YCbCr_image_1(:,1);
PREDICTED_image_2(1,:) = DOWNSAMPLED_YCbCr_image_2(1,:);
PREDICTED_image_2(:,1) = DOWNSAMPLED_YCbCr_image_2(:,1);
PREDICTED_image_3(1,:) = DOWNSAMPLED_YCbCr_image_3(1,:);
PREDICTED_image_3(:,1) = DOWNSAMPLED_YCbCr_image_3(:,1);

DECODED_image_1(1,:) = DOWNSAMPLED_YCbCr_image_1(1,:);
DECODED_image_1(:,1) = DOWNSAMPLED_YCbCr_image_1(:,1);
DECODED_image_2(1,:) = DOWNSAMPLED_YCbCr_image_2(1,:);
DECODED_image_2(:,1) = DOWNSAMPLED_YCbCr_image_2(:,1);
DECODED_image_3(1,:) = DOWNSAMPLED_YCbCr_image_3(1,:);
DECODED_image_3(:,1) = DOWNSAMPLED_YCbCr_image_3(:,1);


% luminace
for j=2:height
    for k=2:width
        PREDICTED_image_1(j,k) = (7/8)*DECODED_image_1(j,k-1) - (1/2)*DECODED_image_1(j-1,k-1) + (5/8)*DECODED_image_1(j-1,k);
        ERROR_image_1(j,k) = DOWNSAMPLED_YCbCr_image_1(j,k) -  PREDICTED_image_1(j,k);
        DECODED_image_1(j,k) = ERROR_image_1(j,k) + PREDICTED_image_1(j,k);
    end
end


%chrominance

for j=2:height/downsampling_factor
    for k=2:width/downsampling_factor
        PREDICTED_image_2(j,k) = (3/8)*DECODED_image_2(j,k-1) - (1/4)*DECODED_image_2(j-1,k-1) + (7/8)*DECODED_image_2(j-1,k);
        ERROR_image_2(j,k) = DOWNSAMPLED_YCbCr_image_2(j,k) -  PREDICTED_image_2(j,k);
        DECODED_image_2(j,k) = ERROR_image_2(j,k) + PREDICTED_image_2(j,k);
        
        PREDICTED_image_3(j,k) = (3/8)*DECODED_image_3(j,k-1) - (1/4)*DECODED_image_3(j-1,k-1) + (7/8)*DECODED_image_3(j-1,k);
        ERROR_image_3(j,k) = DOWNSAMPLED_YCbCr_image_3(j,k) -  PREDICTED_image_3(j,k);
        DECODED_image_3(j,k) = ERROR_image_3(j,k) + PREDICTED_image_3(j,k);
    end
end
    
pmf_error = stats_marg([ERROR_image_1(:); ERROR_image_2(:); ERROR_image_3(:)]);

[ BinaryTree, HuffCode, BinCode, Codelengths] = buildHuffman(pmf_error);

bytestream = enc_huffman_new( round([ERROR_image_1(:); ERROR_image_2(:); ERROR_image_3(:)]) + 256, BinCode, Codelengths);

Reconstructed_ERROR = double( dec_huffman_new ( bytestream, BinaryTree, max(size([ERROR_image_1(:); ERROR_image_2(:); ERROR_image_3(:)])) )) - 256;

Reconstructed_ERROR_1 = reshape(Reconstructed_ERROR(1:height*width),height,width); % for the luminance plane
Reconstructed_ERROR_2 = reshape(Reconstructed_ERROR(1+height*width:height*width+(height/downsampling_factor)*(width/downsampling_factor)),height/downsampling_factor,width/downsampling_factor); % for the luminance plane
Reconstructed_ERROR_3 = reshape(Reconstructed_ERROR(1+height*width+(height/downsampling_factor)*(width/downsampling_factor):max(size(Reconstructed_ERROR))),height/downsampling_factor,width/downsampling_factor); % for the luminance plane

DECODED_image_enc_1 = Reconstructed_ERROR_1 + PREDICTED_image_1;
DECODED_image_enc_2 = Reconstructed_ERROR_2 + PREDICTED_image_2;
DECODED_image_enc_3 = Reconstructed_ERROR_3 + PREDICTED_image_3;

upsampling_factor = 2;
downsampling_factor = 1;

UPSAMPLED_image = ORIGINAL_image*0;

UPSAMPLED_image_1 = DECODED_image_enc_1;

UPSAMPLED_image_2_r = (resample(DECODED_image_enc_2,upsampling_factor,downsampling_factor));
UPSAMPLED_image_2 = (resample(UPSAMPLED_image_2_r.',upsampling_factor,downsampling_factor).');
UPSAMPLED_image_3_r = (resample(DECODED_image_enc_3,upsampling_factor,downsampling_factor));
UPSAMPLED_image_3 = (resample(UPSAMPLED_image_3_r.',upsampling_factor,downsampling_factor).');

UPSAMPLED_image(:,:,1) = UPSAMPLED_image_1;
UPSAMPLED_image(:,:,2) = UPSAMPLED_image_2;
UPSAMPLED_image(:,:,3) = UPSAMPLED_image_3;

RECONSTRUCTED_image = ictYCbCr2RGB(round(UPSAMPLED_image));

figure
plot(pmf_error)
figure
imshow(uint8(RECONSTRUCTED_image))

H_error = calc_entropy(pmf_error);
                
Bitrate = length(bytestream)*8 / width / height;

MSE = calcMSE (RECONSTRUCTED_image, ORIGINAL_image, height, width, dimensions);

PSNR = calcPSNR(MSE, RECONSTRUCTED_image);

save('E:/IVC_labs_starting_point/exercises/my_codec','PSNR');
        
