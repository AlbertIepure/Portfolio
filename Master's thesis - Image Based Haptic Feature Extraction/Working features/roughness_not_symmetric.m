function Froughness = roughness_not_symmetric(I)
% Good theory:
% http://www.fp.ucalgary.ca/mhallbey/tutorial.htm
% In order to combine the information from these features in an optimal way, we train a classifier using human labeled images as ground truth.

%% Pre-processing part

%% Median filtering with a 3x3 window to remove noise
% I = medfilt2(I);

%% Histogram equalization to improve contrast
% I = histeq(I);

% Tryed to check against the example in Haralick's paper and they do not
% agree? What is to be done?
% A =[0 0 1 1; 0 0 1 1; 0 2 2 2; 2 2 3 3];
% P_H  = graycomatrix(A, 'NumLevels',4, 'offset', [0 1], 'Symmetric', false);
% P_V  = graycomatrix(A, 'NumLevels',4, 'offset', [-1 0], 'Symmetric', false);
% P_LD = graycomatrix(A, 'NumLevels',4, 'offset', [-1 -1], 'Symmetric', false);
% P_RD = graycomatrix(A, 'NumLevels',4, 'offset', [-1 1], 'Symmetric', false);

% I = [0 0 1 1; 0 0 1 1; 0 2 2 2; 2 2 3 3];
[Ny,Nx] = size(I);
Ng = 32;
% GLCM computation
P_H  = graycomatrix(I, 'NumLevels',Ng, 'GrayLimits', [], 'offset', [0 1], 'Symmetric', false); % 0°
R = 2*Ny*(Nx-1); % neighbroing resolution cell pairs
p_H = P_H./R; % normalization

P_V  = graycomatrix(I, 'NumLevels',Ng, 'GrayLimits', [], 'offset', [-1 0], 'Symmetric', false); % 90 °
R = 2*Nx*(Ny-1); % neighbroing resolution cell pairs
p_V = P_V./R; % normalization

P_LD = graycomatrix(I, 'NumLevels',Ng, 'GrayLimits', [], 'offset', [-1 -1], 'Symmetric', false); % 135°
R = 2*(Nx-1)*(Ny-1); % neighbroing resolution cell pairs
p_LD = P_LD./R; % normalization

P_RD = graycomatrix(I, 'NumLevels',Ng, 'GrayLimits', [], 'offset', [-1 1], 'Symmetric', false); % 45°
R = 2*(Ny-1)*(Nx-1); % neighbroing resolution cell pairs
p_RD = P_RD./R; % normalization

p(:,:,1) = p_H;
p(:,:,2) = p_V;
p(:,:,3) = p_LD;
p(:,:,4) = p_RD;

P(:,:,1) = P_H;
P(:,:,2) = P_V;
P(:,:,3) = P_LD;
P(:,:,4) = P_RD;

% TO DO: implement rotation invariance

% compute Angular Second Moment; 
% Returns the sum of squared elements in the GLCM.
% Range = [0 1]
% Energy is 1 for a constant image.
f1 = zeros(1,4);
for direction = 1:4
        for i=1:Ng
            for j=1:Ng
                f1(direction) = f1(direction) +  p(i,j,direction)^2;
            end
        end
end
W1 = mean(f1);

% compute Contrast W2
% implemented as it is in Haralick
% Returns a measure of the intensity contrast between a pixel and its neighbor over the whole image.
% Range = [0 (size(GLCM,1)-1)^2] 
% Contrast is 0 for a constant image.
f2 = zeros(1,4);
for direction = 1:4
    for n=0:Ng-1
        s = 0;
        for i=1:Ng
            for j=1:Ng
                if abs(i-j)==n
                    s = s + p(i,j,direction);
                end
            end
        end
        f2(direction) = f2(direction) + double(n*n)*s;
    end
end
W2 = mean(f2);

