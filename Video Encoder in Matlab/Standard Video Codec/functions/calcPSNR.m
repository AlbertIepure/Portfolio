function PSNR = calcPSNR(MSE, RECONSTRUCTED_image)
if max(max(max(RECONSTRUCTED_image))) > 1 % then the image is unnormalized
    B = 8;
else 
    B = 1;
end;
    
PSNR = 10*log10(((2^B-1)^2)/MSE);
    
    