%--------------------------------------------------------------
%
%
%
%           %%%    %%%       %%%      %%%%%%%%
%           %%%    %%%      %%%     %%%%%%%%%            
%           %%%    %%%     %%%    %%%%
%           %%%    %%%    %%%    %%%
%           %%%    %%%   %%%    %%%
%           %%%    %%%  %%%    %%%
%           %%%    %%% %%%    %%%
%           %%%    %%%%%%    %%%
%           %%%    %%%%%     %%% 
%           %%%    %%%%       %%%%%%%%%%%%
%           %%%    %%%          %%%%%%%%%   Optimized Video Codec
%
%
% Tools which can be enabled/disabled:  - MVFAST
%										- Half-Pel Accuracy
%										- Chroma Subsampling
%										- Differential Encoding of DC Coefficients 
%										- Group of Pictures Structure
%										- Motion Vector Differential Encoding
%
%
% Note: When activating more tools simultaneously, Chroma Subsampling and Differential Encoding of DC Coefficients should
% not be simultaneously activated! This feature is not yet supported 
%
% Course:       Image and Video Compression
%               Prof. Eckehard Steinbach
%
% Author:       Albert Iepure
%				Moisés Jiménez
%               02.02.2015 (created)
%
%-----------------------------------------------------------------------------------

Five stepguide to run the encoder

1. Copy the folder as it is to the desired location. 
2. Copy all the images from all the sequences (akiyo,coastguard,foreman,news,silent) in the folder \video_codec_comb\data\images. All files 
should be in this folder, without any additional subfolders.
3. Open the Startup_encoder.m file and replace <path> with the corresponding path
5. The PerformEncoding function has the following input parameters:

PerformEncoding(doTrain,Q,GOP_enabled,isDEMVEnabled,isMVFEnabled,isHPEnabled,isCSEnabled,isACDCEnabled)

Each of these parameters is turned on/off by writing in the corresponding position true/false.

Choose a value for Q of either 0.5,1,2 or 3 and press run. 

5. Everything should work now :)
