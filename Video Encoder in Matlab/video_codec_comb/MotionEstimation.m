function [motionMatrix] = MotionEstimation(block_size,mv_search_range,current_frame, reference_frame)
    sizes = size(current_frame);
    motionMatrix = zeros (sizes(1) / 8 ,sizes(2) / 8,2);
    sizes = size(current_frame);
    for i = 1 : block_size : sizes(1)
        for j = 1 : block_size : sizes(2)
            [motionVector,~] = SSDFullBlockSearch(i,j,block_size,mv_search_range,current_frame,reference_frame);
            motionMatrix(ceil(i/block_size),ceil(j/block_size),1) = motionVector(1);
            motionMatrix(ceil(i/block_size),ceil(j/block_size),2) = motionVector(2);
        end
    end
end