function TRANSFORM_image = ictYCbCr2RGB(ORIGINAL_image)

[height width dimensions] = size(ORIGINAL_image);

Y = ORIGINAL_image(:,:,1);
Cb = ORIGINAL_image(:,:,2);
Cr = ORIGINAL_image(:,:,3);

R = Y + 1.402*Cr;
G = Y - 0.344*Cb - 0.714*Cr;
B = Y + 1.7222*Cb;

TRANSFORM_image(:,:,1) = R;
TRANSFORM_image(:,:,2) = G;
TRANSFORM_image(:,:,3) = B;