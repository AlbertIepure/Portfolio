function[differentially_coded_mm] = EncodeMMDifferentially(motion_matrix)
dimensions = size(motion_matrix);
differentially_coded_mm = zeros(dimensions);
for i = 1:dimensions(1)
    current_mv = motion_matrix(i,:);
    if i == 1
        differentially_coded_mm(i,:) = current_mv;
    else
        differentially_coded_mm(i,:) = current_mv - old_mv;
    end
    old_mv = current_mv;
end
end