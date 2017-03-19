function Flinelikeness = linelikeness(I,theta,d)
% parfor j=1:10
%     linelikeness(j) = linelikeness3_mex(double(I),theta,j);
% end
% 
% Flinelikeness1 = sum(linelikeness(1:10));

n=16;

PDd=zeros(n,n,8); % Co-occurrence matrix structure with 8 directions  
[h,w]=size(I);

for i=1:h
    for j=1:w
        for k1=1:n
            for k2=1:n
                % We construct for each one of the eight possible
                % directions a co-occurence matrix whose element PDd(i,j)
                % is defined as the relative frequency with which two
                % neighboring cells separated by a distance d along the
                % edge direction occur on the image, one with the direction
                % code i and the other with the direction code j
                
                if (theta(i,j)>=(2*(k1-1)*pi/2/n) && theta(i,j)<((2*(k1-1)+1)*pi/2/n))
                    %Down direction
                    if i+d <=h
                        if (theta(i+d,j)>=(2*(k2-1)*pi/2/n) && theta(i+d,j)<((2*(k2-1)+1)*pi/2/n))
                            PDd(k1,k2,1)=PDd(k1,k2,1)+1;
                        end
                    end
                    
                    %Up Direction
                    if i-d >= 1
                        if (theta(i-d,j)>=(2*(k2-1)*pi/2/n) && theta(i-d,j)<((2*(k2-1)+1)*pi/2/n))
                            PDd(k1,k2,2)=PDd(k1,k2,2)+1;
                        end
                    end
                    
                    if j+d <= w
                        %Right direction
                        if (theta(i,j+d)>=(2*(k2-1)*pi/2/n) && theta(i,j+d)<((2*(k2-1)+1)*pi/2/n))
                            PDd(k1,k2,3)=PDd(k1,k2,3)+1;
                        end
                        
                        if i+d <= h
                            %Lower right direction
                            if (theta(i+d,j+d)>=(2*(k2-1)*pi/2/n) && theta(i+d,j+d)<((2*(k2-1)+1)*pi/2/n))
                                PDd(k1,k2,5)=PDd(k1,k2,5)+1;
                            end
                        end
                        
                        if i-d >= 1
                            %Upper right direction
                            if (theta(i-d,j+d)>=(2*(k2-1)*pi/2/n) && theta(i-d,j+d)<((2*(k2-1)+1)*pi/2/n))
                                PDd(k1,k2,6)=PDd(k1,k2,6)+1;
                            end
                        end
                    end
                    
                    if j-d >= 1
                        %Left direction
                        if (theta(i,j-d)>=(2*(k2-1)*pi/2/n) && theta(i,j-d)<((2*(k2-1)+1)*pi/2/n))
                            PDd(k1,k2,4)=PDd(k1,k2,4)+1;
                        end
                        
                        if i+d <= h
                            %Lower left direction
                            if (theta(i+d,j-d)>=(2*(k2-1)*pi/2/n) && theta(i+d,j-d)<((2*(k2-1)+1)*pi/2/n))
                                PDd(k1,k2,7)=PDd(k1,k2,7)+1;
                            end
                        end
                        
                        if i-d >= 1
                            % Upper left direction
                            if (theta(i-d,j-d)>=(2*(k2-1)*pi/2/n) && theta(i-d,j-d)<((2*(k2-1)+1)*pi/2/n))
                                PDd(k1,k2,8)=PDd(k1,k2,8)+1;
                            end
                        end
                    end
                end
            end
        end
    end
end

numerator=zeros(1,8);
denominator=zeros(1,8);

for k=1:8
    denominator(k) = sum(sum(PDd(:,:,k)));
    for i=1:n
        for j=1:n
            numerator(k) = numerator(k) + PDd(i,j,k)*cos((i-j)*2*pi/n);
        end
    end
end

l=numerator./denominator; % vector containing for each 45 deg direction the linelikeness value

Flinelikeness = sum(l);

% Flinelikeness = double(max(l));% I find taking the sum of linelikenesses for 
                                  % each direction more relevant for the 
                                  % linelikenesses of the image as a whole than
                                  % taking the maximum value