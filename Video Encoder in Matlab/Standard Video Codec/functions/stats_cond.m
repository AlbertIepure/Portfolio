function pmf_joint = stats_cond(ORIGINAL_image)

[height width dimensions] = size(ORIGINAL_image);

pmf_joint=zeros(256,256);

for i=1:dimensions
    for j=1:height
        for k=1:width-1
            x = ORIGINAL_image(j,k,i);
            y = ORIGINAL_image(j,k+1,i);
            pmf_joint(x+1,y+1) = pmf_joint(x+1,y+1) + 1;
        end
    end
end
            