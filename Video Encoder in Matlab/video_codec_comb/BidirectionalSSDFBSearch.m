function [motionVector,contor] = BidirectionalSSDFBSearch(mbDim,mvSearchRange,referenceFrame02,currentFrame,referenceFrame00,isMVFEnabled)
    sizes = size(currentFrame);
    motionVector = zeros ((sizes(1)/8)*(sizes(2)/8),3);
    dimensions = size(currentFrame);
    height = dimensions(1);
    width = dimensions(2);
    start_search = cputime;
    if isMVFEnabled
        [motionVector0,SSD0,contor0] = MVFAST(currentFrame, referenceFrame00, mbDim, mvSearchRange);
        [motionVector2,SSD2,contor1] = MVFAST(currentFrame, referenceFrame02, mbDim, mvSearchRange);
    else
        [motionVector0,SSD0, contor0] = fullblocksearch(currentFrame, referenceFrame00, mbDim, mvSearchRange, height, width);
        [motionVector2,SSD2, contor1] = fullblocksearch(currentFrame, referenceFrame02, mbDim, mvSearchRange, height, width);
    end
    for i = 1: length(motionVector)
        if SSD0(i) < SSD2(i)
            motionVector(i,1:2) = motionVector0(i,1:2);
            motionVector(i,3) = 0;
        else
            motionVector(i,1:2) = motionVector2(i,1:2);
            motionVector(i,3) = 1;
        end
    end
    end_search = cputime - start_search;
    contor = contor0 + contor1;
    fprintf('Block search lasted: %fs.\n',end_search);
    fprintf('Computations performed: %d.\n',contor);
end