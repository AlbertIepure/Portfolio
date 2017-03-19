function QUANTIZED_image = InvUniQuant(INDEX_mat, M)
indices = [0:1:2^M-1];
intervals = [0:2^-M:1];
[height width dimensions] = size(INDEX_mat);
QUANTIZED_image = INDEX_mat*0; % allocate memory 

for i=1:length(indices)
    representative_values(i) = (intervals(i)+intervals(i+1))/2;
end
for i=1:dimensions
    for j=1:height
        for k=1:width
            index = find(indices==INDEX_mat(j,k,i));
            QUANTIZED_image(j,k,i) = representative_values(index);
        end
    end
end