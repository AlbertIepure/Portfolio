function QUANTIZED_image = LloydMax3(ORIGINAL_image, M)

epsilon = 0.001; %threshold
intervals = [0:256/2^M:256];
[height width dimensions] = size(ORIGINAL_image);

for i=1:length(intervals)-1
    representative_values(i) = (intervals(i)+intervals(i+1))/2;
end

coding_table = zeros(length(representative_values),3);
new_coding_table = zeros(length(representative_values),3);
coding_table(:,1) = representative_values.'; %train the coding table with a uniform quantizer

iterations = 0;
% choose D_old and D_new in such a way as to force entering the while loop
D_old = 1000;
D_new = 900;

% do this in order to have when you first enter the loop the coding table
% trained with uniform quantizatizer

new_coding_table(:,2) = coding_table(:,1);
new_coding_table(:,3) = coding_table(:,1)./coding_table(:,1);

while abs(D_old-D_new)/D_new > epsilon
    D_old = D_new;
    coding_table = new_coding_table;
    new_coding_table = zeros(length(representative_values),3); % initialize with zero
    new_coding_table(:,1) = coding_table(:,2)./coding_table(:,3);
    
    D_new = 0; %distortion in our case is MSE
    representative_values = new_coding_table(:,1).';
    for i=1:dimensions
        for j=1:height
            for k=1:width
                [value,index] = min(abs([ORIGINAL_image(j,k,i)-representative_values]));
                INDEX_image(j,k,i) = index;
                new_coding_table(index,2) = new_coding_table(index,2)+ORIGINAL_image(j,k,i);
                new_coding_table(index,3) = new_coding_table(index,3)+1;
                D_new = D_new + value^2;
            end
        end
    end
    iterations = iterations + 1;
end

% you only send the index image to the decoder, which already has the
% representative values which have been obtained after the training

for i=1:dimensions
        for j=1:height
            for k=1:width
                QUANTIZED_image(j,k,i) = representative_values(INDEX_image(j,k,i));
            end
        end
end
