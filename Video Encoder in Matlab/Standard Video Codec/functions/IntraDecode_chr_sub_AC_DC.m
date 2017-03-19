function DECODED_YCbCr_image = IntraDecode_chr_sub_AC_DC (HUFFMAN_encoded_bitstream_Y_DC,HUFFMAN_encoded_bitstream_Y_AC,HUFFMAN_encoded_bitstream_Cb_DC,HUFFMAN_encoded_bitstream_Cb_AC,HUFFMAN_encoded_bitstream_Cr_DC,HUFFMAN_encoded_bitstream_Cr_AC, nr_symbols_to_encode_Y_DC,nr_symbols_to_encode_Y_AC,nr_symbols_to_encode_Cb_DC,nr_symbols_to_encode_Cb_AC,nr_symbols_to_encode_Cr_DC,nr_symbols_to_encode_Cr_AC, BinaryTree_DC, BinaryTree_AC, height, width, dimensions, N, M, lower_bound_DC, lower_bound_AC)

for i=1:3
    zero_run_reconstructed = [];
    if i==1
        zero_run_reconstructed = double(dec_huffman ( HUFFMAN_encoded_bitstream_Y, BinaryTree, nr_symbols_to_encode_Y )) - (abs(lower_bound)+1);
    elseif i==2
        zero_run_reconstructed = double(dec_huffman ( HUFFMAN_encoded_bitstream_Cb, BinaryTree, nr_symbols_to_encode_Cb )) - (abs(lower_bound)+1);
    else
        zero_run_reconstructed = double(dec_huffman ( HUFFMAN_encoded_bitstream_Cr, BinaryTree, nr_symbols_to_encode_Cr )) - (abs(lower_bound)+1);
    end
        
    decoded_stream = [];
    decoded_stream = ZeroRunDec(zero_run_reconstructed,N); %the luma macroblock is N*N
    
    j=1;
    k=1;
    for l=1:N*N:length(decoded_stream)
        QUANTIZED_block_decoded = DeZigZag8x8(decoded_stream(l:l+N*N-1));
        DECODED_TRANSFORM_block  = DeQuant8x8_one_layer (QUANTIZED_block_decoded,M,i);
        DECODED_block = idct2(DECODED_TRANSFORM_block);
        if i==1
            DECODED_Y(j:j+N-1,k:k+N-1) = DECODED_block;
        elseif i==2
            DECODED_Cb(j:j+N-1,k:k+N-1) = DECODED_block;
        else
            DECODED_Cr(j:j+N-1,k:k+N-1) = DECODED_block;
        end
        
        if i==1
            if k<width-N+1
                k=k+8;
            else
                k=1;
                j=j+8;
            end
        else
            if k<width/2-N+1
                k=k+8;
            else
                k=1;
                j=j+8;
            end
        end
            
    end
end

upsampling_factor = 2;
downsampling_factor = 1;

UPSAMPLED_image_1 = DECODED_Y;

UPSAMPLED_image_2_r = (resample(DECODED_Cb,upsampling_factor,downsampling_factor));
UPSAMPLED_image_2 = (resample(UPSAMPLED_image_2_r.',upsampling_factor,downsampling_factor).');
UPSAMPLED_image_3_r = (resample(DECODED_Cr,upsampling_factor,downsampling_factor));
UPSAMPLED_image_3 = (resample(UPSAMPLED_image_3_r.',upsampling_factor,downsampling_factor).');

DECODED_YCbCr_image(:,:,1) = UPSAMPLED_image_1;
DECODED_YCbCr_image(:,:,2) = UPSAMPLED_image_2;
DECODED_YCbCr_image(:,:,3) = UPSAMPLED_image_3;

