function [Fcomplexity] = complexity(I,d)

% d - the neighborhood size
W = (2*d+1).^2;
[h,w] = size(I);
A_i = zeros(h,w);
n_squared = (h-2*d)*(w-2*d);
max_value = double(max(max(I(d+1:h-d,d+1:w-d)))); % within the region of interest
s_i = zeros(max_value+1,1); % +1 because we assume that in the window we have all values from 0 onwards
p = zeros(max_value+1,1); % probability of occurence of each gray-tone value

for i=d+1:h-d
    for j=d+1:w-d
        A_i(i,j) = (sum(sum(I(i-d:i+d,j-d:j+d)))- I(i,j))/(W-1);
    end
end 

I2 = ones(h,w).*256; % insert outside the region of interest values that are not to be found inside the interest region
I2(d+1:h-d,d+1:w-d)= I(d+1:h-d,d+1:w-d);

c=1;
for k=0:max_value
    [row,col] = find(I2==k);
    p(c) = numel(col)/n_squared;
    if isempty(col) 
        s_i(c) = 0;
    else
        for i=1:length(col)
            s_i(c) = s_i(c) + abs(double(I(row(i),col(i))) - A_i(row(i),col(i)));
        end
    end
    c = c + 1;
end

Fcomplexity = 0;
for i=0:max_value
    for j=0:max_value
        if p(i+1) ~= 0 && p(j+1) ~= 0
            Fcomplexity = Fcomplexity + abs(i-j)*(p(i+1)*s_i(i+1)+p(j+1)*s_i(j+1))/(n_squared*(p(i+1)+p(j+1))+realmin);
        end
    end
end


            
    
