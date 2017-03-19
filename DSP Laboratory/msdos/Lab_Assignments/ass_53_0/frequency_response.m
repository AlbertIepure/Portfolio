function [magnitude, phase] = frequency_response(numerator, denominator)
close all;
clc;
fvtool(numerator,denominator);
N=1000; %number of points used in the plot
[zeros, poles, gain] = tf2zpk(numerator, denominator);
omega = 0:2*pi/N:pi-2*pi/N;%generate the pulsation in rad
z = exp(1i*omega);
magnitude = abs(gain)*ones(size(omega));
phase = (angle(gain)*180/pi)*ones(size(omega));%convert from radians to degrees
for i=1:length(omega)
    for j=1:length(zeros)
        magnitude(i) = magnitude(i)*abs(z(i) - zeros(j));
        phase(i) = phase(i) + angle(z(i) - zeros(j))*180/pi;
    end;
    for j=1:length(poles)
        magnitude(i) = magnitude(i)/abs(z(i) - poles(j));
        phase(i) = phase(i) - angle(z(i) - poles(j))*180/pi;
    end;
%     if phase(i)>180
%         phase(i)=phase(i) + 360*ceil(phase(i)/360);%bring the phase between [-180; 180] degrees
%     end;
%     if phase(i)<-180
%        phase(i)=phase(i) + 360*ceil(phase(i)/360);%bring the phase between [-180; 180] degrees
%     end;
end;

magnitude_dB = 20*log10(magnitude);

figure;
plot(omega/pi,magnitude_dB);
title('Magnitude of the transfer function');
xlabel('Normalized frequency (*pi samples/sample)');
ylabel('Magnitude [dB]');
grid on;

phase_rad = phase*pi/180;

figure;
plot(omega/pi,phase_rad);
title('Phase of the transfer function');
xlabel('Normalized frequency (*pi samples/sample)');
ylabel('Phase [deg]');
grid on;
end