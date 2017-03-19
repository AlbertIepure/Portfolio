function [mvMatrix,contor] = estimatehpmotion(currentFrame, referenceFrame02,referenceFrame00, mvMatrix, mbDim, mvSearchRange,GOP_enabled)
dimensions = size(currentFrame);
height = dimensions(1);
width = dimensions(2);
contor = 0;
%%Half-pel resolution
blockN = 1;
scale = [0 -1 1];
for i=1:mbDim:height
    for j=1:mbDim:width
        x = mvMatrix(blockN,1);
        y = mvMatrix(blockN,2);
        if GOP_enabled
            if mvMatrix(blockN,3) == 0
                referenceFrame = referenceFrame00;
            else
                referenceFrame = referenceFrame02;
            end
        else
            referenceFrame = referenceFrame00;
        end
        current_block = currentFrame(i:i+mbDim-1,j:j+mbDim-1,1);
        target_block = referenceFrame(i+y:i+y+mbDim-1,j+x:j+x+mbDim-1,1);
        SSD(1) = sum(sum((current_block - target_block).^2));
        contor = contor + 1;
        % start interpolation
        if j+x-1 > 0 && j+x-1+mbDim-1 <= width
            interpolated_block = (referenceFrame(i+y:i+y+mbDim-1,j+x-1:j+x-1+mbDim-1,1) + referenceFrame(i+y:i+y+mbDim-1,j+x:j+x+mbDim-1,1) + ones(mbDim,mbDim))./2;
            SSD(2) = sum(sum((current_block - interpolated_block).^2));
            contor = contor + 1;
        else
            SSD(2) = 9999999;
        end
        
        if j+x > 0 && j+x+1+mbDim-1 <= width
            interpolated_block = (referenceFrame(i+y:i+y+mbDim-1,j+x+1:j+x+1+mbDim-1,1) + referenceFrame(i+y:i+y+mbDim-1,j+x:j+x+mbDim-1,1) + ones(mbDim,mbDim))./2;
            SSD(3) = sum(sum((current_block - interpolated_block).^2));
            contor = contor + 1;
        else
            SSD(3) = 9999999;
        end
        [~,pos] = min(SSD);
        x_half_pel = scale(pos)*0.5;
        
        %             x = x + scale(pos); % position of the new center of search range
        SSD(1) = min(SSD); % update the first value of the SAD with the minimum
        
        if i+y-1 > 0 && i+y-1+mbDim-1 <= height && j+x+1+mbDim-1 <= width
            if pos == 1
                interpolated_block = (referenceFrame(i+y:i+y+mbDim-1,j+x:j+x+mbDim-1,1) + referenceFrame(i+y-1:i+y-1+mbDim-1,j+x:j+x+mbDim-1,1) + ones(mbDim,mbDim))./2;
                SSD(2) = sum(sum((current_block - interpolated_block).^2));
                contor = contor + 1;
            elseif pos == 2
                interpolated_block = (referenceFrame(i+y:i+y+mbDim-1,j+x:j+x+mbDim-1,1) + referenceFrame(i+y-1:i+y-1+mbDim-1,j+x:j+x+mbDim-1,1) + referenceFrame(i+y:i+y+mbDim-1,j+x-1:j+x-1+mbDim-1,1) + referenceFrame(i+y-1:i+y-1+mbDim-1,j+x-1:j+x-1+mbDim-1,1) + 2*ones(mbDim,mbDim))./2;
                SSD(2) = sum(sum((current_block - interpolated_block).^2));
                contor = contor + 1;
            else
                interpolated_block = (referenceFrame(i+y:i+y+mbDim-1,j+x:j+x+mbDim-1,1) + referenceFrame(i+y-1:i+y-1+mbDim-1,j+x:j+x+mbDim-1,1) + referenceFrame(i+y:i+y+mbDim-1,j+x+1:j+x+1+mbDim-1,1) + referenceFrame(i+y-1:i+y-1+mbDim-1,j+x+1:j+x+1+mbDim-1,1) + 2*ones(mbDim,mbDim))./2;
                SSD(2) = sum(sum((current_block - interpolated_block).^2));
                contor = contor + 1;
            end
        else
            SSD(2) = 9999999;
        end
        
        if i+y > 0 && i+y+1+mbDim-1 <= height && j+x+1+mbDim-1 <=width
            if pos == 1
                interpolated_block = (referenceFrame(i+y:i+y+mbDim-1,j+x:j+x+mbDim-1,1) + referenceFrame(i+y+1:i+y+1+mbDim-1,j+x:j+x+mbDim-1,1) + ones(mbDim,mbDim))./2;
                SSD(3) = sum(sum((current_block - interpolated_block).^2));
                contor = contor + 1;
            elseif pos == 2
                interpolated_block = (referenceFrame(i+y:i+y+mbDim-1,j+x:j+x+mbDim-1,1) + referenceFrame(i+y+1:i+y+1+mbDim-1,j+x:j+x+mbDim-1,1) + referenceFrame(i+y:i+y+mbDim-1,j+x-1:j+x-1+mbDim-1,1) + referenceFrame(i+y+1:i+y+1+mbDim-1,j+x-1:j+x-1+mbDim-1,1) + 2*ones(mbDim,mbDim))./4;
                SSD(3) = sum(sum((current_block - interpolated_block).^2));
                contor = contor + 1;
            else
                interpolated_block = (referenceFrame(i+y:i+y+mbDim-1,j+x:j+x+mbDim-1,1) + referenceFrame(i+y+1:i+y+1+mbDim-1,j+x:j+x+mbDim-1,1) + referenceFrame(i+y:i+y+mbDim-1,j+x+1:j+x+1+mbDim-1,1) + referenceFrame(i+y+1:i+y+1+mbDim-1,j+x+1:j+x+1+mbDim-1,1) + 2*ones(mbDim,mbDim))./4;
                SSD(3) = sum(sum((current_block - interpolated_block).^2));
                contor = contor + 1;
            end
        else
            SSD(3) = 9999999;
        end
        
        [~,pos] = min(SSD);
        y_half_pel = scale(pos)*0.5;
        
        % verify whether the half-pel vector generated is within the
        % seach window
        
        if x + x_half_pel > -mvSearchRange && x + x_half_pel < mvSearchRange
            mvMatrix(blockN,1) = x + x_half_pel;
        end
        
        if y + y_half_pel > -mvSearchRange && y + y_half_pel < mvSearchRange
            mvMatrix(blockN,2) = y + y_half_pel;
        end
        
        blockN = blockN + 1;
    end
end
end