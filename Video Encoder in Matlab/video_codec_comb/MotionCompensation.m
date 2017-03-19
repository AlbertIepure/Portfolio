function [predictedFrame] = MotionCompensation(referenceFrame,motionMatrix, mbDim,isHPEnabled)
dimensions = size(referenceFrame);
height = dimensions(1);
width = dimensions(2);
predictedFrame = zeros(dimensions);
blockN = 1;
if isHPEnabled
    for i=1:mbDim:height
        for j=1:mbDim:width
            x = motionMatrix(blockN,1);
            y = motionMatrix(blockN,2);
            if mod(x,1) == 0 && mod(y,1) == 0
                predictedFrame(i:i+mbDim-1,j:j+mbDim-1,:) = referenceFrame(i+y:i+y+mbDim-1,j+x:j+x+mbDim-1,:);
            elseif mod(y,1) == 0
                x_1 = ceil(x);
                x_2 = floor(x);
                predictedFrame(i:i+mbDim-1,j:j+mbDim-1,:) = (referenceFrame(i+y:i+y+mbDim-1,j+x_1:j+x_1+mbDim-1,:) + referenceFrame(i+y:i+y+mbDim-1,j+x_2:j+x_2+mbDim-1,:) + ones(mbDim,mbDim,3))./2;
            elseif mod(x,1) == 0
                y_1 = ceil(y);
                y_2 = floor(y);
                predictedFrame(i:i+mbDim-1,j:j+mbDim-1,:) = (referenceFrame(i+y_1:i+y_1+mbDim-1,j+x:j+x+mbDim-1,:) + referenceFrame(i+y_2:i+y_2+mbDim-1,j+x:j+x+mbDim-1,:) + ones(mbDim,mbDim,3))./2;
            else
                x_1 = ceil(x);
                x_2 = floor(x);
                y_1 = ceil(y);
                y_2 = floor(y);
                predictedFrame(i:i+mbDim-1,j:j+mbDim-1,:) = (referenceFrame(i+y_1:i+y_1+mbDim-1,j+x_1:j+x_1+mbDim-1,:) + referenceFrame(i+y_2:i+y_2+mbDim-1,j+x_1:j+x_1+mbDim-1,:) + referenceFrame(i+y_1:i+y_1+mbDim-1,j+x_2:j+x_2+mbDim-1,:) + referenceFrame(i+y_2:i+y_2+mbDim-1,j+x_2:j+x_2+mbDim-1,:) + 2*ones(mbDim,mbDim,3))./4;
            end
            blockN = blockN + 1;
        end
    end
else
    for i=1:mbDim:height
        for j=1:mbDim:width
            x = motionMatrix(blockN,1);
            y = motionMatrix(blockN,2);
            predictedFrame(i:i+mbDim-1,j:j+mbDim-1,:) = referenceFrame(i+y:i+y+mbDim-1,j+x:j+x+mbDim-1,:);
            blockN = blockN + 1;
        end
    end
end
end