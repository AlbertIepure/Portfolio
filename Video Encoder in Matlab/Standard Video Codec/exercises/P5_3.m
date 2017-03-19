clear all
close all
clc
path (path, 'E:/IVC_labs_starting_point/functions');

ORIGINAL_image = imread('E:/IVC_labs_starting_point/data/images/lena_small.tif');

[height width dimensions] = size(ORIGINAL_image);

block_size = 8;
search_range = 4;

mv_mat = [];
for i=1:block_size:height
    for j=1:block_size:width
        current_block = ORIGINAL_image(i:i+block_size-1,j:j+block_size-1,1);
        ssd = 9999999;
        pos = [0 0];
        for x = -search_range:search_range
            for y = -search_range:search_range
                if i+y > 0 && i+y+block_size-1 <= height
                    if j+x > 0 && j+x+block_size-1 <= width
                        target_block = ORIGINAL_image(i+y:i+y+block_size-1,j+x:j+x+block_size-1,1);
                        result = sum(sum((current_block - target_block).^2));
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
