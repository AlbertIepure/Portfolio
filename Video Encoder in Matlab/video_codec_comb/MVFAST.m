function  [mv_mat,SSD,contor] = MVFAST(current_frame, reference_frame, macroblock_dim, search_range)

mv_mat = [];
SSD = [];
contor = 0;
dimensions = size(current_frame);
height = dimensions(1);
width = dimensions(2);
% begin the MVFAST algorithm
horizontal_blocks = width/macroblock_dim;
vertical_blocks = height/macroblock_dim;

V_0 = [0,0];
L_1 = 1;
L_2 = 2;
SDSP = [0,0; 1,0; 0,1; -1,0; 0,-1]; % Small Diamond Search Pattern
LDSP = [0,0; 2,0; 1,1; 0,2; -1,1; -2,0; -1,-1; 0,-2; 1,-1]; % Large Diamond Search Pattern

for i=1:macroblock_dim:height
    for j=1:macroblock_dim:width
        current_block = current_frame(i:i+macroblock_dim-1,j:j+macroblock_dim-1,1);
        if i==1 || i==height - macroblock_dim+1 || j==1 || j==width-macroblock_dim+1 %for the first row, last row, leftmost and rightermost column of the image perform full search
            ssd = 9999999;
            pos = [0 0];
            for x = -search_range:search_range
                for y = -search_range:search_range
                    if i+y > 0 && i+y+macroblock_dim-1 <= height
                        if j+x > 0 && j+x+macroblock_dim-1 <= width
                            target_block = reference_frame(i+y:i+y+macroblock_dim-1,j+x:j+x+macroblock_dim-1,1);
                            result = sum(sum((current_block - target_block).^2));
                            contor = contor + 1;
                            if result < ssd
                                ssd = result;
                                pos = [x y];
                            end
                        end
                    end
                end
            end
            mv_mat = [mv_mat; pos];
        else
            % MVFAST algorithm starts here
            
            low = 0;
            medium = 0;
            high = 0;
            search_points = [];
            result_mat = [];
            
            % define set V
            V_1 = mv_mat(horizontal_blocks*(floor(i/macroblock_dim))+floor(j/macroblock_dim),:); %the block to the left
            V_2 = mv_mat(horizontal_blocks*(floor(i/macroblock_dim)-1)+floor(j/macroblock_dim)+1,:); %the block above
            V_3 = mv_mat(horizontal_blocks*(floor(i/macroblock_dim)-1)+floor(j/macroblock_dim)+2,:); %the block above right
            
            % determine cityblock lengths
            l_V_1 = sum(abs(V_1));
            l_V_2 = sum(abs(V_2));
            l_V_3 = sum(abs(V_3));
            
            L = max([l_V_1, l_V_2, l_V_3]);
            
            % determine motion activity
            if L <= L_1
                low = 1;
            elseif L > L_1 && L <= L_2
                medium = 1;
            else
                high = 1;
            end
            
            %% selection of search center
            if low || medium
                search_center = V_0; % origin
            else
                V = [V_1; V_2; V_3];
                SAD = zeros(3,1);
                for k = 1:3
                    x = V(k,1);
                    y = V(k,2);
                    target_block = reference_frame(i+y:i+y+macroblock_dim-1,j+x:j+x+macroblock_dim-1,1);
                    SAD(k) = sum(sum((current_block - target_block).^2));
                    contor = contor + 1;
                end
                [~,index] = min(SAD);
                search_center = V(index,:);
            end
            
            %% local search
            search_points = [];
            result_mat = [];
            
            if low || high
                search_points = [search_center(1) + SDSP(:,1), search_center(2) + SDSP(:,2)];
                for l=1:size(search_points,1)
                    x = search_points(l,1);
                    y = search_points(l,2);
                    if x >= -search_range && x <= search_range && y >= -search_range && y <= search_range % assure that x  and y are within the search window
                        target_block = reference_frame(i+y:i+y+macroblock_dim-1,j+x:j+x+macroblock_dim-1,1);
                        result_mat(l,1) = sum(sum((current_block - target_block).^2));
                        contor = contor + 1;
                    else
                        result_mat(l,1) = 9999999; %set this number to a large value to avoid winning the min with 0
                    end
                end
                [~,index] = min(result_mat);
                if index == 1 % if it is the center
                    mv_mat = [mv_mat; search_points(index,:)]; %no motion; the center represents the motion vector
                    %SSD = [SSD; result_mat(index)];
                else
                    bool = 1;
                    while bool
                        search_center = search_points(index,:);%the center moves where the minimum SAD was obtained
                        search_points = [];
                        result_mat = [];
                        search_points = [search_center(1) + SDSP(:,1), search_center(2) + SDSP(:,2)];
                        for l=1:size(search_points,1)
                            x = search_points(l,1);
                            y = search_points(l,2);
                            if x >= -search_range && x <= search_range && y >= -search_range && y <= search_range % assure that x  and y are within the search window
                                target_block = reference_frame(i+y:i+y+macroblock_dim-1,j+x:j+x+macroblock_dim-1,1);
                                result_mat(l,1) = sum(sum((current_block - target_block).^2));
                                contor = contor + 1;
                            else
                                result_mat(l,1) = 9999999; %set this number to a large value to avoid winning the min with 0
                            end
                        end
                        [~,index] = min(result_mat);
                        if index == 1 % if it is the center
                            mv_mat = [mv_mat; search_points(index,:)]; %no motion; the center represents the motion vector
                            %SSD = [SSD; result_mat(index)];
                            bool = 0;
                        end
                    end
                end
            else
                search_points = [search_center(1) + LDSP(:,1), search_center(2) + LDSP(:,2)];
                for l=1:size(search_points,1)
                    x = search_points(l,1);
                    y = search_points(l,2);
                    if x >= -search_range && x <= search_range && y >= -search_range && y <= search_range % assure that x  and y are within the search window
                        target_block = reference_frame(i+y:i+y+macroblock_dim-1,j+x:j+x+macroblock_dim-1,1);
                        result_mat(l,1) = sum(sum((current_block - target_block).^2));
                        contor = contor + 1;
                    else
                        result_mat(l,1) = 9999999; %set this number to a large value to avoid winning the min with 0
                    end
                end
                [~,index] = min(result_mat);
                if index == 1 % if it is the center
                    search_points = [];
                    result_mat = [];
                    search_points = SDSP; %switch to SDSP
                    for l=1:size(search_points,1)
                        x = search_points(l,1);
                        y = search_points(l,2);
                        if x >= -search_range && x <= search_range && y >= -search_range && y <= search_range % assure that x  and y are within the search window
                            target_block = reference_frame(i+y:i+y+macroblock_dim-1,j+x:j+x+macroblock_dim-1,1);
                            result_mat(l,1) = sum(sum((current_block - target_block).^2));
                            contor = contor + 1;
                        else
                            result_mat(l,1) = 9999999; %set this number to a large value to avoid winning the min with 0
                        end
                    end
                    [~,index] = min(result_mat);
                    mv_mat = [mv_mat; search_points(index,:)];
                    %SSD = [SSD; result_mat(index)];
                else
                    bool = 1;
                    while bool
                        search_center = search_points(index,:);
                        search_points = [];
                        result_mat = [];
                        search_points = [search_center(1) + LDSP(:,1), search_center(2) + LDSP(:,2)];
                        for l=1:size(search_points,1)
                            x = search_points(l,1);
                            y = search_points(l,2);
                            if x >= -search_range && x <= search_range && y >= -search_range && y <= search_range % assure that x  and y are within the search window
                                target_block = reference_frame(i+y:i+y+macroblock_dim-1,j+x:j+x+macroblock_dim-1,1);
                                result_mat(l,1) = sum(sum((current_block - target_block).^2));
                                contor = contor + 1;
                            else
                                result_mat(l,1) = 9999999; %set this number to a large value to avoid winning the min with 0
                            end
                        end
                        [~,index] = min(result_mat);
                        if index == 1
                            search_points = [];
                            result_mat = [];
                            search_points = [search_center(1) + SDSP(:,1), search_center(2) + SDSP(:,2)]; %switch to SDSP
                            for l=1:size(search_points,1)
                                x = search_points(l,1);
                                y = search_points(l,2);
                                if x >= -search_range && x <= search_range && y >= -search_range && y <= search_range % assure that x  and y are within the search window
                                    target_block = reference_frame(i+y:i+y+macroblock_dim-1,j+x:j+x+macroblock_dim-1,1);
                                    result_mat(l,1) = sum(sum((current_block - target_block).^2));
                                    contor = contor + 1;
                                else
                                    result_mat(l,1) = 9999999; %set this number to a large value to avoid winning the min with 0
                                end
                            end
                            [~,index] = min(result_mat);
                            mv_mat = [mv_mat; search_points(index,:)];
                            %SSD = [SSD; result_mat(index)];
                            bool = 0;
                        end
                    end
                end
            end
        end
        %target_block = reference_frame(i+y:i+y+macroblock_dim-1,j+x:j+x+macroblock_dim-1,1);
         ssd = sum(sum((current_block - target_block).^2));
         SSD = [SSD; ssd];
    end
end
end