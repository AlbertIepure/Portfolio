function Fcontrast = contrast(I)
%#codegen

n = 1/4; % for contrast, the best correlation btw the computed and observed parameter

[height,width] = size(I);
% [counts,graylevels]=imhist(I); % historgram 
% counts=counts/(height*width); % normalize the histogram
averagevalue=sum(I(:))/(height*width); % average value of the image
I_offset = double(I) - averagevalue; % compute the offset of each value from the mean
variance = sum(I_offset(:).^2)/(width*height); %compute the variance http://en.wikipedia.org/wiki/Variance
miu4 = sum(I_offset(:).^4)/(width*height); % compute the fourth moment: http://de.mathworks.com/help/stats/moment.html
% the kurtosis http://de.mathworks.com/help/stats/kurtosis.html is not
% computed any more because we would have to divide by sigma^4 and then
% multiply again. We perform the simplification on paper and we end up with
Fcontrast = variance/(miu4^n)/256; % normalize by maximum value