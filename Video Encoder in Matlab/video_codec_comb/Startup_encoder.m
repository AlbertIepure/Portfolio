clc
clear all
close all

path(path,'<path>/video_codec_comb/analysis');       
path(path,'<path>/video_codec_comb/encoder');    
path(path,'<path>/video_codec_comb/data'); 
path(path,'<path>/video_codec_comb/data/images');    
path(path,'<path>/video_codec_comb/decoder');     
path(path,'<path>/video_codec_comb/huffman_tables');

PerformEncoding(false,0.5,false,false,false,false,false,true);