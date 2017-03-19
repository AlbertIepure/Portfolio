%% Huffman table training for P frames
% 
% This function generates the Huffman table necessaries for a video coder
% for inter prediction with P frames using the motion sequences:
%
% "akiyo"
% "coastguard"
% "foreman"
% "news"
% "silent"
%
function[] = trainInterHuffmanTable(Q)
    %% Variable declaration
    directory_path = 'data/images/';
    file_extension = '.bmp';
    file_00 = 'akiyo';
    file_01 = 'coastguard';
    file_02 = 'foreman';
    file_03 = 'news';
    file_04 = 'silent';
    startOfSequence = 20;
    endOfSequence = 21;
    mbDim = 8;
    mvSearchRange = 4;
    intraAccummulatedMvHistogram = 0;
    intraAccummulatedEfHistogram = 0;
    intraAccummulatedDemvHistogram = 0;
    intraAccummulatedHpmvHistogram = 0;
    intraAccummulatedHpefHistogram = 0;
    intraCsAccummulatedEfHistogram = 0;
    intraAccummulatedDeHpmvHistogram = 0;
    %% 
    % Read the first two frames of each sequence. Perform motion estimation
    % and obtain motion vectors and error images. Calculate and accumulate
    % the statistics of each mv and each error image and finally generate
    % common Huffman table and store it.
    start_time = cputime;
    for i = 0:4
        switch i
            case 0
                for j = startOfSequence : endOfSequence
                    image_index = num2str(j,'%04d');
                    file_path = [directory_path file_00 image_index file_extension];
                    sequence{j - 19} = ictRGB2YCbCr(double(imread(file_path)));
                end
                [intraMvHistogram,intraEfHistogram,intraDeMvHistogram,intraHpMvHistogram,intraHpEfHistogram,intraCsEfHistogram,intraDeHpMvHistogram,~] = GenerateStatistics(mbDim,Q,mvSearchRange,sequence{2},sequence{1});
                intraAccummulatedMvHistogram = intraAccummulatedMvHistogram + intraMvHistogram;
                intraAccummulatedEfHistogram = intraAccummulatedEfHistogram + intraEfHistogram;
                intraAccummulatedDemvHistogram = intraAccummulatedDemvHistogram + intraDeMvHistogram;
                intraAccummulatedHpmvHistogram = intraAccummulatedHpmvHistogram + intraHpMvHistogram;
                intraAccummulatedHpefHistogram = intraAccummulatedHpefHistogram + intraHpEfHistogram;
                intraCsAccummulatedEfHistogram = intraCsAccummulatedEfHistogram + intraCsEfHistogram;
                intraAccummulatedDeHpmvHistogram = intraAccummulatedDeHpmvHistogram + intraDeHpMvHistogram;
            case 1
                for j = startOfSequence : endOfSequence
                    image_index = num2str(j,'%04d');
                    file_path = [directory_path file_01 image_index file_extension];
                    sequence{j - 19} = ictRGB2YCbCr(double(imread(file_path)));
                end
                [intraMvHistogram,intraEfHistogram,intraDeMvHistogram,intraHpMvHistogram,intraHpEfHistogram,intraCsEfHistogram,intraDeHpMvHistogram,~] = GenerateStatistics(mbDim,Q,mvSearchRange,sequence{2},sequence{1});
                intraAccummulatedMvHistogram = intraAccummulatedMvHistogram + intraMvHistogram;
                intraAccummulatedEfHistogram = intraAccummulatedEfHistogram + intraEfHistogram;
                intraAccummulatedDemvHistogram = intraAccummulatedDemvHistogram + intraDeMvHistogram;
                intraAccummulatedHpmvHistogram = intraAccummulatedHpmvHistogram + intraHpMvHistogram;
                intraAccummulatedHpefHistogram = intraAccummulatedHpefHistogram + intraHpEfHistogram;
                intraCsAccummulatedEfHistogram = intraCsAccummulatedEfHistogram + intraCsEfHistogram;
                intraAccummulatedDeHpmvHistogram = intraAccummulatedDeHpmvHistogram + intraDeHpMvHistogram;
            case 2
                for j = startOfSequence : endOfSequence
                    image_index = num2str(j,'%04d');
                    file_path = [directory_path file_02 image_index file_extension];
                    sequence{j - 19} = ictRGB2YCbCr(double(imread(file_path)));
                end
                [intraMvHistogram,intraEfHistogram,intraDeMvHistogram,intraHpMvHistogram,intraHpEfHistogram,intraCsEfHistogram,intraDeHpMvHistogram,~] = GenerateStatistics(mbDim,Q,mvSearchRange,sequence{2},sequence{1});
                intraAccummulatedMvHistogram = intraAccummulatedMvHistogram + intraMvHistogram;
                intraAccummulatedEfHistogram = intraAccummulatedEfHistogram + intraEfHistogram;
                intraAccummulatedDemvHistogram = intraAccummulatedDemvHistogram + intraDeMvHistogram;
                intraAccummulatedHpmvHistogram = intraAccummulatedHpmvHistogram + intraHpMvHistogram;
                intraAccummulatedHpefHistogram = intraAccummulatedHpefHistogram + intraHpEfHistogram;
                intraCsAccummulatedEfHistogram = intraCsAccummulatedEfHistogram + intraCsEfHistogram;
                intraAccummulatedDeHpmvHistogram = intraAccummulatedDeHpmvHistogram + intraDeHpMvHistogram;
            case 3
                for j = startOfSequence : endOfSequence
                    image_index = num2str(j,'%04d');
                    file_path = [directory_path file_03 image_index file_extension];
                    sequence{j - 19} = ictRGB2YCbCr(double(imread(file_path)));
                end
                [intraMvHistogram,intraEfHistogram,intraDeMvHistogram,intraHpMvHistogram,intraHpEfHistogram,intraCsEfHistogram,intraDeHpMvHistogram,~] = GenerateStatistics(mbDim,Q,mvSearchRange,sequence{2},sequence{1});
                intraAccummulatedMvHistogram = intraAccummulatedMvHistogram + intraMvHistogram;
                intraAccummulatedEfHistogram = intraAccummulatedEfHistogram + intraEfHistogram;
                intraAccummulatedDemvHistogram = intraAccummulatedDemvHistogram + intraDeMvHistogram;
                intraAccummulatedHpmvHistogram = intraAccummulatedHpmvHistogram + intraHpMvHistogram;
                intraAccummulatedHpefHistogram = intraAccummulatedHpefHistogram + intraHpEfHistogram;
                intraCsAccummulatedEfHistogram = intraCsAccummulatedEfHistogram + intraCsEfHistogram;
                intraAccummulatedDeHpmvHistogram = intraAccummulatedDeHpmvHistogram + intraDeHpMvHistogram;
            case 4
                for j = startOfSequence : endOfSequence
                    image_index = num2str(j,'%04d');
                    file_path = [directory_path file_04 image_index file_extension];
                    sequence{j - 19} = ictRGB2YCbCr(double(imread(file_path)));
                end
                [intraMvHistogram,intraEfHistogram,intraDeMvHistogram,intraHpMvHistogram , intraHpEfHistogram,intraCsEfHistogram,intraDeHpMvHistogram,~] = GenerateStatistics(mbDim,Q,mvSearchRange,sequence{2},sequence{1});
                intraAccummulatedMvHistogram = intraAccummulatedMvHistogram + intraMvHistogram;
                intraAccummulatedEfHistogram = intraAccummulatedEfHistogram + intraEfHistogram;
                intraAccummulatedDemvHistogram = intraAccummulatedDemvHistogram + intraDeMvHistogram;
                intraAccummulatedHpmvHistogram = intraAccummulatedHpmvHistogram + intraHpMvHistogram;
                intraAccummulatedHpefHistogram = intraAccummulatedHpefHistogram + intraHpEfHistogram;
                intraCsAccummulatedEfHistogram = intraCsAccummulatedEfHistogram + intraCsEfHistogram;
                intraAccummulatedDeHpmvHistogram = intraAccummulatedDeHpmvHistogram + intraDeHpMvHistogram;
        end
    end
    %% INTER FULL PEL
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%% INTER FULL PEL %%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    intra_accummulated_mv_sum = sum(sum(intraAccummulatedMvHistogram));
    mv_histogram = intraAccummulatedMvHistogram / intra_accummulated_mv_sum;
    [inter_binary_tree_mv, inter_huff_code_mv, inter_bin_code_mv, inter_codelengths_mv] = buildHuffman(mv_histogram);
    bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_binary_tree_mv_00.mat',49+5,Q);
    save(bt_path, 'inter_binary_tree_mv');
    hc_path = addQ2Path('video_codec_comb/huffman_tables/inter_huff_code_mv_00.mat',47+5,Q);
    save(hc_path, 'inter_huff_code_mv');
    bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_bin_code_mv_00.mat',46+5,Q);
    save(bc_path, 'inter_bin_code_mv');
    cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_codelengths_mv_00.mat',49+5,Q);
    save(cl_path, 'inter_codelengths_mv');
    intra_accummulated_ef_sum = sum(sum(intraAccummulatedEfHistogram));
    ef_histogram = intraAccummulatedEfHistogram / intra_accummulated_ef_sum;
    [inter_binary_tree_ef, inter_huff_code_ef, inter_bin_code_ef, inter_codelengths_ef] = buildHuffman(ef_histogram);
    bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_binary_tree_ef_00.mat',49+5,Q);
    save(bt_path, 'inter_binary_tree_ef');
    hc_path = addQ2Path('video_codec_comb/huffman_tables/inter_huff_code_ef_00.mat',47+5,Q);
    save(hc_path, 'inter_huff_code_ef');
    bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_bin_code_ef_00.mat',46+5,Q);
    save(bc_path, 'inter_bin_code_ef');
    cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_codelengths_ef_00.mat',49+5,Q);
    save(cl_path, 'inter_codelengths_ef');
    end_time = cputime - start_time;
    fprintf('Inter Huffman table training execution time equals: %d seconds.\n',end_time);
    %% INTER HALF PEL
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%% INTER HALF PEL %%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    intra_accummulated_hpmv_sum = sum(sum(intraAccummulatedHpmvHistogram));
    mv_histogram = intraAccummulatedHpmvHistogram / intra_accummulated_hpmv_sum;
    [inter_binary_tree_mv, inter_huff_code_mv, inter_bin_code_mv, inter_codelengths_mv] = buildHuffman(mv_histogram);
    bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_binary_tree_hpmv_00.mat',49+5+2,Q);
    save(bt_path, 'inter_binary_tree_mv');
    hc_path = addQ2Path('video_codec_comb/huffman_tables/inter_huff_code_hpmv_00.mat',47+5+2,Q);
    save(hc_path, 'inter_huff_code_mv');
    bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_bin_code_hpmv_00.mat',46+5+2,Q);
    save(bc_path, 'inter_bin_code_mv');
    cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_codelengths_hpmv_00.mat',49+5+2,Q);
    save(cl_path, 'inter_codelengths_mv');
    intra_accummulated_hpef_sum = sum(sum(intraAccummulatedHpefHistogram));
    ef_histogram = intraAccummulatedHpefHistogram / intra_accummulated_hpef_sum;
    [inter_binary_tree_ef, inter_huff_code_ef, inter_bin_code_ef, inter_codelengths_ef] = buildHuffman(ef_histogram);
    bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_binary_tree_hpef_00.mat',49+5+2,Q);
    save(bt_path, 'inter_binary_tree_ef');
    hc_path = addQ2Path('video_codec_comb/huffman_tables/inter_huff_code_hpef_00.mat',47+5+2,Q);
    save(hc_path, 'inter_huff_code_ef');
    bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_bin_code_hpef_00.mat',46+5+2,Q);
    save(bc_path, 'inter_bin_code_ef');
    cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_codelengths_hpef_00.mat',49+5+2,Q);
    save(cl_path, 'inter_codelengths_ef');
    end_time = cputime - start_time;
    fprintf('Inter Huffman table training execution time equals: %d seconds.\n',end_time);
    %% INTER DE FULL PEL
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%% INTER DE FULL PEL %%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    intra_accummulated_demv_sum = sum(sum(intraAccummulatedDemvHistogram));
    demv_histogram = intraAccummulatedDemvHistogram / intra_accummulated_demv_sum;
    [inter_binary_tree_mv, inter_huff_code_mv, inter_bin_code_mv, inter_codelengths_mv] = buildHuffman(demv_histogram);
    bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_binary_tree_demv_00.mat',49+5+2,Q);
    save(bt_path, 'inter_binary_tree_mv');
    hc_path = addQ2Path('video_codec_comb/huffman_tables/inter_huff_code_demv_00.mat',47+5+2,Q);
    save(hc_path, 'inter_huff_code_mv');
    bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_bin_code_demv_00.mat',46+5+2,Q);
    save(bc_path, 'inter_bin_code_mv');
    cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_codelengths_demv_00.mat',49+5+2,Q);
    save(cl_path, 'inter_codelengths_mv');
    %% INTER CS FULL PEL
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%% INTER CS FULL PEL %%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    intra_cs_accummulated_ef_sum = sum(sum(intraCsAccummulatedEfHistogram));
    cs_histogram = intraCsAccummulatedEfHistogram / intra_cs_accummulated_ef_sum;
    [inter_binary_tree_ef, inter_huff_code_ef, inter_bin_code_ef, inter_codelengths_ef] = buildHuffman(cs_histogram);
    bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_cs_binary_tree_ef_00.mat',49+5+2+2,Q);
    save(bt_path, 'inter_binary_tree_ef');
    hc_path = addQ2Path('video_codec_comb/huffman_tables/inter_cs_huff_code_ef_00.mat',47+5+2+2,Q);
    save(hc_path, 'inter_huff_code_ef');
    bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_cs_bin_code_ef_00.mat',46+5+2+2,Q);
    save(bc_path, 'inter_bin_code_ef');
    cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_cs_codelengths_ef_00.mat',49+5+2+2,Q);
    save(cl_path, 'inter_codelengths_ef');
    %% INTER FULL PEL
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%% INTER FULL PEL %%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    intraAccummulatedDeHpmvHistogramSum = sum(sum(intraAccummulatedDeHpmvHistogram));
    intraAccummulatedDeHpmvHistogram = intraAccummulatedDeHpmvHistogram / intraAccummulatedDeHpmvHistogramSum;
    [inter_binary_tree_mv, inter_huff_code_mv, inter_bin_code_mv, inter_codelengths_mv] = buildHuffman(intraAccummulatedDeHpmvHistogram);
    bt_path = addQ2Path('video_codec_comb/huffman_tables/inter_binary_tree_dehpmv_00.mat',49+5+2+2,Q);
    save(bt_path, 'inter_binary_tree_mv');
    hc_path = addQ2Path('video_codec_comb/huffman_tables/inter_huff_code_dehpmv_00.mat',47+5+2+2,Q);
    save(hc_path, 'inter_huff_code_mv');
    bc_path = addQ2Path('video_codec_comb/huffman_tables/inter_bin_code_dehpmv_00.mat',46+5+2+2,Q);
    save(bc_path, 'inter_bin_code_mv');
    cl_path = addQ2Path('video_codec_comb/huffman_tables/inter_codelengths_dehpmv_00.mat',49+5+2+2,Q);
    save(cl_path, 'inter_codelengths_mv');
end