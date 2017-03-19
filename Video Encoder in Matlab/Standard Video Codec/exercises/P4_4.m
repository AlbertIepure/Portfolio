clear all
close all
clc
path (path, 'F:/IVC_labs_starting_point/functions');

% sequence = [4 4 4 0 0 0 0 0 9];
% sequence = [ 0 0 8 2 2];
% sequence = [5 6];
% sequence = [ 0 0 8 2 0 0];
sequence = [185 3 1 0 1 1 1 -1 0 1 0 1 1 0 -3 2 -1 0 0 0 0 0 0 1 -1 -1 0 -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0];

tic
zero_run_code = ZeroRunEnc(sequence);
toc

tic
decoded_sequence = ZeroRunDec(zero_run_code);
toc
isequal(sequence,decoded_sequence)