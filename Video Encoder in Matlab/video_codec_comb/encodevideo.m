%--------------------------------------------------------------------------
%
% Description: This function encodes the frame sequence depending on the
% selected features and a quantization parameter Q.
%
% Note: B frames are encoded at Q_prime = Q + 4
%
%   Authors:    Iepure, Albert
%               Jiménez, Moisés
%
%--------------------------------------------------------------------------

function[] = encodevideo(Q,isGOPEnabled,isDEMVEnabled,isMVFEnabled,isHPEnabled,isCSEnabled,isACDCEnabled)
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% VARIABLE DECLARATION %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ycbcrLowerbound = -128;
eFLowerbound = -255;
mbDim = 8;
mvSearchRange = 4;
bitrates = zeros(21,1);
psnrs = zeros(21,1);
accumulated_contor = 0;
if isGOPEnabled
    gop = {'I' 'B' 'B' 'P' 'B' 'B' 'P' 'B' 'B' 'P' 'B' 'B' 'P' 'B' 'B' 'P' 'B' 'B' 'P' 'B' 'P'};
else
    gop = {'I' 'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P'};
end
sequenceLength = length(gop);
progressMarker = '=====';
progressBar = '';
DEMVCoeff = 1;
if isDEMVEnabled
    DEMVCoeff = 2;
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% LOADING FRAMES %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loading_start = cputime;
i_count = 0;
p_count = 0;
b_count = 0;
file_path = 'data/images/foreman0020.bmp';
% foreman index0 = 22
% coastguard index0 = 25
% silent index0 = 21
% news index0 = 19
% akiyo index0 = 20
path_index = 22;
for i = 0:20
    image_index = i + 20;
    image_index = num2str(image_index,'%02d');
    file_path(path_index) = image_index(1);
    file_path(path_index + 1) = image_index(2);
    if isGOPEnabled
        if gop{i+1} == 'I'
            i_count = i_count + 1;
            i_frames{i_count} = double(imread(file_path));
            i_tags{i_count} = gop{i+1};
        elseif gop{i+1} == 'P'
            p_count = p_count + 1;
            p_frames{p_count} = double(imread(file_path));
            p_tags{p_count} = gop{i+1};
        elseif gop{i+1} == 'B'
            b_count = b_count + 1;
            b_frames{b_count} = double(imread(file_path));
            b_tags{b_count} = gop{i+1};
        end
    else
        frames{i+1} = double(imread(file_path));
    end
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% REORDERING FRAMES %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if isGOPEnabled
    frames = interweave(i_frames,p_frames,b_frames);
    tags = interweave(i_tags,p_tags,b_tags);
else
    tags = gop;
