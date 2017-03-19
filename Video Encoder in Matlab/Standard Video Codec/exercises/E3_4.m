clear all
close all
clc

path (path, 'F:/IVC_labs_starting_point/functions');
path (path, 'F:/IVC_labs_starting_point/analysis');
path (path, 'F:/IVC_labs_starting_point/encoder');
path (path, 'F:/IVC_labs_starting_point/decoder');

TRAINING_image = double(imread('F:/IVC_labs_starting_point/data/images/lena_small.tif'));
ORIGINAL_image = double(imread('F:/IVC_labs_starting_point/data/images/lena.tif'));
[height width dimensions] = size(ORIGINAL_image);

tic
M = 8; % number of bits used for the quatization
N = 2; % size of the N x N blocks used for vector quantization
representative_values = train_vector_quantization(TRAINING_image, M, N);
INDEX_image = encode_image(TRAINING_image, representative_values, M, N);%the INDEX_image after encoding the TRAINING_image
%%build the Huffman table based on the TRAINING_image
H = hist(INDEX_image(:),1:256);
H = H/sum(H);
[ BinaryTree, HuffCode, BinCode, Codelengths] = buildHuffman( H );

%encode the ORIGINAL_image with the representative values obtained from the
%TRAINIG_image and use the Huffman table obtained also from the
%TRAINIG_image
INDEX_image = encode_image(ORIGINAL_image, representative_values, M, N);

bytestream = enc_huffman_new( INDEX_image(:), BinCode, Codelengths);
%%receive and reconstruct the INDEX_image
Reconstructed_INDEX_image = double(reshape( dec_huffman_new ( bytestream, BinaryTree, max(size(INDEX_image(:))) ), size(INDEX_image)));
%%decode the image
QUANTIZED_image = decode_image(Reconstructed_INDEX_image, representative_values, N);
toc

MSE = calcMSE (QUANTIZED_image, ORIGINAL_image, height, width, dimensions);
PSNR = calcPSNR(MSE, QUANTIZED_image);
Bitrate = length(bytestream)*8 / width / height;

figure
imagesc(ORIGINAL_image/256);
title('Original image');

figure
imagesc(QUANTIZED_image/256);
title('QUANTIZED image');
