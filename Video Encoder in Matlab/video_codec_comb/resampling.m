function FILTERED_image_d_c= resampling(ORIGINAL_image, downsampling_factor, upsampling_factor)

[height width dimensions] = size(ORIGINAL_image);
filter_length = 3;

for i=1:dimensions  
    FILTERED_image_d_r(:,:,i) = resample(ORIGINAL_image(:,:,i),upsampling_factor,downsampling_factor,filter_length);
    FILTERED_image_d_c(:,:,i) = resample(FILTERED_image_d_r(:,:,i).',upsampling_factor,downsampling_factor,filter_length).';
end

