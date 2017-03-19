function [newFinalArray] = preEncodeIntraProcess(stream, Q)
    sizes = size ( stream );
    finalArrayY = [ 0 ];
    finalArrayCb = [ 0 ];
    finalArrayCr = [ 0 ];
    for i = 1 :8: sizes(1)
        for j = 1 :8: sizes(2)
                block(:,:,1) = stream(i:i+7,j:j+7,1);
                block(:,:,2) = stream(i:i+7,j:j+7,2);
                block(:,:,3) = stream(i:i+7,j:j+7,3);
                dctBlock(:,:,1) = DCT8x8(block(:,:,1));
                dctBlock(:,:,2) = DCT8x8(block(:,:,2));
                dctBlock(:,:,3) = DCT8x8(block(:,:,3));
                quantBlock = Quant8x8(dctBlock,Q);
                zzBlock(:,:,1) = ZigZag8x8(quantBlock(:,:,1));
                zzBlock(:,:,2) = ZigZag8x8(quantBlock(:,:,2));
                zzBlock(:,:,3) = ZigZag8x8(quantBlock(:,:,3));
                zrBlockY = ZeroRunEnc(zzBlock(:,:,1));
                zrBlockCb = ZeroRunEnc(zzBlock(:,:,2));
                zrBlockCr = ZeroRunEnc(zzBlock(:,:,3));
                finalArrayY = [finalArrayY , zrBlockY];
                finalArrayCb = [finalArrayCb , zrBlockCb];
                finalArrayCr = [finalArrayCr , zrBlockCr];
        end
    end
    finalArrayY = finalArrayY(2:end);
    finalArrayCb = finalArrayCb(2:end);
    finalArrayCr = finalArrayCr(2:end);
    newFinalArray = [finalArrayY , finalArrayCb, finalArrayCr];
end