function FILTERED_image = prefilterlowpass2d(ORIGINAL_image, W1)

W1 = W1/sum(sum(W1)); % normalization of the filter

% Y = fft2(W1);
% Y = fftshift(Y);
% abs_val = abs(Y);
% 
% figure 
% surf(abs_val);

FILTERED_image = conv2(ORIGINAL_image, W1,'same'); %it only takes the central part because the convolution is longer than the original image and we want to be the same

