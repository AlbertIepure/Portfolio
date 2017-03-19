function  [mv_mat,contor] = full_search(current_frame, reference_frame, block_size, search_range, height, width)

%% from the current frame look into the reference frame at the corresponding block shifted
%% within the search range and save the direction which leads to the lowest distortion
    
mv_mat = [];
contor = 0;

for i=1:block_size:height
    for j=1:block_size:width
        current_block = current_frame(i:i+block_size-1,j:j+block_size-1,1);
        ssd = 9999999;
        pos = [0 0];
        for x = -search_range:search_range
            for y = -search_range:search_range
                if i+y > 0 && i+y+block_size-1 <= height
                    if j+x > 0 && j+x+block_size-1 <= width
                        target_block = reference_frame(i+y:i+y+block_size-1,j+x:j+x+block_size-1,1);
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
        mv_mat = [mv_mat; pos];
    end
end