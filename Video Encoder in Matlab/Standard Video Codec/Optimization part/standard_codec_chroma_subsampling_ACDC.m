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

DOWNSAMPLED_TRAINING_YCbCr_image_1 = TRAINING_YCbCr_image(:,:,1);

% downsample the chroma layers
upsampling_factor = 1;
downsampling_factor = 2;

DOWNSAMPLED_TRAINING_YCbCr_image_r_2 = (resample(TRAINING_YCbCr_image(:,:,2),upsampling_factor,downsampling_factor));
DOWNSAMPLED_TRAINING_YCbCr_image_2 = (resample(DOWNSAMPLED_TRAINING_YCbCr_image_r_2.',upsampling_factor,downsampling_factor).');
DOWNSAMPLED_TRAINING_YCbCr_image_r_3 = (resample(TRAINING_YCbCr_image(:,:,3),upsampling_factor,downsampling_factor));
DOWNSAMPLED_TRAINING_YCbCr_image_3 = (resample(DOWNSAMPLED_TRAINING_YCbCr_image_r_3.',upsampling_factor,downsampling_factor).');

[height width dimensions] = size(TRAINING_image);
zero_run_code_Y = [];
DC_coefficients_Y = [];
zero_run_code_Cb = [];
DC_coefficients_Cb = [];
zero_run_code_Cr = [];
DC_coefficients_Cr = [];

M = 1;

% perform the zero run encoding for the Y component
for k=1:N:height
    for j=1:N:width
        row_QUANTIZED_block = [];
        INPUT_block = DOWNSAMPLED_TRAINING_YCbCr_image_1(k:k+N-1,j:j+N-1);
        TRANSFORMED_block = dct2(INPUT_block);
        QUANTIZED_block  = Quant8x8_one_layer(TRANSFORMED_block,M,1);
        row_QUANTIZED_block = ZigZag8x8(QUANTIZED_block);
        DC_coefficients_Y = [DC_coefficients_Y,row_QUANTIZED_block(1)];
        zero_run_code_Y = [zero_run_code_Y , ZeroRunEnc(row_QUANTIZED_block(2:end))];
    end
end

% perform the zero run encoding for the Cb and Cr components
for i=2:3
    for k=1:N:height/2
        for j=1:N:width/2
            row_QUANTIZED_block = [];
            if i==2
                INPUT_block = DOWNSAMPLED_TRAINING_YCbCr_image_2(k:k+N-1,j:j+N-1);
            else
                INPUT_block = DOWNSAMPLED_TRAINING_YCbCr_image_3(k:k+N-1,j:j+N-1);
            end
            TRANSFORMED_block = dct2(INPUT_block);
            QUANTIZED_block  = Quant8x8_one_layer(TRANSFORMED_block,M,i);
            row_QUANTIZED_block = ZigZag8x8(QUANTIZED_block);
            if i==2
                DC_coefficients_Cb = [DC_coefficients_Cb,row_QUANTIZED_block(1)];
                zero_run_code_Cb = [zero_run_code_Cb , ZeroRunEnc(row_QUANTIZED_block(2:end))];
            else
                DC_coefficients_Cr = [DC_coefficients_Cr,row_QUANTIZED_block(1)];
                zero_run_code_Cr = [zero_run_code_Cr , ZeroRunEnc(row_QUANTIZED_block(2:end))];
            end
        end
    end
end

DC_differential_Y = DC_coefficients_Y - [0,DC_coefficients_Y(1:end-1)];
DC_differential_Cb = DC_coefficients_Cb - [0,DC_coefficients_Cb(1:end-1)];
DC_differential_Cr = DC_coefficients_Cr - [0,DC_coefficients_Cr(1:end-1)];

DC_differential = [DC_differential_Y,DC_differential_Cb,DC_differential_Cr];
zero_run_code = [zero_run_code_Y,zero_run_code_Cb,zero_run_code_Cr];

%%build the Huffman table based on the TRAINING_image
% H = hist(zero_run_code,min(zero_run_code):max(zero_run_code));
lower_bound_DC_1 = -48;
upper_bound_DC_1 = 41;
H_DC_1 = hist(DC_differential(4:end), lower_bound_DC_1:upper_bound_DC_1); %this interval should cover the whole range of values for the zero run code
%don't forget to add the modulus of the
%min value of the range to the
%intra_enode and intra_decode functions;
%in case EOB is implemented, make sure to
%modify the max value accordingly to the
%EOB code
H_DC_1 = H_DC_1/sum(H_DC_1);
[ BinaryTree_DC_1, HuffCode_DC_1, BinCode_DC_1, Codelengths_DC_1] = buildHuffman( H_DC_1 );

%%build the Huffman table based on the TRAINING_image
% H = hist(zero_run_code,min(zero_run_code):max(zero_run_code));
lower_bound_AC_1 = -255;
H_AC_1 = hist(zero_run_code, lower_bound_AC_1:1000); %this interval should cover the whole range of values for the zero run code
%don't forget to add the modulus of the
%min value of the range to the
%intra_enode and intra_decode functions;
%in case EOB is implemented, make sure to
%modify the max value accordingly to the
%EOB code
H_AC_1 = H_AC_1/sum(H_AC_1);
[ BinaryTree_AC_1, HuffCode_AC_1, BinCode_AC_1, Codelengths_AC_1] = buildHuffman( H_AC_1 );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Encode the first frame
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ORIGINAL_image = video{1,1};

%%convert it to YCbCr domain
ORIGINAL_YCbCr_image = ictRGB2YCbCr(ORIGINAL_image);

%%encode the YCbCr image with the Huffman table obtained for the training
%%image
[HUFFMAN_encoded_bitstream_Y_DC,HUFFMAN_encoded_bitstream_Y_AC,HUFFMAN_encoded_bitstream_Cb_DC,HUFFMAN_encoded_bitstream_Cb_AC,HUFFMAN_encoded_bitstream_Cr_DC,HUFFMAN_encoded_bitstream_Cr_AC, nr_symbols_to_encode_Y_DC,nr_symbols_to_encode_Y_AC,nr_symbols_to_encode_Cb_DC,nr_symbols_to_encode_Cb_AC,nr_symbols_to_encode_Cr_DC,nr_symbols_to_encode_Cr_AC] = IntraEncode_chr_sub_AC_DC(ORIGINAL_YCbCr_image, N, M, BinCode_DC_1, BinCode_AC_1, Codelengths_DC_1, Codelengths_AC_1, lower_bound_DC_1, lower_bound_AC_1);

[height width dimensions] = size(ORIGINAL_image);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Decode the first frame
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%decode the YCbCr image from the Huffman encoded bitstream
DECODED_YCbCr_image = IntraDecode_chr_sub_AC_DC (HUFFMAN_encoded_bitstream_Y_DC,HUFFMAN_encoded_bitstream_Y_AC,HUFFMAN_encoded_bitstream_Cb_DC,HUFFMAN_encoded_bitstream_Cb_AC,HUFFMAN_encoded_bitstream_Cr_DC,HUFFMAN_encoded_bitstream_Cr_AC, nr_symbols_to_encode_Y_DC,nr_symbols_to_encode_Y_AC,nr_symbols_to_encode_Cb_DC,nr_symbols_to_encode_Cb_AC,nr_symbols_to_encode_Cr_DC,nr_symbols_to_encode_Cr_AC, BinaryTree_DC_1, BinaryTree_AC_1, height, width, dimensions, N, M, lower_bound_DC_1, lower_bound_AC_1);

%%convert the decoded YCbCr image back to RGB
DECODED_image = ictYCbCr2RGB(DECODED_YCbCr_image);

MSE(1) = calcMSE (DECODED_image, ORIGINAL_image, height, width, dimensions);
PSNR(1) = calcPSNR(MSE, DECODED_image);
Bitrate(1) = (length(HUFFMAN_encoded_bitstream_Y)+length(HUFFMAN_encoded_bitstream_Cb)+length(HUFFMAN_encoded_bitstream_Cr))*8 / width / height;

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
        
        for k=1:block_size:height
            for j=1:N:width
                row_QUANTIZED_block = [];
                INPUT_block = ERROR_frame(k:k+block_size-1,j:j+block_size-1,:);
                TRANSFORMED_block = DCT8x8(INPUT_block);
                QUANTIZED_block  = Quant8x8 (TRANSFORMED_block,M);
                for i=1:dimensions
                    row_QUANTIZED_block = ZigZag8x8(QUANTIZED_block(:,:,i));
                    zero_run_code = [zero_run_code , ZeroRunEnc(row_QUANTIZED_block)];
                end
            end
        end
        
        lower_bound_3 = -1023; % I take this values because for small values of M, after the DCT the
        % quantiation values are also small and the division
        % yields big numbers, so I have to make sure that I
        % cover all possivle ranges
        %%build the Huffman table based on the prediction_error
        H_3 = hist(zero_run_code, lower_bound_3:1000); %this interval should cover the whole range of values for the zero run code
        H_3 = H_3/sum(H_3);
        [ BinaryTree_3, HuffCode_3, BinCode_3, Codelengths_3] = buildHuffman( H_3 );
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% Decode the frame
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    [HUFFMAN_encoded_bitstream_Y_3,HUFFMAN_encoded_bitstream_Cb_3,HUFFMAN_encoded_bitstream_Cr_3,nr_symbols_to_encode_Y_3,nr_symbols_to_encode_Cb_3,nr_symbols_to_encode_Cr_3] = IntraEncode_chr_sub(ERROR_frame, N, M, BinCode_3, Codelengths_3, lower_bound_3);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% Decode the ERROR_frame and the motion vector
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    DECODED_ERROR_image = IntraDecode_chr_sub (HUFFMAN_encoded_bitstream_Y_3,HUFFMAN_encoded_bitstream_Cb_3,HUFFMAN_encoded_bitstream_Cr_3,nr_symbols_to_encode_Y_3,nr_symbols_to_encode_Cb_3,nr_symbols_to_encode_Cr_3, BinaryTree_3, height, width, dimensions, N, M, lower_bound_3);
    
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
    Bitrate(f) = (length(HUFFMAN_encoded_bitstream_2)+length(HUFFMAN_encoded_bitstream_Y_3)+length(HUFFMAN_encoded_bitstream_Cb_3)+length(HUFFMAN_encoded_bitstream_Cr_3))*8 / width / height;
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
    
