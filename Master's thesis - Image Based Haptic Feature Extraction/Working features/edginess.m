function [ratio] = edginess(I);
% http://www.cs.uregina.ca/Links/class-info/425/Lab5/
% http://www.mathworks.com/matlabcentral/answers/114626-how-to-find-energy-of-the-image

initialEnergy = sum(I(:));
% figure, imshow(I)

%Determine good padding for Fourier transform
PQ = paddedsize(size(I));

%Create a Gaussian Lowpass filter 1% the width of the Fourier transform
percentage = 0.01;
D0 = percentage * PQ(1);
H = lpfilter('gaussian', PQ(1), PQ(2), D0);

% Calculate the discrete Fourier transform of the image
F=fft2(double(I),size(H,1),size(H,2));

% Apply the highpass filter to the Fourier spectrum of the image
LPF_I_FD = H.*F;

% convert the result to the spacial domain.
LPF_I_SD = real(ifft2(LPF_I_FD)); 

% Crop the image to undo padding
LPF_I_SD = LPF_I_SD(1:size(I,1), 1:size(I,2));

%Display the blurred image
% figure, imshow(LPF_I_SD, [])

%Display the difference
diff_image = double(I) - LPF_I_SD;
finalEnergy = sum(abs(diff_image(:)));
ratio = finalEnergy/initialEnergy;

% figure, imshow(diff_image, [])
% Display the Fourier Spectrum 
% Move the origin of the transform to the center of the frequency rectangle.
% Fc=fftshift(F);
% Fcf=fftshift(LPF_I_FD);
% use abs to compute the magnitude and use log to brighten display
% S1=log(1+abs(Fc)); 
% S2=log(1+abs(Fcf));
% figure, imshow(S1,[])
% figure, imshow(S2,[])