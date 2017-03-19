function Fcoarseness = coarseness (I)
%#codegen
t = 0.9;
k_max = 6;
[height,width] = size(I);
A = zeros(height,width,k_max);
E_h = zeros(height,width,k_max);
E_v = zeros(height,width,k_max);
E_dr = zeros(height,width,k_max);
E_dl = zeros(height,width,k_max);
S = zeros(height,width);

for x=1:height
    for y=1:width
        for k=1:k_max
            %% as in the paper
            %% Step 1
            y_pos = y - 2^(k-1) :y + 2^(k-1) - 1;
            y_pos = y_pos(y_pos>0 & y_pos<width); % make sure it's not out of bounds
            x_pos = x - 2^(k-1) :x + 2^(k-1) - 1;
            x_pos = x_pos(x_pos>0 & x_pos<height); % make sure it's not out of bounds
            %% Q: What happens at the boundaries?
            
            range = I(x_pos,y_pos);
            A(x,y,k) = sum(range(:))/2.^(2*k);    
        end
    end
end

%% Step 2
for x=1:height
    for y=1:width
        for k=1:k_max
            %% Q: What happens at the boundaries?
            if x+2^(k-1) <= height % make sure it's not out of bounds
                term_1 = A(x+2.^(k-1),y,k);
            else
                term_1 = 0; 
            end
            
            if x-2^(k-1) >= 1 % make sure it's not out of bounds
                term_2 = A(x-2.^(k-1),y,k); 
            else
                term_2 = 0;
            end
            
            E_h(x,y,k) = abs(term_1 - term_2);
            
            if y+2^(k-1) <= width % make sure it's not out of bounds
                term_1 = A(x,y+2.^(k-1),k);
            else
                term_1 = 0;
            end
            
            if y-2^(k-1) >= 1 % make sure it's not out of bounds
                term_2 = A(x,y-2.^(k-1),k);
            else
                term_2 = 0;
            end
            
            E_v(x,y,k) = abs(term_1 - term_2);
            
            if x+2^(k-1) <= height && y+2^(k-1) <= width% make sure it's not out of bounds
                term_1 = A(x+2.^(k-1),y+2^(k-1),k);
            else
                term_1 = 0; 
            end
            
            if x-2^(k-1) >= 1 && y-2^(k-1) >= 1 % make sure it's not out of bounds
                term_2 = A(x-2.^(k-1),y-2^(k-1),k); 
            else
                term_2 = 0;
            end
            
            E_dr(x,y,k) = abs(term_1 - term_2);
            
            if x+2^(k-1) <= height && y-2^(k-1) >= 1 % make sure it's not out of bounds
                term_1 = A(x+2.^(k-1),y-2^(k-1),k);
            else
                term_1 = 0; 
            end
            
            if x-2^(k-1) >= 1 && y+2^(k-1) <= width % make sure it's not out of bounds
                term_2 = A(x-2.^(k-1),y+2^(k-1),k); 
            else
                term_2 = 0;
            end
            
            E_dl(x,y,k) = abs(term_1 - term_2);
            
            
        end
    end
end

%% Step 3
% for x=1:height
%     for y=1:width
%           % should we make sure that the max is unique!? 
%         [max_h,k_h] = max(E_h(x,y,:));
%         [max_v,k_v] = max(E_v(x,y,:));
%         if max_h > max_v
%             S(x,y) = 2.^k_h;
%         else
%             S(x,y) = 2.^k_v;
%         end
%     end
% end

for x=1:height
    for y=1:width
        % should we make sure that the max is unique!? 
        [max_h1,k_h1] = max(E_h(x,y,:));
        [max_v1,k_v1] = max(E_v(x,y,:));
        [max_dr,k_dr] = max(E_dr(x,y,:));
        [max_dl,k_dl] = max(E_dl(x,y,:));
        
        max_vect = [max_h1,max_v1,max_dr,max_dl];
        k_vect = [k_h1,k_v1,k_dr,k_dl];
        
        [max_t1, index_t1] = max(max_vect);
        k_t1 = k_vect(index_t1);
        S(x,y) =2.^k_t1;
        
        if index_t1 == 1
            E_h(x,y,k_t1) = NaN;
        elseif index_t1 == 2
            E_v(x,y,k_t1) = NaN;
        elseif index_t1 == 3
            E_dr(x,y,k_t1) = NaN;
        elseif index_t1 == 4
            E_dl(x,y,k_t1) = NaN;
        end
        
        [max_h1,k_h1] = max(E_h(x,y,:));
        [max_v1,k_v1] = max(E_v(x,y,:));
        [max_dr,k_dr] = max(E_dr(x,y,:));
        [max_dl,k_dl] = max(E_dl(x,y,:));
        
        max_vect = [max_h1,max_v1,max_dr,max_dl];
        k_vect = [k_h1,k_v1,k_dr,k_dl];
        
        [max_t2, index_t2] = max(max_vect);
        k_t2 = k_vect(index_t2);
        
        if max_t2 >= t*max_t1 && k_t2 > k_t1
                S(x,y) = 2.^k_t2;
        end
            
    end
end


%% Step 4
% figure
% imshow(int8(S))
Fcoarseness = sum(S(:))/(height*width);