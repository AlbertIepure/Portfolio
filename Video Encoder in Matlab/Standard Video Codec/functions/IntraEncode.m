function [HUFFMAN_encoded_bitstream, nr_symbols_to_encode] = IntraEncode(ORIGINAL_YCbCr_image, N, M, BinCode, Codelengths, lower_bound)

[height width dimensions] = size(ORIGINAL_YCbCr_image);
zero_run_code = [];

for k=1:N:height
    for j=1:N:width
        row_QUANTIZED_block = [];
        INPUT_block = ORIGINAL_YCbCr_image(k:k+N-1,j:j+N-1,:);
        TRANSFORMED_block = DCT8x8(INPUT_block);
        QUANTIZED_block  = Quant8x8 (TRANSFORMED_block,M);
        for i=1:dimensions
            row_QUANTIZED_block = ZigZag8x8(QUANTIZED_block(:,:,i));
            zero_run_code = [zero_run_code , ZeroRunEnc(row_QUANTIZED_block)];
        end
    end
end

nr_symbols_to_encode = max(size(zero_run_code));

HUFFMAN_encoded_bitstream = enc_huffman_new( zero_run_code + abs(lower_bound) + 1, BinCode, Codelengths);