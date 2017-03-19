function [HUFFMAN_encoded_bitstream_Y,HUFFMAN_encoded_bitstream_Cb,HUFFMAN_encoded_bitstream_Cr, nr_symbols_to_encode_Y,nr_symbols_to_encode_Cb,nr_symbols_to_encode_Cr] = intraencodechromasubsampling(ORIGINAL_YCbCr_image, N, M, BinCode, Codelengths, lower_bound)

DOWNSAMPLED_TRAINING_YCbCr_image_1 = ORIGINAL_YCbCr_image(:,:,1);

% downsample the chroma layers
upsampling_factor = 1;
downsampling_factor = 2;

DOWNSAMPLED_TRAINING_YCbCr_image_r_2 = (resample(ORIGINAL_YCbCr_image(:,:,2),upsampling_factor,downsampling_factor));
DOWNSAMPLED_TRAINING_YCbCr_image_2 = (resample(DOWNSAMPLED_TRAINING_YCbCr_image_r_2.',upsampling_factor,downsampling_factor).');
DOWNSAMPLED_TRAINING_YCbCr_image_r_3 = (resample(ORIGINAL_YCbCr_image(:,:,3),upsampling_factor,downsampling_factor));
DOWNSAMPLED_TRAINING_YCbCr_image_3 = (resample(DOWNSAMPLED_TRAINING_YCbCr_image_r_3.',upsampling_factor,downsampling_factor).');


[height width dimensions] = size(ORIGINAL_YCbCr_image);
zero_run_code = [];

% perform the zero run encoding for the Y component
for k=1:N:height
    for j=1:N:width
        row_QUANTIZED_block = [];
        INPUT_block = DOWNSAMPLED_TRAINING_YCbCr_image_1(k:k+N-1,j:j+N-1);
        TRANSFORMED_block = dct2(INPUT_block);
        QUANTIZED_block  = Quant8x8_one_layer(TRANSFORMED_block,M,1);
        row_QUANTIZED_block = ZigZag8x8(QUANTIZED_block);
        zero_run_code = [zero_run_code , ZeroRunEnc(row_QUANTIZED_block)];
    end
end

nr_symbols_to_encode_Y = max(size(zero_run_code));

HUFFMAN_encoded_bitstream_Y = enc_huffman_new( zero_run_code + abs(lower_bound) + 1, BinCode, Codelengths);

% perform the zero run encoding for the Cb and Cr components
for i=2:3
    zero_run_code = [];
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
            zero_run_code = [zero_run_code , ZeroRunEnc(row_QUANTIZED_block)];
        end
    end
    if i==2
        nr_symbols_to_encode_Cb = max(size(zero_run_code));
        HUFFMAN_encoded_bitstream_Cb = enc_huffman_new( zero_run_code + abs(lower_bound) + 1, BinCode, Codelengths);
    else
        nr_symbols_to_encode_Cr = max(size(zero_run_code));
        HUFFMAN_encoded_bitstream_Cr = enc_huffman_new( zero_run_code + abs(lower_bound) + 1, BinCode, Codelengths);
    end
end