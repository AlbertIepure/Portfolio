function mu = Esprit(X,d)
    
    [M,N] = size(X);
    [V,D] = SortedEig(X*X'/N);
    Us = V(:,1:d);
    J1 = [eye(M-1),zeros(M-1,1)];
    J2 = [zeros(M-1,1),eye(M-1)];    
    Y = pinv(J1*Us)*J2*Us;
    [T,D] = eig(Y);
    mu = sort(angle(diag(D)));
    
end