% Compute correlation W3
% Compute Inverse Difference Moment (Homogeneity) W5: see doc graycoprops
f3 = zeros(1,4);
f5 = zeros(1,4);        
for direction = 1:4
    stats = graycoprops(P(:,:,direction));
    f3(direction) = stats.Correlation;
    f5(direction) = stats.Homogeneity;
end
W3 = mean(f3);
W5 = mean(f5);

% Compute Inverse Difference Moment W5
% f5 = zeros(1,4);
% for direction=1:4
%     for i=1:Ng
%         for j=1:Ng
%             f5(direction) = f5(direction) + p(i,j,direction)/double(1+(i-j)^2);
%         end
%     end
% end
% W5 = mean(f5);

% Compute sum of squares: variance W4
f4 = zeros(1,4);
for direction=1:4
    mean_p = mean(p(i,j,direction));
    for i=1:Ng
        for j=1:Ng
            f4(direction) = f4(direction) + ((i-mean_p)^2)*p(i,j,direction);
        end
    end
end
W4 = mean(f4);

% Compute sum average W6
f6 = zeros(1,4);
p_x_plus_y = zeros(1,2*Ng,4);
for direction=1:4
    for i=1:Ng
        for j=1:Ng
            p_x_plus_y(1,i+j,direction) = p_x_plus_y(1,i+j,direction)  + p(i,j,direction);
        end
    end
    
    for i=2:2*Ng
        f6(direction) = f6(direction) + i * p_x_plus_y(1,i,direction);
    end
end
W6 = mean(f6);

% Compute sum entropy W8
f8 = zeros(1,4);
for direction=1:4
    for i=2:2*Ng
        f8(direction) = f8(direction) - p_x_plus_y(1,i,direction) * log(p_x_plus_y(1,i,direction) + realmin); %because some probabilities may be 0 and log(0) is not defined
    end
end
W8 = mean(f8);

% Compute sum entropy W7
f7 = zeros(1,4);
for direction=1:4
    for i=2:2*Ng
        f7(direction) = f7(direction) + ((i - f8(direction))^2) * p_x_plus_y(1,i,direction); 
    end
end
W7 = mean(f7);

% Compute Entropy W9
f9 = zeros(1,4);
for direction=1:4
    for i=1:Ng
        for j=1:Ng
            f9(direction) = f9(direction) - p(i,j,direction) * log(p(i,j,direction)+realmin); %because some probabilities may be 0 and log(0) is not defined
        end
    end
end
W9 = mean(f9);

% Compute difference variance W10
p_x_minus_y = zeros(1,Ng,4);
f10 = zeros(1,4);
for direction=1:4
    for i=1:Ng
        for j=1:Ng
            p_x_minus_y(1,abs(i-j)+1,direction) = p_x_minus_y(1,abs(i-j)+1,direction) + p(i,j,direction);
        end
    end
    f10(direction) = var(p_x_minus_y(1,:,direction));
end
W10 = mean(f10); % a few orders of magnitude smaller than in the paper

% Compute difference entropy W11
f11 = zeros(1,4);
for direction=1:4
    for i=1:Ng
        f11(direction) = f11(direction) - p_x_minus_y(1,i,direction) * log(p_x_minus_y(1,i,direction)+realmin); %because some probabilities may be 0 and log(0) is not defined
    end
end
W11 = mean(f11);

