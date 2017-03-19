function [V,D] = SortedEig(M)

    [V,D] = eig(M);
    ds = diag(D);
    [ds,idx] = sort(abs(ds));
    idx = idx(end:-1:1);
    V = V(:,idx);
    D = diag(ds(idx));

end