function pmf = stats_marg(ORIGINAL_image)

pmf = hist(ORIGINAL_image(:),-255:255);