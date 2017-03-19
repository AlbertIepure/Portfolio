function [zeroRunCodedBlock,DCDifferential] = preencodeintraprocessacdcencoding(ycbcrFrame, mbDim, Q)
[height,width,channels] = size(ycbcrFrame);
zeroRunCodedBlock = [];
DC_coefficients_1 = [];
for k=1:mbDim:height
    for j=1:mbDim:width
        row_QUANTIZED_block = [];
        INPUT_block = ycbcrFrame(k:k+mbDim-1,j:j+mbDim-1,:);
        TRANSFORMED_block(:,:,1) = DCT8x8(INPUT_block(:,:,1));
        TRANSFORMED_block(:,:,2) = DCT8x8(INPUT_block(:,:,2));
        TRANSFORMED_block(:,:,3) = DCT8x8(INPUT_block(:,:,3));
        QUANTIZED_block  = Quant8x8 (TRANSFORMED_block,Q);
        for i=1:channels
            row_QUANTIZED_block = aZigZag8x8(QUANTIZED_block(:,:,i));
            DC_coefficients_1 = [DC_coefficients_1,row_QUANTIZED_block(1)];
            zeroRunCodedBlock = [zeroRunCodedBlock , aZeroRunEnc(row_QUANTIZED_block(2:end))];
        end
    end
end

DCUnencoded = [];
DCDifferential = [];

for i=1:3*width/mbDim:length(DC_coefficients_1)
    DCCoefficients_2 = [DC_coefficients_1(i:i + 3*width/mbDim - 1) - [0 0 0,DC_coefficients_1(i:i + 3*width/mbDim - 1 -3)]];
    DCUnencoded = [DCUnencoded, DCCoefficients_2(1:3)];
    DCDifferential = [DCDifferential, DCCoefficients_2(4:end)];
end
end