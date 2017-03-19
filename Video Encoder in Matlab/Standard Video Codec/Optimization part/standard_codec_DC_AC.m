clear all
close all
clc

path (path, 'D:/IVC_labs_starting_point/functions');
path (path, 'D:/IVC_labs_starting_point/analysis');
path (path, 'D:/IVC_labs_starting_point/encoder');
path (path, 'D:/IVC_labs_starting_point/decoder');
TRAINING_image = double(imread('D:/IVC_labs_starting_point/data/images/lena_small.tif'));

for i=20:40
    path = ['D:/IVC_labs_starting_point/data/sequences/foreman20_40_RGB/foreman00', num2str(i),'.bmp'];
    video{i+1-20} = double(imread(path));
end

TRAINING_YCbCr_image = ictRGB2YCbCr(TRAINING_image);
N = 8; %split the image in non-overlapping N*N blocks

    
[height width dimensions] = size(TRAINING_image);
zero_run_code = [];
M = 1;

for k=1:N:height
    for j=1:N:width
        row_QUANTIZED_block = [];
        INPUT_block = TRAINING_YCbCr_image(k:k+N-1,j:j+N-1,:);
        TRANSFORMED_block = DCT8x8(INPUT_block);
        QUANTIZED_block  = Quant8x8 (TRANSFORMED_block,M);
        for i=1:dimensions
            row_QUANTIZED_block = ZigZag8x8(QUANTIZED_block(:,:,i));
            zero_run_code = [zero_run_code , ZeroRunEnc(row_QUANTIZED_block)];
        end
    end
end

%%build the Huffman table based on the TRAINING_image
% H = hist(zero_run_code,min(zero_run_code):max(zero_run_code));
lower_bound_1 = -255;
H_1 = hist(zero_run_code, lower_bound_1:1000); %this interval should cover the whole range of values for the zero run code
%don't forget to add the modulus of the
%min value of the range to the
%intra_enode and intra_decode functions;
%in case EOB is implemented, make sure to
%modify the max value accordingly to the
%EOB code
H_1 = H_1/sum(H_1);
[ BinaryTree_1, HuffCode_1, BinCode_1, Codelengths_1] = buildHuffman( H_1 );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Encode the first frame
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ORIGINAL_image = video{1,1};

%%convert it to YCbCr domain
ORIGINAL_YCbCr_image = ictRGB2YCbCr(ORIGINAL_image);

%%encode the YCbCr image with the Huffman table obtained for the training
%%image
[HUFFMAN_encoded_bitstream_1, nr_symbols_to_encode_1] = IntraEncode(ORIGINAL_YCbCr_image, N, M, BinCode_1, Codelengths_1, lower_bound_1);

[height width dimensions] = size(ORIGINAL_image);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Decode the first frame
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%decode the YCbCr image from the Huffman encoded bitstream
DECODED_YCbCr_image = IntraDecode (HUFFMAN_encoded_bitstream_1, BinaryTree_1, nr_symbols_to_encode_1, height, width, dimensions, N, M, lower_bound_1);

%%convert the decoded YCbCr image back to RGB
DECODED_image = ictYCbCr2RGB(DECODED_YCbCr_image);

MSE(1) = calcMSE (DECODED_image, ORIGINAL_image, height, width, dimensions);
PSNR(1) = calcPSNR(MSE, DECODED_image);
Bitrate(1) = length(HUFFMAN_encoded_bitstream_1)*8 / width / height;

[height width dimensions] = size(ORIGINAL_image);

for f = 2:21
    block_size = 8;
    search_range = 4;
    
%     mv_mat = [];
    contor = 0;
    
    inter_ycbcr_video{f} = ictRGB2YCbCr(video{1,f});
    
    current_frame = inter_ycbcr_video{f};
    reference_frame = DECODED_YCbCr_image;
    
    tic
    [mv_mat,c] = full_search(current_frame, reference_frame, block_size, search_range, height, width);
    contor = contor + c;
    t(f-1) = toc;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Generate the motion vector coding table based on the motion vectors
    %% obtained between frame 1 and 2 and reuse this table for the other
    %% frames
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    [rows columns] = size(mv_mat);
    %% convert the mv_mat into a row vector to prepare for Huffman code generation
    mv_row = [];
    for i=1:rows
        mv_row = [mv_row,mv_mat(i,:)];
    end
    
    if f==2
        H_2 = hist(mv_row,-search_range:search_range);
        H_2 = H_2/sum(H_2);
        [ BinaryTree_2, HuffCode_2, BinCode_2, Codelengths_2] = buildHuffman( H_2 );
    end
    
    %% Encode the motion vectors using the previously determined coding table
    HUFFMAN_encoded_bitstream_2 = enc_huffman_new( mv_row + search_range + 1 , BinCode_2, Codelengths_2);
    
    block_nb = 1;
    current_predicted_frame = current_frame * 0;
    
    %% reconstruct the predicted current frame in the following way: for the current block in the current predicted frame
    %% look at the corresponding block in the past frame, which is displaced according to the corresponding entry in the
    %% mv_mat. This shifted block from the previous frame is copied into the current block
    for i=1:block_size:height
        for j=1:block_size:width
            x = mv_mat(block_nb,1);
            y = mv_mat(block_nb,2);
            current_predicted_frame(i:i+block_size-1,j:j+block_size-1,:) = reference_frame(i+y:i+y+block_size-1,j+x:j+x+block_size-1,:);
            block_nb = block_nb + 1;
        end
    end
    
    ERROR_frame = current_frame - current_predicted_frame;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Generate the motion vector coding table based on the ERROR_frame
    %% obtained between frame 1 and 2 and reuse this table for the other
    %% frames
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if f==2
        zero_run_code = [];
        DC_coefficients = [];
        
        for k=1:block_size:height
            for j=1:N:width
                row_QUANTIZED_block = [];
                INPUT_block = ERROR_frame(k:k+block_size-1,j:j+block_size-1,:);
                TRANSFORMED_block = DCT8x8(INPUT_block);
                QUANTIZED_block  = Quant8x8 (TRANSFORMED_block,M);
                for i=1:dimensions
                    row_QUANTIZED_block = ZigZag8x8(QUANTIZED_block(:,:,i));
                    DC_coefficients = [DC_coefficients,row_QUANTIZED_block(1)];
                    zero_run_code = [zero_run_code , ZeroRunEnc(row_QUANTIZED_block(2:end))];
                end
            end
        end
        
