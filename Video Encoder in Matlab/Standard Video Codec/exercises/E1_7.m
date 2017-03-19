close all
clear all
clc

S = load('E:/IVC_labs_starting_point/exercises/starting_algorithm');
PSNR =S.PSNR;
bitrate = S.bitrate;

S = load('E:/IVC_labs_starting_point/exercises/RGB_subsampling_CIF');
PSNR = [PSNR S.PSNR];
bitrate = [bitrate 6]; %%because each layer is subsampled by a factor of four and 2+2+2=6 bps

S = load('E:/IVC_labs_starting_point/exercises/chrominance_subsampling');
PSNR = [PSNR S.PSNR];
bitrate = [bitrate 12]; %%because chroma layers are subsampled by a factor of four and luma layer is left unchanged 8+2+2=12 bps

S = load('E:/IVC_labs_starting_point/exercises/my_codec');
PSNR = [PSNR S.PSNR];
bitrate = [bitrate 6.4732]; %%because chroma layers are subsampled by a factor of four and luma layer is left unchanged 8+2+2=12 bps

% S = load('F:/IVC_labs_starting_point/exercises/w(o)_prefilter');
% PSNR = [PSNR S.PSNR_w_prefilter S.PSNR_wo_prefilter];
% bitrate = [bitrate 6 6]; %%because each layer is subsampled by a factor of four and 2+2+2=6 bps
% 
% label = {'smandril.tif' 'lena.tif' 'sail.tif' 'sail.tif - RGB subsampling (CIF)' 'sail.tif - chrominance subsampling (CIF)' 'satpic1.bmp (prefiltered)' 'satpic1.bmp (not prefiltered)'};

label = {'   smandril.tif' '   lena.tif' '   sail.tif' '   sail.tif - RGB subsampling (CIF)' '   sail.tif - chrominance subsampling (CIF)' '   lena.tif - my codec'};


figure
scatter(floor(bitrate), PSNR);
text (floor(bitrate), PSNR, label);
xlabel('Bit per pixel');
ylabel('PSNR [dB]');
axis([0 25 10 50]);