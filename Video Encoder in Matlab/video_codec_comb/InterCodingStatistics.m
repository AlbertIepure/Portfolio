%--------------------------------------------------------------------------
%
% Description: generate motion estimation statistics for a couple of
% frames.
%
% Input variables:
%       - macroblock_dim: N dimension of NxN macroblocks.
%       - Q: quantization parameter for intra coding.
%       - mv_search_range: search range for motion estimation.
%       - frame_00: Matrix containing the previous frame of the sequence.
%       - frame_01: Matrix containing the current frame of the sequence.
%
% Output variables:
%       - intra_mv_histogram: histogram of the motion vector generated.
%       - intra_mv_histogram_sum: summation of the bin counts of the motion
%       vector histogram.
%       - intra_ef_histogram: histogram of the error frame.
%       - intra_ef_histogram_sum: summation of the bin counts of the error
%       frame histogram.
%
%   Authors:    Iepure, Albert
%               Jiménez, Moisés
%
%--------------------------------------------------------------------------

function [intra_mv_histogram , intra_ef_histogram] =  InterCodingStatistics(mbDim,Q,mvSearchRange,currentFrame,referenceFrame,isDEMVEnabled,isMVFEnabled,isHPEnabled,isCSEnabled)
ef_lowerbound = -255;
ef_upperbound = 260;
[ycbcr_predicted_frame,motion_matrix]=InterEncodeFrame(mbDim,mvSearchRange,currentFrame,referenceFrame,isMVFEnabled,isHPEnabled);
prediction_error_frame = currentFrame - ycbcr_predicted_frame;
if isCSEnabled
    intraEncodedErrorFrame = preencodeintraprocesschromasubsampling(prediction_error_frame, mbDim, Q);
else
    intraEncodedErrorFrame = preEncodeIntraProcess(prediction_error_frame,Q);
end
if isDEMVEnabled
    mvSearchRange = 2*mvSearchRange;
    motion_matrix=EncodeMMDifferentially(motion_matrix);
end
if isHPEnabled
    motion_matrix = 2*motion_matrix;
    mvSearchRange = 2*mvSearchRange;
end
intra_mv_histogram = hist(motion_matrix(:),-mvSearchRange:mvSearchRange);
intra_ef_histogram = hist(intraEncodedErrorFrame(:),ef_lowerbound:ef_upperbound);
end