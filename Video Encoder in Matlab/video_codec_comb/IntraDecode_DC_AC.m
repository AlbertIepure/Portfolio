function DECODED_YCbCr_image = IntraDecode_DC_AC (HUFFMAN_encoded_bitstream_DC, HUFFMAN_encoded_bitstream_AC, BinaryTree_DC, BinaryTree_AC, nr_symbols_DC, nr_symbols_AC, height, width, dimensions, N, M, lower_bound_DC, lower_bound_AC)

% Reconstruct the received AC coefficients
zero_run_reconstructed_AC = double(dec_huffman ( HUFFMAN_encoded_bitstream_AC, BinaryTree_AC, nr_symbols_AC )) - (abs(lower_bound_AC)+1);

% Reconstruct the received differential DC coefficients. The first 3 DC coefficients are
% just copied from the stream, the rest are decoded
% reconstructed_differential_DC = [HUFFMAN_encoded_bitstream_DC(1:3).',double(dec_huffman ( HUFFMAN_encoded_bitstream_DC(4:end), BinaryTree_DC, nr_symbols_DC )) - (abs(lower_bound_DC)+1)];
DC_differential = double(dec_huffman ( HUFFMAN_encoded_bitstream_DC(3*height/N+1:end), BinaryTree_DC, nr_symbols_DC )) - (abs(lower_bound_DC)+1);
DC_unencoded = HUFFMAN_encoded_bitstream_DC(1:3*height/N).';

% %Reconstruct the DC coefficients
% reconstructed_DC = zeros(1,length(reconstructed_differential_DC));
% reconstructed_DC = reconstructed_differential_DC(1:3);%copy the first 3 from the decoded bitstream
% 
% % Afterwards, for each block of 3 coefficients, add it to the block of 3
% % coefficients to the left, until the end of the stream is reached
% for i=4:3:length(reconstructed_differential_DC)
%     reconstructed_DC(i:i+2) = reconstructed_DC(i-3:i-1) + reconstructed_differential_DC(i:i+2);
% end
index = 1;
reconstructed_DC =zeros(1,(width/N)*(height/N)*3);
for i=1:3*width/N-3:length(DC_differential)
    reconstructed_differential_DC = [DC_unencoded(3*(index-1)+1:3*(index-1)+3),DC_differential(i:i+3*width/N-3-1)];
    reconstructed_DC ((3*width/N)*(index-1)+1:(3*width/N)*(index-1)+3) = reconstructed_differential_DC(1:3);
    for i=4:3:length(reconstructed_differential_DC)
        reconstructed_DC((3*width/N)*(index-1)+i:(3*width/N)*(index-1)+i+2) = reconstructed_DC((3*width/N)*(index-1)+i-3:(3*width/N)*(index-1)+i-1) + reconstructed_differential_DC(i:i+2);
    end
    index=index+1;
end
    
% Decode the AC coefficients
decoded_stream_AC = ZeroRunDec_DC_AC(zero_run_reconstructed_AC,N);
j=1;
k=1;
index = 1;

% If N=8, there are 8*8-1 = 63 AC coefficients for each macroblock. Add the
% corresponding DC coefficient for the macroblock at the very beginning and
% reconstruct each macroblock
for l=1:(N*N-1)*dimensions:length(decoded_stream_AC)
    for i=1:dimensions
        QUANTIZED_block_decoded(:,:,i) = aDeZigZag8x8([reconstructed_DC(index),decoded_stream_AC(l+(N*N-1)*(i-1):l+(N*N-1)*i-1)]);
        index = index + 1;
    end
    DECODED_TRANSFORM_block  = DeQuant8x8 (QUANTIZED_block_decoded,M);
    DECODED_block(:,:,1) = IDCT8x8(DECODED_TRANSFORM_block(:,:,1));
    DECODED_block(:,:,2) = IDCT8x8(DECODED_TRANSFORM_block(:,:,2));
    DECODED_block(:,:,3) = IDCT8x8(DECODED_TRANSFORM_block(:,:,3));
    DECODED_YCbCr_image(j:j+N-1,k:k+N-1,:) = DECODED_block;
    if k<width-N+1
        k=k+8;
    else
        k=1;
        j=j+8;
    end
end