end
dimensions = size(frames{1});
height = dimensions(1);
width = dimensions(2);
channels = dimensions(3);
image_loading_duration = cputime - loading_start;
fprintf('Image loading time: %fs.\n',image_loading_duration);
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
%%%%%%%%% INTRA HUFFMAN LOAD %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mvBtPath = addQ2Path('video_codec_comb/huffman_tables/intra_binary_tree_00',46+5,Q);
intra_binary_tree = load(mvBtPath,'-mat');
intra_binary_tree = intra_binary_tree.intra_binary_tree;
mvBcPath = addQ2Path('video_codec_comb/huffman_tables/intra_bin_code_00',43+5,Q);
intra_bin_code = load(mvBcPath,'-mat');
intra_bin_code = intra_bin_code.intra_bin_code;
mvClPath = addQ2Path('video_codec_comb/huffman_tables/intra_codelengths_00',46+5,Q);
intra_codelengths = load(mvClPath,'-mat');
intra_codelengths = intra_codelengths.intra_codelengths;
if isACDCEnabled
    bt_path = addQ2Path('video_codec_comb/huffman_tables/intra_ac_binary_tree_00',47+5+2,Q);
    intra_ac_binary_tree = load(bt_path,'-mat');
    intra_ac_binary_tree = intra_ac_binary_tree.intra_binary_tree;
    bc_path = addQ2Path('video_codec_comb/huffman_tables/intra_ac_bin_code_00',44+5+2,Q);
    intra_ac_bin_code = load(bc_path,'-mat');
    intra_ac_bin_code = intra_ac_bin_code.intra_bin_code;
    cl_path = addQ2Path('video_codec_comb/huffman_tables/intra_ac_codelengths_00',47+5+2,Q);
    intra_ac_codelengths = load(cl_path,'-mat');
    intra_ac_codelengths = intra_ac_codelengths.intra_codelengths;
    
    bt_path = addQ2Path('video_codec_comb/huffman_tables/intra_dc_binary_tree_00',47+5+2,Q);
    intra_dc_binary_tree = load(bt_path,'-mat');
    intra_dc_binary_tree = intra_dc_binary_tree.intra_binary_tree;
    bc_path = addQ2Path('video_codec_comb/huffman_tables/intra_dc_bin_code_00',44+5+2,Q);
    intra_dc_bin_code = load(bc_path,'-mat');
    intra_dc_bin_code = intra_dc_bin_code.intra_bin_code;
    cl_path = addQ2Path('video_codec_comb/huffman_tables/intra_dc_codelengths_00',47+5+2,Q);
    intra_dc_codelengths = load(cl_path,'-mat');
    intra_dc_codelengths = intra_dc_codelengths.intra_codelengths;
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% INTER HUFFMAN LOAD %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
offset = 0;
efOffset = 0;
mvOffset = 0;
if isDEMVEnabled && isHPEnabled
    mvBtPath = 'video_codec_comb/huffman_tables/inter_binary_tree_dehpmv_00';
    mvBcPath = 'video_codec_comb/huffman_tables/inter_bin_code_dehpmv_00';
    mvClPath = 'video_codec_comb/huffman_tables/inter_codelengths_dehpmv_00';
    efBtPath = 'video_codec_comb/huffman_tables/inter_binary_tree_ef_00';
    efBcPath = 'video_codec_comb/huffman_tables/inter_bin_code_ef_00';
    efClPath = 'video_codec_comb/huffman_tables/inter_codelengths_ef_00';
    mvOffset = 4;
elseif isDEMVEnabled
    mvBtPath = 'video_codec_comb/huffman_tables/inter_binary_tree_demv_00';
    mvBcPath = 'video_codec_comb/huffman_tables/inter_bin_code_demv_00';
    mvClPath = 'video_codec_comb/huffman_tables/inter_codelengths_demv_00';
    efBtPath = 'video_codec_comb/huffman_tables/inter_binary_tree_ef_00';
    efBcPath = 'video_codec_comb/huffman_tables/inter_bin_code_ef_00';
    efClPath = 'video_codec_comb/huffman_tables/inter_codelengths_ef_00';
    offset = 2;
elseif isHPEnabled
    mvBtPath = 'video_codec_comb/huffman_tables/inter_binary_tree_hpmv_00';
    mvBcPath = 'video_codec_comb/huffman_tables/inter_bin_code_hpmv_00';
    mvClPath = 'video_codec_comb/huffman_tables/inter_codelengths_hpmv_00';
    efBtPath = 'video_codec_comb/huffman_tables/inter_binary_tree_hpef_00';
    efBcPath = 'video_codec_comb/huffman_tables/inter_bin_code_hpef_00';
    efClPath = 'video_codec_comb/huffman_tables/inter_codelengths_hpef_00';
    offset = 2;
    efOffset = offset;
else
    mvBtPath = 'video_codec_comb/huffman_tables/inter_binary_tree_mv_00';  
    mvBcPath = 'video_codec_comb/huffman_tables/inter_bin_code_mv_00';
    mvClPath = 'video_codec_comb/huffman_tables/inter_codelengths_mv_00';
    efBtPath = 'video_codec_comb/huffman_tables/inter_binary_tree_ef_00';
    efBcPath = 'video_codec_comb/huffman_tables/inter_bin_code_ef_00';
    efClPath = 'video_codec_comb/huffman_tables/inter_codelengths_ef_00';
