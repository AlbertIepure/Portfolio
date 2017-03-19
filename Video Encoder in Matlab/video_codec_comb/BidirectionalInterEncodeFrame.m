function [predictedFrame, motionMatrix,contor] = BidirectionalInterEncodeFrame(mbDim,mvSearchRange,referenceFrame02,currentFrame,referenceFrame00,isMVFEnabled,isHPEnabled)
[motionMatrix,contor] = BidirectionalSSDFBSearch(mbDim,mvSearchRange,referenceFrame02(:,:,1),currentFrame(:,:,1),referenceFrame00(:,:,1),isMVFEnabled);
if isHPEnabled
    motionMatrix = estimatehpmotion(currentFrame, referenceFrame02,referenceFrame00, motionMatrix, mbDim, mvSearchRange,true);
end
predictedFrame = compensatemotionbidirectionally(referenceFrame02,referenceFrame00, motionMatrix, mbDim,isHPEnabled);