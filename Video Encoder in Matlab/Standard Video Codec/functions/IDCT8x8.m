function INPUT_block = IDCT8x8(TRANSFORMED_block)

INPUT_block(:,:,1) = idct2(TRANSFORMED_block(:,:,1));
INPUT_block(:,:,2) = idct2(TRANSFORMED_block(:,:,2));
INPUT_block(:,:,3) = idct2(TRANSFORMED_block(:,:,3));

