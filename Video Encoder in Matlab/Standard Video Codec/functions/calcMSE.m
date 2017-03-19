function MSE = calcMSE (RECONSTRUCTED_image, ORIGINAL_image, ORIGINAL_height, ORIGINAL_width, ORIGINAL_dimensions)
MSE = sum((RECONSTRUCTED_image(:)-ORIGINAL_image(:)).^2)/(ORIGINAL_height * ORIGINAL_width * ORIGINAL_dimensions);
