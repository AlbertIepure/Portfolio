clear all
close all
clc

path (path, 'E:/IVC_labs_starting_point/functions');
path (path, 'E:/IVC_labs_starting_point/analysis');
path (path, 'E:/IVC_labs_starting_point/encoder');
path (path, 'E:/IVC_labs_starting_point/decoder');
TRAINING_image = double(imread('E:/IVC_labs_starting_point/data/images/lena_small.tif'));

[height width dimensions] = size(TRAINING_image);

tic

TRAINING_YCbCr_image = ictRGB2YCbCr(TRAINING_image);
N = 8; %split the image in non-overlapping N*N blocks
zero_run_code = [];

for k=1:N:height
    for j=1:N:width
        row_QUANTIZED_block = [];
        INPUT_block = TRAINING_YCbCr_image(k:k+N-1,j:j+N-1,:);
        TRANSFORMED_block = DCT8x8(INPUT_block);
        QUANTIZED_block  = Quant8x8 (TRANSFORMED_block);
        for i=1:dimensions
            %%concatenate in one row vector the row vectors resulting from
            %%the zig-zag scan of luma and the two chroma layers
            row_QUANTIZED_block = [row_QUANTIZED_block ZigZag8x8(QUANTIZED_block(:,:,i))];
        end
        zero_run_code = [zero_run_code , ZeroRunEnc_wo_EOB(row_QUANTIZED_block)];
    end
end

%%build the Huffman table based on the TRAINING_image
% H = hist(zero_run_code,min(zero_run_code):max(zero_run_code));
H = hist(zero_run_code,-255:255); %this interval should cover the whole range of values for the zero run code
                                  %don't forget to add the modulus of the
                                  %min value of the range to the
                                  %intra_enode and intra_decode functions;
                                  %in case EOB is implemented, make sure to
                                  %modify the max value accordingly to the
                                  %EOB code
H = H/sum(H);
[ BinaryTree, HuffCode, BinCode, Codelengths] = buildHuffman( H );

%%open the image we want to encode
ORIGINAL_image = double(imread('F:/IVC_labs_starting_point/data/images/lena.tif'));

%%convert it to YCbCr domain
ORIGINAL_YCbCr_image = ictRGB2YCbCr(ORIGINAL_image);

%%encode the YCbCr image with the Huffman table obtained for the training
%%image
[HUFFMAN_encoded_bitstream, nr_symbols_to_encode] = IntraEncode_wo_EOB(ORIGINAL_YCbCr_image, N, BinCode, Codelengths);

[height width dimensions] = size(ORIGINAL_image);

%%decode the YCbCr image from the Huffman encoded bitstream
DECODED_YCbCr_image = IntraDecode_wo_EOB (HUFFMAN_encoded_bitstream, BinaryTree, nr_symbols_to_encode, height, width, dimensions, N);

%%convert the decoded YCbCr image back to RGB
DECODED_image = ictYCbCr2RGB(DECODED_YCbCr_image);

toc

MSE = calcMSE (DECODED_image, ORIGINAL_image, height, width, dimensions);
PSNR = calcPSNR(MSE, DECODED_image);
Bitrate = length(HUFFMAN_encoded_bitstream)*8 / width / height;

figure
imshow(TRAINING_image/256);
title('TRAINING image');

figure
imshow(DECODED_image/256);
title('DECODED image');      


% decoded_stream = ZeroRunDec(zero_run_code);
% j=1;
% k=1;
% for l=1:N*N*dimensions:length(decoded_stream)
%     for i=1:dimensions
%         QUANTIZED_block_decoded(:,:,i) = DeZigZag8x8(decoded_stream(l+N*N*(i-1):l+N*N*i-1));
%     end
%     DECODED_TRANSFORM_block  = DeQuant8x8 (QUANTIZED_block_decoded);
%     DECODED_block = IDCT8x8(DECODED_TRANSFORM_block);
%     DECODED_YCbCr_image(j:j+N-1,k:k+N-1,:) = DECODED_block;
%     if k<width-N+1
%         k=k+8;
%     else
%         k=1;
%         j=j+8;
%     end
% end
% 
% DECODED_image = ictYCbCr2RGB(DECODED_YCbCr_image);
% 
% toc
% 
% MSE = calcMSE (DECODED_image, TRAINING_image, height, width, dimensions);
% PSNR = calcPSNR(MSE, DECODED_image);
% 
% figure
% imshow(TRAINING_image/256);
% title('TRAINING image');
% 
% figure
% imshow(DECODED_image/256);
% title('DECODED image');          
    




