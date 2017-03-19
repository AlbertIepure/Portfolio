%--------------------------------------------------------------------------
%
% Description: This function can perform both training of the Huffman
% tables and the encoding of the frame sequence.
%
%
%   Authors:    Iepure, Albert
%               Jiménez, Moisés
%
%--------------------------------------------------------------------------

function[] = PerformEncoding(doTrain,Q,GOP_enabled,isDEMVEnabled,isMVFEnabled,isHPEnabled,isCSEnabled,isACDCEnabled)
if doTrain
    TrainAllTables(Q);
end
encodevideo(Q,GOP_enabled,isDEMVEnabled,isMVFEnabled,isHPEnabled,isCSEnabled,isACDCEnabled);

%%%%%%%%%%%%%%%%%%%%% Q = [  3      2     1     0.5  ]
% Standard_Final_Bitrate = [0.244  0.323  0.598 1.013]; % with new HUFFMAN tables
% Standard_Final_PSNR =    [30.224 31.572 33.491 35.472]; % with new HUFFMAN tables

Standard_Final_Bitrate = [0.331  0.394  0.601 1.064]; % from LAB 5
Standard_Final_PSNR =    [30.092 31.434 33.37 35.37]; % from LAB 5

GOP_Final_Bitrate    =    [0.244  0.288  0.423  0.601 ];
GOP_Final_PSNR       =    [29.758 31.058 32.815 34.422];

DEMV_Final_Bitrate    =    [0.246  0.322  0.590  1.001 ];
DEMV_Final_PSNR       =    [30.224 31.572 33.491 35.472];

MVFAST_Final_Bitrate    =    [0.249  0.335  0.617  1.036 ];
MVFAST_Final_PSNR       =    [29.872 31.207 33.196 35.243];

Half_pel_Final_Bitrate    =    [0.249  0.317  0.549  0.926 ];
Half_pel_Final_PSNR       =    [31.147 32.513 34.768 37.014];

CHRSUB_Final_Bitrate    =    [0.211  0.285  0.532  0.859 ];
CHRSUB_Final_PSNR       =    [29.788 31.048 32.878 34.778];

ACDC_Final_Bitrate    =    [0.237  0.315  0.589  1.003 ];
ACDC_Final_PSNR       =    [30.224 31.572 33.491 35.472];

Optimized1_Final_Bitrate = [0.20 0.227  0.2592 0.5 ];
Optimized1_Final_PSNR    = [28.1 29.686 30.863 34.22];

Optimized2_Final_Bitrate = [0.252 0.287  0.400 0.589 ];
Optimized2_Final_PSNR    = [30.219 31.479 33.337 35.033];

figure
plot(Standard_Final_Bitrate, Standard_Final_PSNR);
title('Performance with Optimization1 vs Standard codec');
xlabel('Mean Rate [bpp]') % x-axis label
ylabel('Mean PSNR [dB]') % y-axis label
hold on
plot(Optimized1_Final_Bitrate, Optimized1_Final_PSNR,'r');
% plot(Optimized2_Final_Bitrate, Optimized2_Final_PSNR,'r');
plot(GOP_Final_Bitrate, GOP_Final_PSNR,'g');
plot(Half_pel_Final_Bitrate, Half_pel_Final_PSNR,'c');
% plot(DEMV_Final_Bitrate, DEMV_Final_PSNR,'r');
% plot(MVFAST_Final_Bitrate, MVFAST_Final_PSNR,'r');
% plot(ACDC_Final_Bitrate, ACDC_Final_PSNR,'r');
% plot(CHRSUB_Final_Bitrate, CHRSUB_Final_PSNR,'r');
legend('Standard','Optimization1','GOP','HALF Pel','Location','southeast');
% legend('Standard','Half Pel','Location','southeast');
end