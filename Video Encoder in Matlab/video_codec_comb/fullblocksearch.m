function  [mv_mat,SSD,contor] = fullblocksearch(currentFrame, referenceFrame, mbDim, mvSearchRange, height, width)

% from the current frame look into the reference frame at the corresponding block shifted
% within the search range and save the direction which leads to the lowest distortion
    
mv_mat = [];
SSD = [];
contor = 0;
for i=1:mbDim:height
    for j=1:mbDim:width
        current_block = currentFrame(i:i+mbDim-1,j:j+mbDim-1,1);
        ssd = 9999999;
        pos = [0 0];
        for x = -mvSearchRange:mvSearchRange
            for y = -mvSearchRange:mvSearchRange
                if i+y > 0 && i+y+mbDim-1 <= height
                    if j+x > 0 && j+x+mbDim-1 <= width
                        target_block = referenceFrame(i+y:i+y+mbDim-1,j+x:j+x+mbDim-1,1);
                        result = sum(sum((current_block - target_block).^2));
                        contor = contor + 1;
                        if result < ssd
                            ssd = result;
                            pos = [x y];
                        end
                    end
                end
            end
        end
        SSD = [SSD; ssd];
        mv_mat = [mv_mat; pos];
    end
end