%% Operating wavelength and related constants
lambda=1550*1e-9;                      % Operating wavelength in meters
c=3e8;                                 % Speed of light in m/s
D=16*1e-12/(1e-9*1e3);                 % Dispersion in ps/(nm*km)

%% Configuration Parameters For the CD Channel
L=23*1e3;                              % Length of fiber in meters;
Bw=56e9;                               % Bandwidth of the signal in Hz

%% Sampling frequency
B=Bw;

%% Calculating alpha
alpha=lambda^2*B^2*D*L/(4*pi*c);        % Multiplying the above parameters

%% Number of frequency points needed to generate channel impulse response
freq_pts=256;

h_CD=impulse_response_channel(alpha,freq_pts); 