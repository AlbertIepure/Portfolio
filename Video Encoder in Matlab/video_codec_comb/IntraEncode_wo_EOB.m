function [HUFFMAN_encoded_bitstream, nr_symbols_to_encode] = IntraEncode(ORIGINAL_YCbCr_image, N, BinCode, Codelengths)

[height width dimensions] = size(ORIGINAL_YCbCr_image);
zero_run_code = [];

for k=1:N:height
    for j=1:N:width
        row_QUANTIZED_block = [];
        INPUT_block = ORIGINAL_YCbCr_image(k:k+N-1,j:j+N-1,:);
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

nr_symbols_to_encode = max(size(zero_run_code));

HUFFMAN_encoded_bitstream = enc_huffman_new( zero_run_code + 256, BinCode, Codelengths);