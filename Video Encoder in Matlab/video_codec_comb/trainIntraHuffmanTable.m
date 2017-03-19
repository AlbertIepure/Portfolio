%% Huffman table training for I frames
% 
% This function generates the Huffman table necessaries for a video coder
% for intra prediction using the motion sequences:
%
% "akiyo"
% "coastguard"
% "foreman"
% "news"
% "silent"
%

function [] = trainIntraHuffmanTable(Q)
    start_time = cputime;
    directory_path = 'data/images/';
    file_extension = '.bmp';
    file_00 = 'akiyo';
    file_01 = 'coastguard';
    file_02 = 'foreman';
    file_03 = 'news';
    file_04 = 'silent';
    intraAccumulatedSum = 0;
    intraAccumulatedPdf = 0;
    intraChromaSubsamplingAccumulatedSum = 0;
    intraChromaSubsamplingAccumulattedPdf = 0;
    intraDCAccumulatedSum = 0;
    intraDCAccumulattedPdf = 0;
    intraACAccumulatedSum = 0;
    intraACAccumulattedPdf = 0;
    start_of_sequence = 20;
    end_of_sequence = 40;
    %% 
    % Read all the frames, calculate their histogram and accumulate the
    % calculate all the histograms while simultaneously generating a
    % summation of histogram bin values accross all the frames. Finally
    % produce the global pdf and generate the Huffman table.
    %
    for i = 0:4
        switch i
            case 0
                for j = start_of_sequence : end_of_sequence
                    image_index = num2str(j,'%04d');
                    file_path = [directory_path file_00 image_index file_extension];
                    [summation , pdf] = intraCodingStatistics(file_path,Q);
                    intraAccumulatedSum = intraAccumulatedSum + summation;
                    intraAccumulatedPdf = intraAccumulatedPdf + pdf;
                    [summation , pdf] = intrachromasubsamplingcodingstatistics(file_path,Q);
                    intraChromaSubsamplingAccumulatedSum = intraChromaSubsamplingAccumulatedSum + summation;
                    intraChromaSubsamplingAccumulattedPdf = intraChromaSubsamplingAccumulattedPdf + pdf;
                    [acSummation , acHistogram, dcSummation, dcHistogram] = intraacdcencodingstatistics(file_path,Q);
                    intraACAccumulatedSum = intraACAccumulatedSum + acSummation;
                    intraACAccumulattedPdf = intraACAccumulattedPdf + acHistogram;
                    intraDCAccumulatedSum = intraDCAccumulatedSum + dcSummation;
                    intraDCAccumulattedPdf = intraDCAccumulattedPdf + dcHistogram;
                end
            case 1
                for j = start_of_sequence : end_of_sequence
                    image_index = num2str(j,'%04d');
                    file_path = [directory_path file_01 image_index file_extension];
                    [summation , pdf] = intraCodingStatistics(file_path,Q);
                    intraAccumulatedSum = intraAccumulatedSum + summation;
                    intraAccumulatedPdf = intraAccumulatedPdf + pdf;
                    [summation , pdf] = intrachromasubsamplingcodingstatistics(file_path,Q);
                    intraChromaSubsamplingAccumulatedSum = intraChromaSubsamplingAccumulatedSum + summation;
                    intraChromaSubsamplingAccumulattedPdf = intraChromaSubsamplingAccumulattedPdf + pdf;
                    [acSummation , acHistogram, dcSummation, dcHistogram] = intraacdcencodingstatistics(file_path,Q);
                    intraACAccumulatedSum = intraACAccumulatedSum + acSummation;
                    intraACAccumulattedPdf = intraACAccumulattedPdf + acHistogram;
                    intraDCAccumulatedSum = intraDCAccumulatedSum + dcSummation;
                    intraDCAccumulattedPdf = intraDCAccumulattedPdf + dcHistogram;
                end
            case 2
                for j = start_of_sequence : end_of_sequence
                    image_index = num2str(j,'%04d');
                    file_path = [directory_path file_02 image_index file_extension];
                    [summation , pdf] = intraCodingStatistics(file_path,Q);
                    intraAccumulatedSum = intraAccumulatedSum + summation;
                    intraAccumulatedPdf = intraAccumulatedPdf + pdf;
                    [summation , pdf] = intrachromasubsamplingcodingstatistics(file_path,Q);
                    intraChromaSubsamplingAccumulatedSum = intraChromaSubsamplingAccumulatedSum + summation;
                    intraChromaSubsamplingAccumulattedPdf = intraChromaSubsamplingAccumulattedPdf + pdf;
                    [acSummation , acHistogram, dcSummation, dcHistogram] = intraacdcencodingstatistics(file_path,Q);
                    intraACAccumulatedSum = intraACAccumulatedSum + acSummation;
                    intraACAccumulattedPdf = intraACAccumulattedPdf + acHistogram;
                    intraDCAccumulatedSum = intraDCAccumulatedSum + dcSummation;
                    intraDCAccumulattedPdf = intraDCAccumulattedPdf + dcHistogram;
                end
            case 3
                for j = start_of_sequence : end_of_sequence
                    image_index = num2str(j,'%04d');
                    file_path = [directory_path file_03 image_index file_extension];
                    [summation , pdf] = intraCodingStatistics(file_path,Q);
                    intraAccumulatedSum = intraAccumulatedSum + summation;
                    intraAccumulatedPdf = intraAccumulatedPdf + pdf;
                    [summation , pdf] = intrachromasubsamplingcodingstatistics(file_path,Q);
                    intraChromaSubsamplingAccumulatedSum = intraChromaSubsamplingAccumulatedSum + summation;
                    intraChromaSubsamplingAccumulattedPdf = intraChromaSubsamplingAccumulattedPdf + pdf;
                    [acSummation , acHistogram, dcSummation, dcHistogram] = intraacdcencodingstatistics(file_path,Q);
                    intraACAccumulatedSum = intraACAccumulatedSum + acSummation;
                    intraACAccumulattedPdf = intraACAccumulattedPdf + acHistogram;
                    intraDCAccumulatedSum = intraDCAccumulatedSum + dcSummation;
                    intraDCAccumulattedPdf = intraDCAccumulattedPdf + dcHistogram;
                end
            case 4
                for j = start_of_sequence : end_of_sequence
                    image_index = num2str(j,'%04d');
                    file_path = [directory_path file_04 image_index file_extension];
                    [summation , pdf] = intraCodingStatistics(file_path,Q);
                    intraAccumulatedSum = intraAccumulatedSum + summation;
                    intraAccumulatedPdf = intraAccumulatedPdf + pdf;
                    [summation , pdf] = intrachromasubsamplingcodingstatistics(file_path,Q);
                    intraChromaSubsamplingAccumulatedSum = intraChromaSubsamplingAccumulatedSum + summation;
                    intraChromaSubsamplingAccumulattedPdf = intraChromaSubsamplingAccumulattedPdf + pdf;
                    [acSummation , acHistogram, dcSummation, dcHistogram] = intraacdcencodingstatistics(file_path,Q);
                    intraACAccumulatedSum = intraACAccumulatedSum + acSummation;
                    intraACAccumulattedPdf = intraACAccumulattedPdf + acHistogram;
                    intraDCAccumulatedSum = intraDCAccumulatedSum + dcSummation;
                    intraDCAccumulattedPdf = intraDCAccumulattedPdf + dcHistogram;
                end
        end
    end
    %% REGULAR SAMPLING
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%% REGULAR SAMPLING %%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    histogram = intraAccumulatedPdf / intraAccumulatedSum;
    [intra_binary_tree, intra_huffman_code, intra_bin_code, intra_codelengths] = buildHuffman(histogram);
    bt_path = addQ2Path('video_codec_comb/huffman_tables/intra_binary_tree_00.mat',46+5,Q);
    save(bt_path, 'intra_binary_tree');
    hc_path = addQ2Path('video_codec_comb/huffman_tables/intra_huff_code_00.mat',44+5,Q);
    save(hc_path, 'intra_huffman_code');
    bc_path = addQ2Path('video_codec_comb/huffman_tables/intra_bin_code_00.mat',43+5,Q);
    save(bc_path, 'intra_bin_code');
    cl_path = addQ2Path('video_codec_comb/huffman_tables/intra_codelengths_00.mat',46+5,Q);
    save(cl_path, 'intra_codelengths');
    %% CHROMA SUBSAMPLING
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%% CHROMA SUBSAMPLING %%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    histogram = intraChromaSubsamplingAccumulattedPdf / intraChromaSubsamplingAccumulatedSum;
    [intra_binary_tree, intra_huffman_code, intra_bin_code, intra_codelengths] = buildHuffman(histogram);
    bt_path = addQ2Path('video_codec_comb/huffman_tables/intra_cs_binary_tree_00.mat',47+5+2,Q);
    save(bt_path, 'intra_binary_tree');
    hc_path = addQ2Path('video_codec_comb/huffman_tables/intra_cs_huff_code_00.mat',45+5+2,Q);
    save(hc_path, 'intra_huffman_code');
    bc_path = addQ2Path('video_codec_comb/huffman_tables/intra_cs_bin_code_00.mat',44+5+2,Q);
    save(bc_path, 'intra_bin_code');
    cl_path = addQ2Path('video_codec_comb/huffman_tables/intra_cs_codelengths_00.mat',47+5+2,Q);
    save(cl_path, 'intra_codelengths');
    %% ACDC ENCODING
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%% ACDC ENCODING %%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    histogram = intraDCAccumulattedPdf / intraDCAccumulatedSum;
    [intra_binary_tree, intra_huffman_code, intra_bin_code, intra_codelengths] = buildHuffman(histogram);
    bt_path = addQ2Path('video_codec_comb/huffman_tables/intra_dc_binary_tree_00.mat',47+5+2,Q);
    save(bt_path, 'intra_binary_tree');
    hc_path = addQ2Path('video_codec_comb/huffman_tables/intra_dc_huff_code_00.mat',45+5+2,Q);
    save(hc_path, 'intra_huffman_code');
    bc_path = addQ2Path('video_codec_comb/huffman_tables/intra_dc_bin_code_00.mat',44+5+2,Q);
    save(bc_path, 'intra_bin_code');
    cl_path = addQ2Path('video_codec_comb/huffman_tables/intra_dc_codelengths_00.mat',47+5+2,Q);
    save(cl_path, 'intra_codelengths');
    end_time = cputime - start_time;
    histogram = intraACAccumulattedPdf / intraACAccumulatedSum;
    [intra_binary_tree, intra_huffman_code, intra_bin_code, intra_codelengths] = buildHuffman(histogram);
    bt_path = addQ2Path('video_codec_comb/huffman_tables/intra_ac_binary_tree_00.mat',47+5+2,Q);
    save(bt_path, 'intra_binary_tree');
    hc_path = addQ2Path('video_codec_comb/huffman_tables/intra_ac_huff_code_00.mat',45+5+2,Q);
    save(hc_path, 'intra_huffman_code');
    bc_path = addQ2Path('video_codec_comb/huffman_tables/intra_ac_bin_code_00.mat',44+5+2,Q);
    save(bc_path, 'intra_bin_code');
    cl_path = addQ2Path('video_codec_comb/huffman_tables/intra_ac_codelengths_00.mat',47+5+2,Q);
    save(cl_path, 'intra_codelengths');
    fprintf('Intra Huffman table training execution time equals: %d seconds.\n',end_time);
end