end
mvBtPath = addQ2Path(mvBtPath,49+5+offset+mvOffset,Q);
inter_binary_tree_mv = load(mvBtPath,'-mat');
inter_binary_tree_mv = inter_binary_tree_mv.inter_binary_tree_mv;
mvBcPath = addQ2Path(mvBcPath,46+5+offset+mvOffset,Q);
inter_bin_code_mv = load(mvBcPath,'-mat');
inter_bin_code_mv = inter_bin_code_mv.inter_bin_code_mv;
mvClPath = addQ2Path(mvClPath,49+5+offset+mvOffset,Q);
inter_codelengths_mv = load(mvClPath,'-mat');
inter_codelengths_mv = inter_codelengths_mv.inter_codelengths_mv;
efBtPath = addQ2Path(efBtPath,49+5+efOffset,Q);
inter_binary_tree_ef = load(efBtPath,'-mat');
inter_binary_tree_ef = inter_binary_tree_ef.inter_binary_tree_ef;
efBcPath = addQ2Path(efBcPath,46+5+efOffset,Q);
inter_bin_code_ef = load(efBcPath,'-mat');
inter_bin_code_ef = inter_bin_code_ef.inter_bin_code_ef;
efClPath = addQ2Path(efClPath,49+5+efOffset,Q);
inter_codelengths_ef = load(efClPath,'-mat');
inter_codelengths_ef = inter_codelengths_ef.inter_codelengths_ef;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% BINTER HUFFMAN LOAD %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
offset = 0;
efOffset = 0;
if isDEMVEnabled && isHPEnabled
    mvBtPath = 'video_codec_comb/huffman_tables/inter_binary_tree_dehpmv_00';
    mvBcPath = 'video_codec_comb/huffman_tables/inter_bin_code_dehpmv_00';
    mvClPath = 'video_codec_comb/huffman_tables/inter_codelengths_dehpmv_00';
    efBtPath = 'video_codec_comb/huffman_tables/inter_binary_tree_ef_00';
    efBcPath = 'video_codec_comb/huffman_tables/inter_bin_code_ef_00';
    efClPath = 'video_codec_comb/huffman_tables/inter_codelengths_ef_00';
    mvOffset = 2;
    mvBtPath = addQ2Path(mvBtPath,51+5+offset+mvOffset,Q);
    inter_b_binary_tree_mv = load(mvBtPath,'-mat');
    inter_b_binary_tree_mv = inter_b_binary_tree_mv.inter_binary_tree_mv;
    mvBcPath = addQ2Path(mvBcPath,48+5+offset+mvOffset,Q);
    inter_b_bin_code_mv = load(mvBcPath,'-mat');
    inter_b_bin_code_mv = inter_b_bin_code_mv.inter_bin_code_mv;
    mvClPath = addQ2Path(mvClPath,51+5+offset+mvOffset,Q);
    inter_b_codelengths_mv = load(mvClPath,'-mat');
    inter_b_codelengths_mv = inter_b_codelengths_mv.inter_codelengths_mv;
    efBtPath = addQ2Path(efBtPath,51+5+efOffset-2,Q);
    inter_b_binary_tree_ef = load(efBtPath,'-mat');
    inter_b_binary_tree_ef = inter_b_binary_tree_ef.inter_binary_tree_ef;
    efBcPath = addQ2Path(efBcPath,48+5+efOffset-2,Q);
    inter_b_bin_code_ef = load(efBcPath,'-mat');
    inter_b_bin_code_ef = inter_b_bin_code_ef.inter_bin_code_ef;
    efClPath = addQ2Path(efClPath,51+5+efOffset-2,Q);
    inter_b_codelengths_ef = load(efClPath,'-mat');
    inter_b_codelengths_ef = inter_b_codelengths_ef.inter_codelengths_ef;
elseif isDEMVEnabled
    mvBtPath = 'video_codec_comb/huffman_tables/inter_b_binary_tree_demv_00';
    mvBcPath = 'video_codec_comb/huffman_tables/inter_b_bin_code_demv_00';
    mvClPath = 'video_codec_comb/huffman_tables/inter_b_codelengths_demv_00';
    efBtPath = 'video_codec_comb/huffman_tables/inter_b_binary_tree_ef_00';
    efBcPath = 'video_codec_comb/huffman_tables/inter_b_bin_code_ef_00';
    efClPath = 'video_codec_comb/huffman_tables/inter_b_codelengths_ef_00';
    offset = 2;
elseif isHPEnabled
    mvBtPath = 'video_codec_comb/huffman_tables/inter_b_binary_tree_hpmv_00';
    mvBcPath = 'video_codec_comb/huffman_tables/inter_b_bin_code_hpmv_00';
    mvClPath = 'video_codec_comb/huffman_tables/inter_b_codelengths_hpmv_00';
    efBtPath = 'video_codec_comb/huffman_tables/inter_b_binary_tree_hpef_00';
    efBcPath = 'video_codec_comb/huffman_tables/inter_b_bin_code_hpef_00';
    efClPath = 'video_codec_comb/huffman_tables/inter_b_codelengths_hpef_00';
    offset = 2;
    efOffset = offset;
