function[motion_matrix] = DecodeMMDifferentially(differentially_coded_mm)
dimensions = size(differentially_coded_mm);
motion_matrix = zeros(dimensions);
for i = 1:dimensions(1)
    current_mv = differentially_coded_mm(i,:);
    if i == 1
        motion_matrix(i,:) = current_mv;
    else
        motion_matrix(i,:) = current_mv + old_mv;
    end
    old_mv = motion_matrix(i,:);    
end
end