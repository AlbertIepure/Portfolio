function DECODED_YCbCr_image = IntraDecode_wo_EOB (HUFFMAN_encoded_bitstream, BinaryTree, nr_symbols, height, width, dimensions, N)

zero_run_reconstructed = double(dec_huffman ( HUFFMAN_encoded_bitstream, BinaryTree, nr_symbols )) - 256;

decoded_stream = ZeroRunDec_wo_EOB(zero_run_reconstructed);
j=1;
k=1;
for l=1:N*N*dimensions:length(decoded_stream)
    for i=1:dimensions
        QUANTIZED_block_decoded(:,:,i) = DeZigZag8x8(decoded_stream(l+N*N*(i-1):l+N*N*i-1));
    end
    DECODED_TRANSFORM_block  = DeQuant8x8 (QUANTIZED_block_decoded);
    DECODED_block = IDCT8x8(DECODED_TRANSFORM_block);
    DECODED_YCbCr_image(j:j+N-1,k:k+N-1,:) = DECODED_block;
    if k<width-N+1
        k=k+8;
    else
        k=1;
        j=j+8;
    end
end
