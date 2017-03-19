function [mv_mat,contor] = half_pel_ME(current_frame, reference_frame, mv_mat, block_size, search_range, height, width, half_pel)

contor = 0;
if half_pel
    %%Half-pel resolution
    block_nb = 1;
    scale = [0 -1 1];
    for i=1:block_size:height
        for j=1:block_size:width
            x = mv_mat(block_nb,1);
            y = mv_mat(block_nb,2);
            current_block = current_frame(i:i+block_size-1,j:j+block_size-1,1);
            target_block = reference_frame(i+y:i+y+block_size-1,j+x:j+x+block_size-1,1);
            SAD(1) = sum(sum((current_block - target_block).^2));
            contor = contor + 1;
            % start interpolation
            if j+x-1 > 0 && j+x-1+block_size-1 <= width
                interpolated_block = (reference_frame(i+y:i+y+block_size-1,j+x-1:j+x-1+block_size-1,1) + reference_frame(i+y:i+y+block_size-1,j+x:j+x+block_size-1,1) + ones(block_size,block_size))./2;
                SAD(2) = sum(sum((current_block - interpolated_block).^2));
                contor = contor + 1;
            else
                SAD(2) = 9999999;
            end
            
            if j+x > 0 && j+x+1+block_size-1 <= width
                interpolated_block = (reference_frame(i+y:i+y+block_size-1,j+x+1:j+x+1+block_size-1,1) + reference_frame(i+y:i+y+block_size-1,j+x:j+x+block_size-1,1) + ones(block_size,block_size))./2;
                SAD(3) = sum(sum((current_block - interpolated_block).^2));
                contor = contor + 1;
            else
                SAD(3) = 9999999;
            end
            [~,pos] = min(SAD);
            x_half_pel = scale(pos)*0.5;
            
%             x = x + scale(pos); % position of the new center of search range
            SAD(1) = min(SAD); % update the first value of the SAD with the minimum
            
            if i+y-1 > 0 && i+y-1+block_size-1 <= height && j+x+1+block_size-1 <= width 
                if pos == 1
                    interpolated_block = (reference_frame(i+y:i+y+block_size-1,j+x:j+x+block_size-1,1) + reference_frame(i+y-1:i+y-1+block_size-1,j+x:j+x+block_size-1,1) + ones(block_size,block_size))./2;
                    SAD(2) = sum(sum((current_block - interpolated_block).^2));
                    contor = contor + 1;
                elseif pos == 2
                    interpolated_block = (reference_frame(i+y:i+y+block_size-1,j+x:j+x+block_size-1,1) + reference_frame(i+y-1:i+y-1+block_size-1,j+x:j+x+block_size-1,1) + reference_frame(i+y:i+y+block_size-1,j+x-1:j+x-1+block_size-1,1) + reference_frame(i+y-1:i+y-1+block_size-1,j+x-1:j+x-1+block_size-1,1) + 2*ones(block_size,block_size))./2;
                    SAD(2) = sum(sum((current_block - interpolated_block).^2));
                    contor = contor + 1;
                else
                    interpolated_block = (reference_frame(i+y:i+y+block_size-1,j+x:j+x+block_size-1,1) + reference_frame(i+y-1:i+y-1+block_size-1,j+x:j+x+block_size-1,1) + reference_frame(i+y:i+y+block_size-1,j+x+1:j+x+1+block_size-1,1) + reference_frame(i+y-1:i+y-1+block_size-1,j+x+1:j+x+1+block_size-1,1) + 2*ones(block_size,block_size))./2;
                    SAD(2) = sum(sum((current_block - interpolated_block).^2));
                    contor = contor + 1;
                end
            else
                SAD(2) = 9999999;
            end
            
            if i+y > 0 && i+y+1+block_size-1 <= height && j+x+1+block_size-1 <=width
                if pos == 1
                    interpolated_block = (reference_frame(i+y:i+y+block_size-1,j+x:j+x+block_size-1,1) + reference_frame(i+y+1:i+y+1+block_size-1,j+x:j+x+block_size-1,1) + ones(block_size,block_size))./2;
                    SAD(3) = sum(sum((current_block - interpolated_block).^2));
                    contor = contor + 1;
                elseif pos == 2
                    interpolated_block = (reference_frame(i+y:i+y+block_size-1,j+x:j+x+block_size-1,1) + reference_frame(i+y+1:i+y+1+block_size-1,j+x:j+x+block_size-1,1) + reference_frame(i+y:i+y+block_size-1,j+x-1:j+x-1+block_size-1,1) + reference_frame(i+y+1:i+y+1+block_size-1,j+x-1:j+x-1+block_size-1,1) + 2*ones(block_size,block_size))./4;
                    SAD(3) = sum(sum((current_block - interpolated_block).^2));
                    contor = contor + 1;
                else
                    interpolated_block = (reference_frame(i+y:i+y+block_size-1,j+x:j+x+block_size-1,1) + reference_frame(i+y+1:i+y+1+block_size-1,j+x:j+x+block_size-1,1) + reference_frame(i+y:i+y+block_size-1,j+x+1:j+x+1+block_size-1,1) + reference_frame(i+y+1:i+y+1+block_size-1,j+x+1:j+x+1+block_size-1,1) + 2*ones(block_size,block_size))./4;
                    SAD(3) = sum(sum((current_block - interpolated_block).^2));
                    contor = contor + 1;
                end
            else
                SAD(3) = 9999999;
            end
            
            [~,pos] = min(SAD);
            y_half_pel = scale(pos)*0.5;
            
            % verify whether the half-pel vector generated is within the
            % seach window
            
            if x + x_half_pel > -search_range && x + x_half_pel < search_range
                mv_mat(block_nb,1) = x + x_half_pel;
            end
            
            if y + y_half_pel > -search_range && y + y_half_pel < search_range
                mv_mat(block_nb,2) = y + y_half_pel;
            end
            
            block_nb = block_nb + 1;
        end
    end
end