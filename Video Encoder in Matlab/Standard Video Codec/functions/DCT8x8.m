function TRANSFORMED_block = DCT8x8(INPUT_block)

TRANSFORMED_block(:,:,1) = dct2(INPUT_block(:,:,1));
TRANSFORMED_block(:,:,2) = dct2(INPUT_block(:,:,2));
TRANSFORMED_block(:,:,3) = dct2(INPUT_block(:,:,3));

% inter = dct(dct(INPUT_block)')';
% 
% diff = inter - TRANSFORMED_block;