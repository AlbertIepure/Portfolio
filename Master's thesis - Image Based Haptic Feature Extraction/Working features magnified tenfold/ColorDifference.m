function deltaE = ColorDifference(L1,a1,b1,L2,a2,b2)

delta_L = L2 - L1;
L_avg = 0.5*(L1 + L2);

C_1 = sqrt(a1^2 + b1^2);
C_2 = sqrt(a2^2 + b2^2);
C_avg = 0.5*(C_1 + C_2);

a_1 = a1 + 0.5*a1*(1-sqrt(C_avg^7/(C_avg^7+25^7)));
a_2 = a2 + 0.5*a2*(1-sqrt(C_avg^7/(C_avg^7+25^7)));

C_1_prime = sqrt(a_1^2 + b1^2);
C_2_prime = sqrt(a_2^2 + b2^2);
delta_C_prime = C_2_prime - C_1_prime;
C_avg_prime = 0.5*(C_1_prime + C_2_prime);

h_1 = rad2deg(atan2(b1,a_1) + pi); % atan2(0,0) = 0 %rad2deg
h_2 = rad2deg(atan2(b2,a_2) + pi); %rad2deg

if abs(h_1 - h_2) <= 180
    delta_h = h_2 - h_1;
elseif abs(h_1 - h_2) > 180 && h_2 <= h_1
    delta_h = h_2 - h_1 + 360;
elseif abs(h_2 - h_1) > 180 && h_2 > h_1
    delta_h = h_2 - h_1 - 360;
end
if C_1_prime == 0 || C_2_prime == 0
    delta_h = 0;
end

delta_H = 2*sqrt(C_1_prime*C_2_prime)*sind(delta_h/2);
if abs(h_1 - h_2) > 180
    H_avg = (h_1 + h_2 + 360)/2;
else
    H_avg = (h_1 + h_2)/2;
end
if C_1_prime == 0 || C_2_prime == 0
    H_avg = h_1 + h_2;
end

T = 1 - 0.17*cosd(H_avg - 30) + 0.24*cosd(2*H_avg) + 0.32*cosd(3*H_avg + 6) - 0.2*cosd(4*H_avg - 63);
S_L = 1 + (0.015*(L_avg - 50)^2)/sqrt(20+(L_avg-50)^2);
S_C = 1 + 0.045*C_avg_prime;
S_H = 1 + 0.015*C_avg_prime*T;
R_T = -2*sqrt(C_avg_prime^7/(C_avg_prime^7 + 25^7))*sind(60*exp(-((H_avg - 275)/25)^2));

k_L = 1;
k_C = 1;
k_H = 1;

deltaE = sqrt((delta_L/(k_L*S_L))^2 + (delta_C_prime/(k_C*S_C))^2 + (delta_H/(k_H*S_H))^2 + R_T*delta_C_prime*delta_H/(k_C*S_C*k_H*S_H));