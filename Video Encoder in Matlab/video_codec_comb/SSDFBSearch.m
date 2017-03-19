function [motionMatrix,contor] = SSDFBSearch(block_size,mv_search_range,current_frame, reference_frame)
    dimensions = size(current_frame);
    motionMatrix = zeros (dimensions(1) / 8 ,dimensions(2) / 8,2);
    height = dimensions(1);
    width = dimensions(2);
    contor = 0;
    for y = 1 : block_size : height
        for x = 1 : block_size : width
            [motionVector,~,contor_] = SSDFullBlockSearch(y,x,block_size,mv_search_range,current_frame,reference_frame);
            contor = contor + contor_;
            motionMatrix(ceil(y/block_size),ceil(x/block_size),1) = motionVector(1);
            motionMatrix(ceil(y/block_size),ceil(x/block_size),2) = motionVector(2);
        end
    end
end