function b = low_pass_2(Fc)
%LOW_PASS_2 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.3 and the Signal Processing Toolbox 6.21.
% Generated on: 10-Jul-2014 07:37:19

% FIR Window Lowpass filter designed using the FIR1 function.

% All frequency values are normalized to 1.

N    = 10;             % Order
% Fc   = 0.33333333333;  % Cutoff Frequency
flag = 'scale';        % Sampling Flag
Beta = 0.5;            % Window Parameter

% Create the window vector for the design algorithm.
win = kaiser(N+1, Beta);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Fc, 'low', win, flag);
% Hd = dfilt.dffir(b);
end
% [EOF]
