function [motion_vector] = ReshapeMotionMatrix(motion_matrix)
    motion_matrix_01 = motion_matrix(:,:,2);
    motion_matrix_02 = motion_matrix(:,:,1);
    motion_vector(:,1) = motion_matrix_01(:);
    motion_vector(:,2) = motion_matrix_02(:);
end