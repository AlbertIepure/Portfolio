%--------------------------------------------------------------------------
%
% Description: generate statistics for an image saved in the HDD.
%
% Input variables:
%       - file_path: indicates the location of the image to analyze.
%
% Output variables:
%       - summation: summation of counts in histogram bins.
%       - histogram: image histogram
%
%   Authors:    Iepure, Albert
%               Jiménez, Moisés
%
%--------------------------------------------------------------------------

function [summation , histogram] =  intrachromasubsamplingcodingstatistics(file_path,Q)
    frame = double(imread(file_path));
    ycbcr_frame = ictRGB2YCbCr(frame);
    [newFinalArray] = preencodeintraprocesschromasubsampling(ycbcr_frame,8, Q);
    histogram = hist(newFinalArray,-128:260);
    summation = sum(histogram);
end