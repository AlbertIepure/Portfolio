clear all
close all
clc

M = 8; %order of the DCT

image = randi(255,M,M,3); %generate a random M*M image with pixel values from 1:255
quantization_index_image = image*0;

luminance_quantization_table = [16  11  10  16  24  40  51  61;
                                12  12  14  19  26  58  60  55;
                                14  13  16  24  40  57  69  56;
                                14  17  22  29  51  87  80  62;
                                18  55  37  56  68 109 103  77;
                                24  35  55  64  81 104 113  92;
                                49  64  78  87 103 121 120 101;
                                72  92  95  98 112 100 103  99];
                            
 chrominance_quantization_table = [17  18  24  47  99  99  99  99;
                                   18  21  26  66  99  99  99  99;
                                   24  13  56  99  99  99  99  99;
                                   47  66  99  99  99  99  99  99;
                                   99  99  99  99  99  99  99  99;
                                   99  99  99  99  99  99  99  99;
                                   99  99  99  99  99  99  99  99;
                                   99  99  99  99  99  99  99  99];
                               

 quantization_index_image(:,:,1) = round(image(:,:,1)./luminance_quantization_table);
 quantization_index_image(:,:,2) = round(image(:,:,2)./chrominance_quantization_table);
 quantization_index_image(:,:,3) = round(image(:,:,3)./chrominance_quantization_table);

 
                           