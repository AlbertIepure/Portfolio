function QUANTIZED_block  = Quant8x8 (INPUT_block,M)

% M is a number which increses or decreses the quantization step through
% multiplication with the quantization tables

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
                               
QUANTIZED_block(:,:,1) = round(INPUT_block(:,:,1)./(luminance_quantization_table*M));
QUANTIZED_block(:,:,2) = round(INPUT_block(:,:,2)./(chrominance_quantization_table*M));
QUANTIZED_block(:,:,3) = round(INPUT_block(:,:,3)./(chrominance_quantization_table*M));