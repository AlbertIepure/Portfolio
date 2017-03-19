function [HUFFMAN_encoded_bitstream_DC,HUFFMAN_encoded_bitstream_AC, nr_symbols_to_encode_DC, nr_symbols_to_encode_AC ] = IntraEncode_DC_AC(ORIGINAL_YCbCr_image, N, M, BinCode_DC, BinCode_AC , Codelengths_DC, Codelengths_AC,  lower_bound_DC, lower_bound_AC)

[height width dimensions] = size(ORIGINAL_YCbCr_image);
zero_run_code = [];
DC_coefficients = [];

for k=1:N:height
    for j=1:N:width
        row_QUANTIZED_block = [];
        INPUT_block = ORIGINAL_YCbCr_image(k:k+N-1,j:j+N-1,:);
        TRANSFORMED_block = DCT8x8(INPUT_block);
        QUANTIZED_block  = Quant8x8 (TRANSFORMED_block,M);
        for i=1:dimensions
            row_QUANTIZED_block = ZigZag8x8(QUANTIZED_block(:,:,i));
            DC_coefficients = [DC_coefficients,row_QUANTIZED_block(1)]; % the DC coefficients for all the blocks in the image in the order Y,Cb,Cr
            zero_run_code = [zero_run_code , ZeroRunEnc(row_QUANTIZED_block(2:end))]; %the AC coefficients are zero-run encoded
        end
    end
end

% compute the differential DC coeffciients: the first three, which
% correspond to the DC coefficients of the first macroblock with all its
% corresponding three layers are sent as they are, all the others
% afterwards are substracted from their corresponding neighbors to the left

DC_coefficients_2 = [0 0 0,DC_coefficients(1:end-3)];
DC_differential = DC_coefficients - DC_coefficients_2;

% needed for the lower and upper bound of the Huffman table
% lower_bound_1 = min(DC_differential(4:end));
% upper_bound_1 = max(DC_differential(4:end));

% Encode only the differentail DC coefficients, namely from 4 onwards
nr_symbols_to_encode_DC = max(size(DC_differential(4:end)));

% The first 3 DC coefficients are sent as they are
HUFFMAN_encoded_bitstream_DC = [DC_differential(1:3).';enc_huffman_new( DC_differential(4:end) + abs(lower_bound_DC) + 1, BinCode_DC, Codelengths_DC)];

% Encode the AC coefficients
nr_symbols_to_encode_AC = max(size(zero_run_code));

HUFFMAN_encoded_bitstream_AC = enc_huffman_new( zero_run_code + abs(lower_bound_AC) + 1, BinCode_AC, Codelengths_AC);