%         DC_coefficients_2 = [0 0 0,DC_coefficients_1(1:end-3)];
%         DC_differential = DC_coefficients_1 - DC_coefficients_2;
        lower_bound_3 = -1023; % I take this values because for small values of M, after the DCT the
        % quantiation values are also small and the division
        % yields big numbers, so I have to make sure that I
        % cover all possivle ranges
        %%build the Huffman table based on the prediction_error
        H_3 = hist(zero_run_code, lower_bound_3:1000); %this interval should cover the whole range of values for the zero run code
        H_3 = H_3/sum(H_3);
        [ BinaryTree_3, HuffCode_3, BinCode_3, Codelengths_3] = buildHuffman( H_3 );
        
        lower_bound_4 = -16;
        H_4 = hist(DC_coefficients, lower_bound_4:16); %this interval should cover the whole range of values for the zero run code
        H_4 = H_4/sum(H_4);
        [ BinaryTree_4, HuffCode_4, BinCode_4, Codelengths_4] = buildHuffman( H_4 );
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% Decode the frame
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    [HUFFMAN_encoded_bitstream_DC_3,HUFFMAN_encoded_bitstream_AC_3, nr_symbols_to_encode_DC_3, nr_symbols_to_encode_AC_3] = IntraEncode_DC_AC(ERROR_frame, N, M, BinCode_4, BinCode_3, Codelengths_4, Codelengths_3, lower_bound_4, lower_bound_3);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% Decode the ERROR_frame and the motion vector
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    DECODED_ERROR_image = IntraDecode_DC_AC (HUFFMAN_encoded_bitstream_DC_3,HUFFMAN_encoded_bitstream_AC_3, BinaryTree_4, BinaryTree_3, nr_symbols_to_encode_DC_3, nr_symbols_to_encode_AC_3, height, width, dimensions, N, M, lower_bound_4, lower_bound_3);
    
    %     DECODED_mv =  double(reshape(dec_huffman ( HUFFMAN_encoded_bitstream_2, BinaryTree_2, max(size(mv_row(:)))), size(mv_mat))) - search_range - 1;
    DECODED_mv =  double(vec2mat(dec_huffman ( HUFFMAN_encoded_bitstream_2, BinaryTree_2, max(size(mv_row(:)))), size(mv_mat,2))) - search_range - 1;
    
    block_nb = 1;
    current_predicted_frame = reference_frame * 0;
    
    %% reconstruct the predicted current frame in the following way: for the current block in the current predicted frame
    %% look at the corresponding block in the past frame, which is displaced according to the corresponding entry in the
    %% mv_mat. This shifted block from the previous frame is copied into the current block
    for i=1:block_size:height
        for j=1:block_size:width
            x = DECODED_mv(block_nb,1);
            y = DECODED_mv(block_nb,2);
            current_predicted_frame(i:i+block_size-1,j:j+block_size-1,:) = reference_frame(i+y:i+y+block_size-1,j+x:j+x+block_size-1,:);
            block_nb = block_nb + 1;
        end
    end
    
    DECODED_YCbCr_image = current_predicted_frame + DECODED_ERROR_image;
    
    %%convert the decoded YCbCr image back to RGB
    RECONSTRUCTED_frame = ictYCbCr2RGB(DECODED_YCbCr_image);
    
    %%convert the decoded YCbCr image back to RGB
    CURRENT_frame = ictYCbCr2RGB(current_frame);
    
    MSE(f) = calcMSE (RECONSTRUCTED_frame, CURRENT_frame, height, width, dimensions);
    PSNR(f) = calcPSNR(MSE(f), RECONSTRUCTED_frame);
    Bitrate(f) = (length(HUFFMAN_encoded_bitstream_2)+length(HUFFMAN_encoded_bitstream_DC_3)+length(HUFFMAN_encoded_bitstream_AC_3))*8 / width / height;
end

Final_Bitrate=mean(Bitrate);
Final_PSNR = mean(PSNR);
        

figure
plot(Final_Bitrate, Final_PSNR);
title('Performance of the image and video compression scheme implemented during the IVC Lab');
xlabel('Mean Rate [bpp]') % x-axis label
ylabel('Mean PSNR [dB]') % y-axis label
    
figure
plot(t);
t_avg = trimmean(t,25);    
    
