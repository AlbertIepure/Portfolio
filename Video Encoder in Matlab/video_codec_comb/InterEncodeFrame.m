function [frame_prediction, motion_vector,contor] = InterEncodeFrame(mbDim,mvSearchRange,currentFrame,referenceFrame,isMVFEnabled,isHPEnabled)
dimensions = size(currentFrame);
height = dimensions(1);
width = dimensions(2);
start_search = cputime;
if isMVFEnabled
    [motion_vector,~,contor] = MVFAST(currentFrame, referenceFrame, mbDim, mvSearchRange);
else
    [motion_vector,~,contor] = fullblocksearch(currentFrame, referenceFrame, mbDim, mvSearchRange, height, width);
end
if isHPEnabled
    [motion_vector,contor] = estimatehpmotion(currentFrame,0,referenceFrame,motion_vector,mbDim,mvSearchRange,false);
end
end_search = cputime - start_search;
fprintf('Block search lasted: %fs.\n',end_search);
fprintf('Computations performed: %d.\n',contor);
frame_prediction = MotionCompensation(referenceFrame, motion_vector, mbDim,isHPEnabled);
end