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
%           %%%    %%%          %%%%%%%%%   CALCMSE.M
%
%
% organises the encoding process of the image
%
% input:        number of actual ParameterSet to use
%
% returnvalue:  success          - 0: some error occured
%                                - 1: bitstream written
%
% Course:       Image and Video Compression
%               Prof. Eckehard Steinbach
%
% Author:       Moises Jimenez
%               14.10.2014 (created)
%
%-----------------------------------------------------------------------------------

function mean_squared_error = calcMSE( original_image, reconstructed_image )

error_1 = original_image(:,:,1) - reconstructed_image(:,:,1);
error_2 = original_image(:,:,2) - reconstructed_image(:,:,2);
error_3 = original_image(:,:,3) - reconstructed_image(:,:,3);
squared_error_1 = sum(error_1(:).^2);
squared_error_2 = sum(error_2(:).^2);
squared_error_3 = sum(error_3(:).^2);
sizes = size (original_image);
mean_squared_error = squared_error_1/(sizes(1) .* sizes(2)) + squared_error_2/(sizes(1) .* sizes(2)) + squared_error_3/(sizes(1) .* sizes(2));
mean_squared_error = mean_squared_error/3;

return ;