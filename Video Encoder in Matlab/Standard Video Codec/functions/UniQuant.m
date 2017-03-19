function INDEX_mat = UniQuant(ORIGINAL_image, M)
indices = [0:1:2^M-1];
intervals = [0:2^-M:1];
[height width dimensions] = size(ORIGINAL_image);
INDEX_mat = ORIGINAL_image*0; % allocate memory 

for i=1:dimensions
    for j=1:height
        for k=1:width
            start_position = 1;
            while start_position <= length(indices)
                lower_bound = intervals(start_position);
                upper_bound = intervals(start_position+1);
                if lower_bound <= ORIGINAL_image(j,k,i) &&  ORIGINAL_image(j,k,i) < upper_bound
                    INDEX_mat(j,k,i) = indices(start_position);
                    break
                else
                    start_position = start_position + 1;
                end
            end
        end
    end
end
