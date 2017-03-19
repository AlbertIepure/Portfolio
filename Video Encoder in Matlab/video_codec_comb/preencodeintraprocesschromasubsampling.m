function [zeroRunCodedBlock] = preencodeintraprocesschromasubsampling(ycbcrFrame, mbDim, Q)

YFrame = ycbcrFrame(:,:,1);

% downsample the chroma layers
upsampling_factor = 1;
downsampling_factor = 2;

downsampledCbFrame = (resample(ycbcrFrame(:,:,2),upsampling_factor,downsampling_factor));
downsampledCbFrame_ = (resample(downsampledCbFrame.',upsampling_factor,downsampling_factor).');
downsampledCrFrame = (resample(ycbcrFrame(:,:,3),upsampling_factor,downsampling_factor));
downsampledCrFrame_ = (resample(downsampledCrFrame.',upsampling_factor,downsampling_factor).');


[height width dimensions] = size(ycbcrFrame);
zeroRunCodedBlock = [];

% perform the zero run encoding for the Y component
for k=1:mbDim:height
    for j=1:mbDim:width
        rowQuantizedBlock = [];
        inputBlock = YFrame(k:k+mbDim-1,j:j+mbDim-1);
        transformedBlock = dct2(inputBlock);
        quantizedBlock  = Quant8x8_one_layer(transformedBlock,Q,1);
        rowQuantizedBlock = ZigZag8x8(quantizedBlock);
        zeroRunCodedBlock = [zeroRunCodedBlock , ZeroRunEnc(rowQuantizedBlock)];
    end
end

% perform the zero run encoding for the Cb and Cr components
for i=2:3
    zeroRunCodedBlock = [];
    for k=1:mbDim:height/2
        for j=1:mbDim:width/2
            rowQuantizedBlock = [];
            if i==2
                inputBlock = downsampledCbFrame_(k:k+mbDim-1,j:j+mbDim-1);
            else
                inputBlock = downsampledCrFrame_(k:k+mbDim-1,j:j+mbDim-1);
            end
            transformedBlock = dct2(inputBlock);
            quantizedBlock  = Quant8x8_one_layer(transformedBlock,Q,i);
            rowQuantizedBlock = ZigZag8x8(quantizedBlock);
            zeroRunCodedBlock = [zeroRunCodedBlock , ZeroRunEnc(rowQuantizedBlock)];
        end
    end
end