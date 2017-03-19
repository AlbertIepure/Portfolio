function[acSummation , acHistogram, dcSummation, dcHistogram] = intraacdcencodingstatistics(file_path,Q)
    frame = double(imread(file_path));
    ycbcr_frame = ictRGB2YCbCr(frame);
    [zeroRunCodedAC,DCDifferential] = preencodeintraprocessacdcencoding(ycbcr_frame,8, Q);
    acHistogram = hist(zeroRunCodedAC(:),-128:260);
    acSummation = sum(acHistogram);
    dcHistogram = hist(DCDifferential(:),-255:255);
    dcSummation = sum(dcHistogram);
end