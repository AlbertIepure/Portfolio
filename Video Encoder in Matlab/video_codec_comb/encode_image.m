function INDEX_image = encode_image(ORIGINAL_image, representative_values, M, N)

intervals = [0:256/2^M:256];
[height width dimensions] = size(ORIGINAL_image);

for i=1:dimensions
    for j=1:N:height
        for k=1:N:width
            sample_vector = reshape(ORIGINAL_image(j:j+1,k:k+1,i).',[1,N*N]);
            dif_norm = sqrt(sum((representative_values - repmat(sample_vector,length(intervals)-1,1)).^2,2)); %the norm of the difference
            [value,index] = min(dif_norm);
%             INDEX_image(j:j+1,k:k+1,i) = index;
            INDEX_image(int16(j/N),int16(k/N),i) = index; %only one value is stored for a NxN block
        end
    end
end
   