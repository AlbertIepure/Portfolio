function [motionVector, SSD,contor] = SSDFullBlockSearch(y,x,block_size,mv_search_range,current_frame,reference_frame)
    contor = 0;
    sizes = size(current_frame);
    height = sizes(1);
    width = sizes(2);
    SSD = 999999999999;
    motionVector = [ 0 0 ];
    current_block = current_frame(y:y+block_size-1,x:x+block_size-1,1);
    for column = -mv_search_range : 1 : mv_search_range
        for row = -mv_search_range: 1 : mv_search_range
            if (y+row>0) && (y+row+block_size-1<=height) && (x+column>0) && (x+column+block_size-1<=width)
                previous_block = reference_frame(y+row:y+row+block_size-1,x+column:x+column+block_size-1);
                SSDtemp = sum(sum((current_block-previous_block).^2));
                contor = contor + 1;
                if(SSDtemp < SSD)
                    SSD = SSDtemp;
                    motionVector = [ row column ];
                end
            end
        end
    end
end