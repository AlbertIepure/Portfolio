function TRANSFORM_image = ictRGB2YCbCr(ORIGINAL_image)

[height width dimensions] = size(ORIGINAL_image);

R = ORIGINAL_image(:,:,1);
G = ORIGINAL_image(:,:,2);
B = ORIGINAL_image(:,:,3);

Y = 0.299*R + 0.587*G + 0.114*B;
Cb = -0.169*R - 0.331*G + 0.5*B;
Cr = 0.5*R - 0.419*G - 0.081*B;

TRANSFORM_image(:,:,1) = Y;
TRANSFORM_image(:,:,2) = Cb;
TRANSFORM_image(:,:,3) = Cr;