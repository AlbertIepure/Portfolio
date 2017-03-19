function H = calc_entropy(pmf)

H = 0;
total_samples = sum(pmf);
pmf = pmf/total_samples;

for i=1:length(pmf)
    if pmf(i) ~= 0
        H = H - pmf(i)*log2(pmf(i));
    end
end
