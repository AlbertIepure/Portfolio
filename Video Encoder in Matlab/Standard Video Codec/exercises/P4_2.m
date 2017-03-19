clear all
close all
clc
path (path, 'E:/IVC_labs_starting_point/functions');

M = 8; %order of the DCT

D = dctmtx(M);
v = ZigZag8x8(D);
rec_D = DeZigZag8x8(v);

diff = rec_D - D;