else
    mvBtPath = 'video_codec_comb/huffman_tables/inter_b_binary_tree_mv_00';
    mvBcPath = 'video_codec_comb/huffman_tables/inter_b_bin_code_mv_00';
    mvClPath = 'video_codec_comb/huffman_tables/inter_b_codelengths_mv_00';
    efBtPath = 'video_codec_comb/huffman_tables/inter_b_binary_tree_ef_00';
    efBcPath = 'video_codec_comb/huffman_tables/inter_b_bin_code_ef_00';
    efClPath = 'video_codec_comb/huffman_tables/inter_b_codelengths_ef_00';
end
if ~isDEMVEnabled && ~isHPEnabled
    mvBtPath = addQ2Path(mvBtPath,51+5+offset+mvOffset,Q);
    inter_b_binary_tree_mv = load(mvBtPath,'-mat');
    inter_b_binary_tree_mv = inter_b_binary_tree_mv.inter_b_binary_tree_mv;
    mvBcPath = addQ2Path(mvBcPath,48+5+offset+mvOffset,Q);
    inter_b_bin_code_mv = load(mvBcPath,'-mat');
    inter_b_bin_code_mv = inter_b_bin_code_mv.inter_b_bin_code_mv;
    mvClPath = addQ2Path(mvClPath,51+5+offset+mvOffset,Q);
    inter_b_codelengths_mv = load(mvClPath,'-mat');
    inter_b_codelengths_mv = inter_b_codelengths_mv.inter_b_codelengths_mv;
    efBtPath = addQ2Path(efBtPath,51+5+efOffset,Q);
    inter_b_binary_tree_ef = load(efBtPath,'-mat');
    inter_b_binary_tree_ef = inter_b_binary_tree_ef.inter_b_binary_tree_ef;
    efBcPath = addQ2Path(efBcPath,48+5+efOffset,Q);
    inter_b_bin_code_ef = load(efBcPath,'-mat');
    inter_b_bin_code_ef = inter_b_bin_code_ef.inter_b_bin_code_ef;
    efClPath = addQ2Path(efClPath,51+5+efOffset,Q);
    inter_b_codelengths_ef = load(efClPath,'-mat');
    inter_b_codelengths_ef = inter_b_codelengths_ef.inter_b_codelengths_ef;
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% INTER ENCODING %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
inter_start = cputime;
for i = 1:21
    sub_start = cputime;
    currentFrame = frames{i};
    ycbcrCurrentFrame = ictRGB2YCbCr(currentFrame);
    if tags{i} == 'I'
        %% I FRAME
        if isCSEnabled
            [intraEncodedY,intraEncodedCb,intraEncodedCr, nrYsymbols,nrCbSymbols,nrCrSymbols] = IntraEncode_chr_sub(ycbcrCurrentFrame, mbDim, Q, intra_bin_code, intra_codelengths, ycbcrLowerbound);
            ycbcrDecodedFrame=IntraDecode_chr_sub(intraEncodedY,intraEncodedCb,intraEncodedCr, nrYsymbols,nrCbSymbols,nrCrSymbols, intra_binary_tree, width, mbDim, Q, ycbcrLowerbound);
            intraEncodedFrame = [ intraEncodedY(:) ; intraEncodedCb(:) ; intraEncodedCr(:)];
        elseif isACDCEnabled
            [encodedDC,encodedAC, nrDCSymbols, nrACSymbols] = IntraEncode_DC_AC(ycbcrCurrentFrame,mbDim,Q, intra_dc_bin_code, intra_ac_bin_code, intra_dc_codelengths, intra_ac_codelengths, -255, -128);
            ycbcrDecodedFrame = IntraDecode_DC_AC (encodedDC,encodedAC,intra_dc_binary_tree,intra_ac_binary_tree,nrDCSymbols,nrACSymbols,height,width,channels,mbDim,Q,-255, -128);
            intraEncodedFrame = [encodedDC(:);encodedAC(:)];
        else
            [ycbcrDecodedFrame,intraEncodedFrame] = IntraEncodeFrame(ycbcrCurrentFrame,intra_binary_tree, intra_bin_code, intra_codelengths, Q,ycbcrLowerbound);
        end
        psnrs(1) = calculatePSNR(8,currentFrame,ictYCbCr2RGB(ycbcrDecodedFrame));
        bitrates(1) = calculateBitrate(currentFrame,intraEncodedFrame);
        ycbcr_reference_frame_0 = ycbcrDecodedFrame;
    elseif tags{i} == 'P'
        %% P FRAMES MOTION ESTIMATION
        [ycbcr_predicted_frame,motionMatrix,contor]=InterEncodeFrame(mbDim,mvSearchRange,ycbcrCurrentFrame,ycbcr_reference_frame_0,isMVFEnabled,isHPEnabled);
        accumulated_contor = accumulated_contor + contor;
        %% ERROR CALCULATION
        ycbcr_prediction_error_frame=ycbcrCurrentFrame-ycbcr_predicted_frame;
        
        %% INTRA CODING OF ERROR FRAME
        if isCSEnabled
            [intraEncodedY,intraEncodedCb,intraEncodedCr, nrYsymbols,nrCbSymbols,nrCrSymbols] = IntraEncode_chr_sub(ycbcr_prediction_error_frame, mbDim, Q, inter_bin_code_ef, inter_codelengths_ef, eFLowerbound);
            ycbcr_decoded_error_frame=IntraDecode_chr_sub(intraEncodedY,intraEncodedCb,intraEncodedCr, nrYsymbols,nrCbSymbols,nrCrSymbols, inter_binary_tree_ef, width, mbDim, Q, eFLowerbound);
            huffman_error_stream = [ intraEncodedY(:) ; intraEncodedCb(:) ; intraEncodedCr(:)];
        else
            [ycbcr_decoded_error_frame,huffman_error_stream]=IntraEncodeFrame(ycbcr_prediction_error_frame,inter_binary_tree_ef,inter_bin_code_ef,inter_codelengths_ef,Q,eFLowerbound);
        end
        
        %% HUFFMAN CODING OF MV
        if isDEMVEnabled
            motionMatrix = EncodeMMDifferentially(motionMatrix);
        end
        
        [huffmanMv]=enc_huffman_new(power(2,isHPEnabled)*motionMatrix+power(2,isHPEnabled)*DEMVCoeff*mvSearchRange+1,inter_bin_code_mv,inter_codelengths_mv);
        
        %% HUFFMAN DECODING OF MV
        decodedMv=dec_huffman_new(huffmanMv,inter_binary_tree_mv,max(size(motionMatrix(:))))-DEMVCoeff*power(2,isHPEnabled)*mvSearchRange-1;
        decodedMv=decodedMv';
        decoded_mv_01 = decodedMv(1:36*44);
        decoded_mv_02 = decodedMv(36*44+1:2*36*44);
        reshaped_mv(:,1) = decoded_mv_01;
        reshaped_mv(:,2) = decoded_mv_02;
        if isDEMVEnabled
            reshaped_mv = DecodeMMDifferentially(reshaped_mv);
        end
        reshaped_mv = reshaped_mv ./ power(2,isHPEnabled);
        
        %% MOTION COMPENSATION
        ycbcr_predicted_frame = MotionCompensation(ycbcr_reference_frame_0,reshaped_mv,mbDim,isHPEnabled);
        ycbcr_recovered_frame = ycbcr_predicted_frame + ycbcr_decoded_error_frame;
        
        %% PERFORMANCE ANALYSIS
        psnrs(i) = calculatePSNR(8,currentFrame,ictYCbCr2RGB(ycbcr_recovered_frame));
        bitrates(i) = calculateInterErrorBitrate(currentFrame,0,[huffman_error_stream ; huffmanMv]);
        if isGOPEnabled
            ycbcr_reference_frame_1=ycbcr_recovered_frame;
        else
            ycbcr_reference_frame_0=ycbcr_recovered_frame;
        end
    elseif tags{i} == 'B'
        %% B FRAMES MOTION ESTIMATION
        [ycbcr_predicted_frame,motionMatrix,contor]=BidirectionalInterEncodeFrame(mbDim,mvSearchRange,ycbcr_reference_frame_1,ycbcrCurrentFrame,ycbcr_reference_frame_0,isMVFEnabled,isHPEnabled);
        accumulated_contor = accumulated_contor + contor;
        %% ERROR CALCULATION
        ycbcr_prediction_error_frame=ycbcrCurrentFrame-ycbcr_predicted_frame;
        
        %% INTRA CODING OF ERROR FRAME
        if isCSEnabled
            [intraEncodedY,intraEncodedCb,intraEncodedCr, nrYsymbols,nrCbSymbols,nrCrSymbols] = IntraEncode_chr_sub(ycbcr_prediction_error_frame, mbDim, 4+Q, inter_b_bin_code_ef, inter_b_codelengths_ef, eFLowerbound);
            ycbcr_decoded_error_frame=IntraDecode_chr_sub(intraEncodedY,intraEncodedCb,intraEncodedCr, nrYsymbols,nrCbSymbols,nrCrSymbols, inter_b_binary_tree_ef, width, mbDim, 4+Q, eFLowerbound);
            huffman_error_stream = [ intraEncodedY(:) ; intraEncodedCb(:) ; intraEncodedCr(:)];
        else
            [ycbcr_decoded_error_frame,huffman_error_stream]=IntraEncodeFrame(ycbcr_prediction_error_frame,inter_b_binary_tree_ef,inter_b_bin_code_ef,inter_b_codelengths_ef,4+Q,eFLowerbound);
        end
        
        %% HUFFMAN CODING OF MV
        
        if isDEMVEnabled
            motionMatrix(:,1:2) = EncodeMMDifferentially(motionMatrix(:,1:2));
        end

        [huffmanMv]=enc_huffman_new(power(2,isHPEnabled)*motionMatrix(:,1:2)+DEMVCoeff*power(2,isHPEnabled)*mvSearchRange+1,inter_b_bin_code_mv,inter_b_codelengths_mv);

        mm_length = motionMatrix(:,1:2);
        mm_length = length(mm_length(:));
        %% DECODING
        decodedMv = dec_huffman_new(huffmanMv,inter_b_binary_tree_mv,mm_length)-DEMVCoeff*power(2,isHPEnabled)*mvSearchRange-1;
        decodedMv=decodedMv';
        decoded_mv_01 = decodedMv(1:36*44);
        decoded_mv_02 = decodedMv(36*44+1:2*36*44);
        reshaped_mv(:,1) = decoded_mv_01;
        reshaped_mv(:,2) = decoded_mv_02;
        reshaped_mv(:,3) = motionMatrix(:,3);
        if isDEMVEnabled
            reshaped_mv(:,1:2) = DecodeMMDifferentially(reshaped_mv(:,1:2));
        end

        reshaped_mv(:,1:2) = reshaped_mv(:,1:2) ./ power(2,isHPEnabled) ;

        %% MOTION COMPENSATION
        ycbcr_predicted_frame = compensatemotionbidirectionally(ycbcr_reference_frame_1,ycbcr_reference_frame_0,reshaped_mv, mbDim,isHPEnabled);
        ycbcr_recovered_frame = ycbcr_predicted_frame + ycbcr_decoded_error_frame;
        
        psnrs(i) = calculatePSNR(8,currentFrame,ictYCbCr2RGB(ycbcr_recovered_frame));
        bitrates(i) = calculateInterErrorBitrate(currentFrame,motionMatrix(:,3),[huffman_error_stream ; huffmanMv]);
        if i + 1 <= sequenceLength
            if tags{i+1} == 'P'
                ycbcr_reference_frame_0 = ycbcr_reference_frame_1;
            end
        end
    end
    clc
    fprintf('Image loading time: %fs.\n',image_loading_duration);
    progressBar = strcat(progressBar,progressMarker);
    clear current_progress_bar
    if i < 21
        current_progress_bar = strcat(progressBar,'>\n');
    else
        current_progress_bar = strcat(progressBar,'|\n');
    end
    fprintf(current_progress_bar);
    progress = 100*i/21;
    fprintf('%f%%\n',progress);
    frame_processing_duration = cputime - sub_start;
    fprintf('Frame processing time: %fs.\n',frame_processing_duration);
    inter_processing_duration = cputime - inter_start;
    fprintf('Process duration: %fs.\n',inter_processing_duration);
    fprintf('Accumulated operations: %d.\n',accumulated_contor);
end
mean_bitrate = mean(bitrates);
mean_psnr = mean(psnrs);
fprintf('Mean bit rate: %fbpp.\n',mean_bitrate);
fprintf('Mean PSNR: %fdB.\n',mean_psnr);
end