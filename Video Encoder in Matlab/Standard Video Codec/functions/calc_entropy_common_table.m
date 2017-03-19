function H = calc_entropy_common_table(pmf, pmf_merged)

H = 0;
total_samples = sum(pmf);
pmf = pmf/total_samples;
total_samples = sum(pmf_merged);
pmf_merged = pmf_merged/total_samples;

for i=1:length(pmf_merged)
    if pmf(i) ~= 0
        H = H - pmf(i)*log2(pmf_merged(i));
    end
end