% Compute Information Measures of Correlation
f12 = zeros(1,4);
f13 = zeros(1,4);
p_x = zeros(1,Ng,4);
p_y = zeros(1,Ng,4);
HX = zeros(1,4);
HY = zeros(1,4);
HXY = zeros(1,4);
HXY1 = zeros(1,4);
HXY2 = zeros(1,4);
for direction=1:4
    p_x(1,:,direction) = sum(p(:,:,direction)'); % summing the rows of p(i,j)
    p_y(1,:,direction)  = sum(p(:,:,direction)); % summing the columns of p(i,j)
    for i=1:Ng
        HX(direction) = HX(direction) - p_x(1,i,direction)  * log(p_x(1,i,direction) + realmin); %because some probabilities may be 0 and log(0) is not defined
        HY(direction) = HY(direction) - p_y(1,i,direction) * log(p_y(1,i,direction) + realmin); %because some probabilities may be 0 and log(0) is not defined
        HXY(direction) = HXY(direction) - p(i,j,direction) * log(p(i,j,direction) + realmin); %because some probabilities may be 0 and log(0) is not defined
        HXY1(direction) = HXY1(direction) - p(i,j,direction) * log(p_x(1,i,direction) * p_y(1,j,direction) + realmin); %because some probabilities may be 0 and log(0) is not defined
        HXY2(direction) = HXY2(direction) - p_x(1,i,direction) * p_y(1,j,direction) * log(p_x(1,i,direction) * p_y(1,j,direction) + realmin); %because some probabilities may be 0 and log(0) is not defined
    end
    f12(direction) = (HXY(direction) - HXY1(direction))/max(HX(direction),HY(direction));
    f13(direction) = abs(sqrt(1 - exp(-2.0 * (HXY2(direction) - HXY(direction))))); % complex number when the argument of sqrt is negative
end
W12 = mean(f12);
W13 = mean(f13);

% Compute Maximal Correlation Coefficient W14
f14 = zeros(1,4);
Q = zeros(Ng,Ng,4);
for direction=1:4
    for i=1:Ng
        for j=1:Ng
            for k=1:Ng
                Q(i,j,direction) = Q(i,j,direction) + p(i,k,direction) * p(j,k,direction) / (p_x(1,i,direction) * p_y(1,k,direction) + realmin);
            end
        end
    end
    E = eig(Q(:,:,direction)); % the vector containing the eigenvalues of Q is already sorted
    f14(direction) = (abs(E(2)))^0.5; % second largest eigenvalue of Q; take the abosulte value because it might be complex
end
W14 = mean(f14);

% The coefficients obtained after the multivariate normal regression
% b =
% [-933.142907147952;-5.64757884961132;141.078908384596;-1.32711465973449;-521.768450280896;2.20481733631722;0.323508633611593;232.522692883643;-289.618829511173;22702.0192081011;444.572769335420;205.405235656382;9.83166166835886;-32.4327588198705];
% for all Ws, not necessarily optimal
% b = [0.445531801720647; -15.0054801749075; 74.2106748425976]; % for W6, W8, W14 which yield the highest chi^2 distance among all possible combinations of 14 coefficients
% b = b';

% Because some of the Ws do not have the same order of magnitude as in the
% reference paper (W2 is computed another way than in Haralick and W10 is
% much smaller and has the opposite behavior than the one described in the
% paper) I have decided to compute all parameters as described in haralick
% and to perform my own multivariate regression. The results are good
% enough

Froughness = [W1 W2 W3 W4 W5 W6 W7 W8 W9 W10 W11 W12 W13 W14];
% Froughness = 0.152272366037799*W2 -0.0000140839234059239*W2.^2 -2492.85049132867*W5 + 1986.74243105396*W5^2 + 349.663520448993*W9 -68.6882046516643*W9^2 + 4.64763048906397*W9^3 -3291.4503874257*W10 -414.24217940546*W11 + 290.539138806402*W11^2 -71.836977135144*W11^3;
% Froughness = sum(b .* [W1 W2 W3 W4 W5 W6 W7 W8 W9 W10 W11 W12 W13 W14]);
% Froughness = sum(b .* [W6 W8 W14]);

%%%%%%%%%%%%% For magnified version
% b = [-434.705765972903;46.2926003229599;1041.07234531574;2.51958155705609;-1790.51115488353;-3.09180804239419;-0.635409307433119;574.878992661834;-663.782401507361;33624.1389994378;593.482782074706;-410.784494308232;0.489883271011758;-7.14972601783885];
% b = b';
% Froughness = sum(b .* [W1 W2 W3 W4 W5 W6 W7 W8 W9 W10 W11 W12 W13 W14]);