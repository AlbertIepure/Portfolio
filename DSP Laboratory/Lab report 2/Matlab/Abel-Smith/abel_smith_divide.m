function [ omega_seg ] = abel_smith_divide( alpha,N_IIR )
% Functions calculates the segmentation for the abel smith algorithm for a
% given alpha where alpha= lambda_o^2*B^2*D*L/(4*pi*c)

beta = ceil(2*alpha*pi);

omega_seg(1) = -pi;
omega_seg(N_IIR+1) = pi;

for i=2:N_IIR
    omega11 = (2*beta + sqrt(4*beta^2 - 8*alpha*(4*pi - 2*alpha*(omega_seg(i-1))^2 +2*beta*omega_seg(i-1))))/(4*alpha);
    omega12 = (2*beta - sqrt(4*beta^2 - 8*alpha*(4*pi - 2*alpha*(omega_seg(i-1))^2 +2*beta*omega_seg(i-1))))/(4*alpha);
    if abs(omega11)<abs(omega_seg(i-1))
        omega_seg(i) = omega11;
    else
        omega_seg(i) = omega12;
    end
end

end

