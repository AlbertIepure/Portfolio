function QUANTIZED_image = decode_image(INDEX_image, representative_values, N)

[height width dimensions] = size(INDEX_image);
%since the INDEX image is downsampled by a factor of N (for each N*N block
%in OROGINAL image we have only one value in INDEX image)
for i=1:dimensions
        for j=1:N:height*N
            for k=1:N:width*N
                index = INDEX_image(int16(j/N),int16(k/N),i); %each value in the INDEX matrix corresponds to a N*N block
                QUANTIZED_image(j:j+1,k:k+1,i) = reshape(representative_values(index,1:N*N),[N,N]).';
            end
        end
end