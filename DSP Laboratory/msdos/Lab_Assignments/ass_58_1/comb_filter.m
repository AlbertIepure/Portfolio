function [numerator,denominator] = comb_filter(M)
    numerator = (1/M).*ones(1,M);
    denominator = 1;
end