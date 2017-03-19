function [motion_matrix] = ReshapeMotionVector(motion_vector,macroblock_rows,macroblock_columns)
    motion_matrix_01 = reshape(motion_vector(:,1),macroblock_rows,macroblock_columns);
    motion_matrix_02 = reshape(motion_vector(:,2),macroblock_rows,macroblock_columns);
    motion_matrix(:,:,1) = motion_matrix_01;
    motion_matrix(:,:,2) = motion_matrix_02;   
end