function [HUFFMAN_encoded_bitstream_Y_DC,HUFFMAN_encoded_bitstream_Y_AC,HUFFMAN_encoded_bitstream_Cb_DC,HUFFMAN_encoded_bitstream_Cb_AC,HUFFMAN_encoded_bitstream_Cr_DC,HUFFMAN_encoded_bitstream_Cr_AC, nr_symbols_to_encode_Y_DC,nr_symbols_to_encode_Y_AC,nr_symbols_to_encode_Cb_DC,nr_symbols_to_encode_Cb_AC,nr_symbols_to_encode_Cr_DC,nr_symbols_to_encode_Cr_AC] = IntraEncode_chr_sub_AC_DC(ORIGINAL_YCbCr_image, N, M, BinCode_DC, BinCode_AC, Codelengths_DC, Codelengths_AC, lower_bound_DC, lower_bound_AC)

DOWNSAMPLED_TRAINING_YCbCr_image_1 = ORIGINAL_YCbCr_image(:,:,1);

% downsample the chroma layers
upsampling_factor = 1;
downsampling_factor = 2;

DOWNSAMPLED_TRAINING_YCbCr_image_r_2 = (resample(ORIGINAL_YCbCr_image(:,:,2),upsampling_factor,downsampling_factor));
DOWNSAMPLED_TRAINING_YCbCr_image_2 = (resample(DOWNSAMPLED_TRAINING_YCbCr_image_r_2.',upsampling_factor,downsampling_factor).');
DOWNSAMPLED_TRAINING_YCbCr_image_r_3 = (resample(ORIGINAL_YCbCr_image(:,:,3),upsampling_factor,downsampling_factor));
DOWNSAMPLED_TRAINING_YCbCr_image_3 = (resample(DOWNSAMPLED_TRAINING_YCbCr_image_r_3.',upsampling_factor,downsampling_factor).');


[height width dimensions] = size(ORIGINAL_YCbCr_image);
zero_run_code_Y = [];
DC_coefficients_Y = [];
zero_run_code_Cb = [];
DC_coefficients_Cb = [];
zero_run_code_Cr = [];
DC_coefficients_Cr = [];

% perform the zero run encoding for the Y component
for k=1:N:height
    for j=1:N:width
        row_QUANTIZED_block = [];
        INPUT_block = DOWNSAMPLED_TRAINING_YCbCr_image_1(k:k+N-1,j:j+N-1);
        TRANSFORMED_block = dct2(INPUT_block);
        QUANTIZED_block  = Quant8x8_one_layer(TRANSFORMED_block,M,1);
        DC_coefficients_Y = [DC_coefficients_Y,QUANTIZED_block(1)];
        zero_run_code_Y = [zero_run_code_Y , ZeroRunEnc(QUANTIZED_block(2:end))];
    end
end

DC_differential_Y = DC_coefficients_Y - [0,DC_coefficients_Y(1:end-1)];

% Encode only the differentail DC coefficients, namely from 4 onwards
nr_symbols_to_encode_Y_DC = max(size(DC_differential_Y(2:end)));

% The first 3 DC coefficients are sent as they are
HUFFMAN_encoded_bitstream_Y_DC = [DC_differential_Y(1);enc_huffman_new( DC_differential_Y(2:end) + abs(lower_bound_DC) + 1, BinCode_DC, Codelengths_DC)];

% Encode the AC coefficients
nr_symbols_to_encode_Y_AC = max(size(zero_run_code_Y));

HUFFMAN_encoded_bitstream_Y_AC = enc_huffman_new( zero_run_code_Y + abs(lower_bound_AC) + 1, BinCode_AC, Codelengths_AC);

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
            if i==2
                DC_coefficients_Cb = [DC_coefficients_Cb,QUANTIZED_block(1)];
                zero_run_code_Cb = [zero_run_code_Cb , ZeroRunEnc(QUANTIZED_block(2:end))];
            else
                DC_coefficients_Cr = [DC_coefficients_Cr,QUANTIZED_block(1)];
                zero_run_code_Cr = [zero_run_code_Cr , ZeroRunEnc(QUANTIZED_block(2:end))];
            end
        end
    end
    
    if i==2
        DC_differential_Cb = DC_coefficients_Cb - [0,DC_coefficients_Cb(1:end-1)];
        
        % Encode only the differentail DC coefficients, namely from 4 onwards
        nr_symbols_to_encode_Cb_DC = max(size(DC_differential_Cb(2:end)));
        
        % The first 3 DC coefficients are sent as they are
        HUFFMAN_encoded_bitstream_Cb_DC = [DC_differential_Cb(1);enc_huffman_new( DC_differential_Cb(2:end) + abs(lower_bound_DC) + 1, BinCode_DC, Codelengths_DC)];
        
        % Encode the AC coefficients
        nr_symbols_to_encode_Cb_AC = max(size(zero_run_code_Cb));
        
        HUFFMAN_encoded_bitstream_Cb_AC = enc_huffman_new( zero_run_code_Cb + abs(lower_bound_AC) + 1, BinCode_AC, Codelengths_AC);
        
    else
        DC_differential_Cr = DC_coefficients_Cr - [0,DC_coefficients_Cr(1:end-1)];
        
        % Encode only the differentail DC coefficients, namely from 4 onwards
        nr_symbols_to_encode_Cr_DC = max(size(DC_differential_Cr(2:end)));
        
        % The first 3 DC coefficients are sent as they are
        HUFFMAN_encoded_bitstream_Cr_DC = [DC_differential_Cr(1);enc_huffman_new( DC_differential_Cr(2:end) + abs(lower_bound_DC) + 1, BinCode_DC, Codelengths_DC)];
        
        % Encode the AC coefficients
        nr_symbols_to_encode_Cr_AC = max(size(zero_run_code_Cr));
        
        HUFFMAN_encoded_bitstream_Cr_AC = enc_huffman_new( zero_run_code_Cr + abs(lower_bound_AC) + 1, BinCode_AC, Codelengths_AC);
        
    end
end