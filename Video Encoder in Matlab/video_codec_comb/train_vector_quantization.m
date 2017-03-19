function representative_values = train_vector_quantization(ORIGINAL_image, M, N)

epsilon = 0.1; %threshold
intervals = [0:256/2^M:256];
[height width dimensions] = size(ORIGINAL_image);

representative_values = repmat(0.5*(intervals(1:end-1)+intervals(2:end)).',1,N*N);

coding_table = zeros(length(representative_values),N*N*2+1);
new_coding_table = zeros(length(representative_values),N*N*2+1);
coding_table(:,1:N*N) = representative_values; %train the coding table with a uniform quantizer

iterations = 0;
% choose D_old and D_new in such a way as to force entering the while loop
D_old = 1000;
D_new = 900;

% do this in order to have when you first enter the loop the coding table
% trained with uniform quantizatizer

new_coding_table(:,1:N*N) = coding_table(:,1:N*N);

while abs(D_old-D_new)/D_new > epsilon
    D_old = D_new;
    D_new = 0; %distortion in our case is MSE
    representative_values = new_coding_table(:,1:N*N);
    for i=1:dimensions
        for j=1:N:height
            for k=1:N:width
                sample_vector = reshape(ORIGINAL_image(j:j+1,k:k+1,i).',[1,N*N]);
                dif_norm = sqrt(sum((representative_values - repmat(sample_vector,length(intervals)-1,1)).^2,2)); %the norm of the difference
                [value,index] = min(dif_norm);
                new_coding_table(index,N*N+1:2*N*N) = new_coding_table(index,N*N+1:2*N*N)+sample_vector;
                new_coding_table(index,2*N*N+1) = new_coding_table(index,2*N*N+1)+1;
                D_new = D_new + dif_norm(index,1)^2; % measure of distortion is MSE, which is the square of the norm
            end
        end
    end
    %update the table according to Lloyd Max criterion
    coding_table = new_coding_table;
    new_coding_table(:,1:2*N*N) = zeros(length(representative_values),N*N*2); % initialize with zero
    new_coding_table(:,1:N*N) = coding_table(:,N*N+1:2*N*N)./repmat(coding_table(:,2*N*N+1),1,N*N);
    %% cell split algorithm begin
    empty_cells = find(~new_coding_table(:,2*N*N+1)); %find the zeros in the last column
    for i=1:length(empty_cells)
        [value,index] = max(new_coding_table(:,2*N*N+1)); %find the biggest cell
        new_coding_table(index,2*N*N+1) = new_coding_table(index,2*N*N+1)/2; %split it in half
        new_coding_table(empty_cells(i),:) = [new_coding_table(index,:)]; %copy the half of the cell into the empt cell
        new_coding_table(empty_cells(i),N*N) = new_coding_table(empty_cells(i),N*N)+1; %increment one of the representative values by 1
    end
    new_coding_table(:,2*N*N+1) = 0; % reset also the last column  
    new_coding_table = round(new_coding_table);
    iterations = iterations + 1;
end

representative_values = new_coding_table(:,1:N*N);

