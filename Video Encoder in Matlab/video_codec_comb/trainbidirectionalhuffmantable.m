function[] = trainbidirectionalhuffmantable(Q)

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% VARIABLE DECLARATION %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ycbcrLowerbound = -128;
efLowerbound = -255;
efUpperbound = 260;
mbDim = 8;
mvSearchRange = 4;
gop = ['I' 'P' 'B' 'B' 'P' 'B' 'B' 'P' 'B' 'B' 'P'];
intraBMvHistogram = 0;
intraBEfHistogram = 0;
intraBDemvHistogram = 0;
intraBHpMvHistogram = 0;
intraBHpEfHistogram = 0;
isHPEnabled = false;
isMVFEnabled = false;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% LOADING FRAMES %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_count = 0;
p_count = 0;
b_count = 0;
for i = 0:10
    image_index = i + 20;
    file_path = 'data/images/foreman0020.bmp';
    % foreman index0 = 22
    % coastguard index0 = 25
    % silent index0 = 21
    % news index0 = 19
    % akiyo index0 = 20
    path_index = 22;
    image_index = num2str(image_index,'%02d');
    file_path(path_index) = image_index(1);
    file_path(path_index + 1) = image_index(2);
    if gop(i+1) == 'I'
        i_count = i_count + 1;
        i_frames{i_count} = double(imread(file_path));
        i_tags{i_count} = gop(i+1);
    elseif gop(i+1) == 'P'
        p_count = p_count + 1;
        p_frames{p_count} = double(imread(file_path));
        p_tags{p_count} = gop(i+1);
    elseif gop(i+1) == 'B'
        b_count = b_count + 1;
        b_frames{b_count} = double(imread(file_path));
        b_tags{b_count} = gop(i+1);
    end
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% REORDERING FRAMES %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
frames = halfInterweave(i_frames,p_frames,b_frames);
tags = halfInterweave(i_tags,p_tags,b_tags);
%% CLEARING OF UNUSED VARIABLES
clear file_path
clear index
clear image_index
clear path_index
clear i_count
clear p_count
clear b_count
clear i_frames
clear p_frames
clear b_frames
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% LOAD HUFFMAN TABLES %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bt_path = addQ2Path('video_codec_comb/huffman_tables/intra_binary_tree_00',51,Q);
intra_binary_tree = load(bt_path,'-mat');
intra_binary_tree = intra_binary_tree.intra_binary_tree;
bc_path = addQ2Path('video_codec_comb/huffman_tables/intra_bin_code_00',48,Q);
intra_bin_code = load(bc_path,'-mat');
intra_bin_code = intra_bin_code.intra_bin_code;
cl_path = addQ2Path('video_codec_comb/huffman_tables/intra_codelengths_00',51,Q);
intra_codelengths = load(cl_path,'-mat');
intra_codelengths = intra_codelengths.intra_codelengths;
bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_binary_tree_ef_00',54,Q);
inter_binary_tree_ef = load(bt_path,'-mat');
inter_binary_tree_ef = inter_binary_tree_ef.inter_binary_tree_ef;
bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_bin_code_ef_00',51,Q);
inter_bin_code_ef = load(bc_path,'-mat');
inter_bin_code_ef = inter_bin_code_ef.inter_bin_code_ef;
cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_codelengths_ef_00',54,Q);
inter_codelengths_ef = load(cl_path,'-mat');
inter_codelengths_ef = inter_codelengths_ef.inter_codelengths_ef;
bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_binary_tree_mv_00',54,Q);
inter_binary_tree_mv = load(bt_path,'-mat');
inter_binary_tree_mv = inter_binary_tree_mv.inter_binary_tree_mv;
bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_bin_code_mv_00',51,Q);
inter_bin_code_mv = load(bc_path,'-mat');
inter_bin_code_mv = inter_bin_code_mv.inter_bin_code_mv;
cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_codelengths_mv_00',54,Q);
inter_codelengths_mv = load(cl_path,'-mat');
inter_codelengths_mv = inter_codelengths_mv.inter_codelengths_mv;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% INTER ENCODING %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
start = cputime;
for i = 1:11
    current_frame = frames{i};
    ycbcr_current_frame = ictRGB2YCbCr(current_frame);
    if tags{i} == 'I'
    %% I FRAME
        [ycbcr_decoded_frame,~] = IntraEncodeFrame(ycbcr_current_frame,intra_binary_tree, intra_bin_code,intra_codelengths,Q,ycbcrLowerbound);
        ycbcr_reference_frame_0 = ycbcr_decoded_frame;
    elseif tags{i} == 'P'
        %% P FRAMES
        %% MOTION ESTIMATION
        [ycbcrPredictedFrame,motionVector]=InterEncodeFrame(mbDim,mvSearchRange,ycbcr_current_frame,ycbcr_reference_frame_0,isMVFEnabled,isHPEnabled);
        
        %% ERROR CALCULATION
        ycbcrPredictionErrorFrame=ycbcr_current_frame-ycbcrPredictedFrame;

        %% INTRA CODING OF ERROR FRAME
        [ycbcr_decoded_error_frame,~]=IntraEncodeFrame(ycbcrPredictionErrorFrame,inter_binary_tree_ef,inter_bin_code_ef,inter_codelengths_ef,Q,efLowerbound);

        %% HUFFMAN CODING OF MV
        [huffman_mv]=enc_huffman_new(motionVector+mvSearchRange+1,inter_bin_code_mv,inter_codelengths_mv);

        %% DECODING
        decoded_mv=dec_huffman_new(huffman_mv,inter_binary_tree_mv,max(size(motionVector(:))))-4-1;
        decoded_mv=decoded_mv';
        decoded_mv_01 = decoded_mv(1:36*44);
        decoded_mv_02 = decoded_mv(36*44+1:2*36*44);
        reshaped_mv(:,1) = decoded_mv_01;
        reshaped_mv(:,2) = decoded_mv_02;
        
        %reshaped_mv = (vec2mat(dec_huffman(huffman_mv,inter_binary_tree_mv, max(size(motion_vector(:)'))), size(motion_vector,2))) - mv_search_range - 1;

        %% MOTION COMPENSATION
        ycbcrPredictedFrame = MotionCompensation(ycbcr_reference_frame_0,reshaped_mv,mbDim,isHPEnabled);
        ycbcr_recovered_frame = ycbcrPredictedFrame + ycbcr_decoded_error_frame;
        
        ycbcr_reference_frame_1=ycbcr_recovered_frame;
    elseif tags{i} == 'B'
        %% MOTION ESTIMATION
        [ycbcrPredictedFrame,motionVector]=BidirectionalInterEncodeFrame(mbDim,mvSearchRange,ycbcr_reference_frame_1,ycbcr_current_frame,ycbcr_reference_frame_0,false,false);
        [ycbcrHpPredictedFrame,hpMotionVector]=BidirectionalInterEncodeFrame(mbDim,mvSearchRange,ycbcr_reference_frame_1,ycbcr_current_frame,ycbcr_reference_frame_0,false,false);
        
        %% ERROR CALCULATION
        ycbcrPredictionErrorFrame=ycbcr_current_frame-ycbcrPredictedFrame;
        ycbcrPredictionErrorFrame = preEncodeIntraProcess(ycbcrPredictionErrorFrame,Q+4);
        motionVector=motionVector(:,1:2);
        deMotionMatrix=EncodeMMDifferentially(motionVector(:,1:2));
        intraBMvHistogram=intraBMvHistogram + hist(motionVector(:),-mvSearchRange:mvSearchRange);
        intraBEfHistogram=intraBEfHistogram + hist(ycbcrPredictionErrorFrame(:),efLowerbound:efUpperbound);
        intraBDemvHistogram=intraBDemvHistogram + hist(deMotionMatrix(:),-2*mvSearchRange:2*mvSearchRange);
        
        ycbcrHpPredictionErrorFrame=ycbcr_current_frame-ycbcrHpPredictedFrame;
        ycbcrHpPredictionErrorFrame=preEncodeIntraProcess(ycbcrHpPredictionErrorFrame,Q+4);
        intraBHpMvHistogram=intraBHpMvHistogram + hist(2*hpMotionVector(:),-2*mvSearchRange:2*mvSearchRange);
        intraBHpEfHistogram=intraBHpEfHistogram + hist(ycbcrHpPredictionErrorFrame(:),efLowerbound:efUpperbound);
        
    end
end
inter_processing_duration = cputime - start;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% FULL PEL TABLES %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
intra_mv_histogram_sum = sum(sum(intraBMvHistogram));
intraBMvHistogram = intraBMvHistogram / intra_mv_histogram_sum;
[inter_b_binary_tree_mv, inter_b_huff_code_mv, inter_b_bin_code_mv, inter_b_codelengths_mv] = buildHuffman(intraBMvHistogram);
bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_binary_tree_mv_00.mat',56,Q);
save(bt_path, 'inter_b_binary_tree_mv');
hc_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_huff_code_mv_00.mat',54,Q);
save(hc_path, 'inter_b_huff_code_mv');
bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_bin_code_mv_00.mat',53,Q);
save(bc_path, 'inter_b_bin_code_mv');
cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_codelengths_mv_00.mat',56,Q);
save(cl_path, 'inter_b_codelengths_mv');
intra_ef_histogram_sum = sum(sum(intraBEfHistogram));
intraBEfHistogram = intraBEfHistogram / intra_ef_histogram_sum;
[inter_b_binary_tree_ef, inter_b_huff_code_ef, inter_b_bin_code_ef, inter_b_codelengths_ef] = buildHuffman(intraBEfHistogram);
bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_binary_tree_ef_00.mat',56,Q);
save(bt_path, 'inter_b_binary_tree_ef');
hc_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_huff_code_ef_00.mat',54,Q);
save(hc_path, 'inter_b_huff_code_ef');
bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_bin_code_ef_00.mat',53,Q);
save(bc_path, 'inter_b_bin_code_ef');
cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_codelengths_ef_00.mat',56,Q);
save(cl_path, 'inter_b_codelengths_ef');
intra_demv_histogram_sum = sum(sum(intraBDemvHistogram));
intraBDemvHistogram = intraBDemvHistogram / intra_demv_histogram_sum;
[inter_b_binary_tree_mv, inter_b_huff_code_mv, inter_b_bin_code_mv, inter_b_codelengths_mv] = buildHuffman(intraBDemvHistogram);
bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_binary_tree_demv_00.mat',58,Q);
save(bt_path, 'inter_b_binary_tree_mv');
hc_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_huff_code_demv_00.mat',56,Q);
save(hc_path, 'inter_b_huff_code_mv');
bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_bin_code_demv_00.mat',55,Q);
save(bc_path, 'inter_b_bin_code_mv');
cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_codelengths_demv_00.mat',58,Q);
save(cl_path, 'inter_b_codelengths_mv');
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% HALF PEL TABLES %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
intra_mv_histogram_sum = sum(sum(intraBHpMvHistogram));
intraBHpMvHistogram = intraBHpMvHistogram / intra_mv_histogram_sum;
[inter_b_binary_tree_mv, inter_b_huff_code_mv, inter_b_bin_code_mv, inter_b_codelengths_mv] = buildHuffman(intraBHpMvHistogram);
bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_binary_tree_hpmv_00.mat',58,Q);
save(bt_path, 'inter_b_binary_tree_mv');
hc_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_huff_code_hpmv_00.mat',56,Q);
save(hc_path, 'inter_b_huff_code_mv');
bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_bin_code_hpmv_00.mat',55,Q);
save(bc_path, 'inter_b_bin_code_mv');
cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_codelengths_hpmv_00.mat',58,Q);
save(cl_path, 'inter_b_codelengths_mv');
intra_ef_histogram_sum = sum(sum(intraBHpEfHistogram));
intraBHpEfHistogram = intraBHpEfHistogram / intra_ef_histogram_sum;
[inter_b_binary_tree_ef, inter_b_huff_code_ef, inter_b_bin_code_ef, inter_b_codelengths_ef] = buildHuffman(intraBHpEfHistogram);
bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_binary_tree_hpef_00.mat',58,Q);
save(bt_path, 'inter_b_binary_tree_ef');
hc_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_huff_code_hpef_00.mat',56,Q);
save(hc_path, 'inter_b_huff_code_ef');
bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_bin_code_hpef_00.mat',55,Q);
save(bc_path, 'inter_b_bin_code_ef');
cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_b_codelengths_hpef_00.mat',58,Q);
save(cl_path, 'inter_b_codelengths_ef');