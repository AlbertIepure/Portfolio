% Look-up table generation. Generated frequency F = (Fs * Number of cycles)/Number of points.

Fs = 16000;          % Sampling frequency in Hz;
F  = 6000;           % Desired frequency in Hz;
Np = 16;             % Number of points;
Nc = (Np * F)/Fs;    % Number of cycles; 

for i=1:Np
    sine(i) = round(1000 * sin(2 * pi * (i-1) * F/Fs)); % Rounds the elements to the nearest integer; 
    sine_zeros(i) = sine(i); % Creates a second array; 
end 

for i=2:2:Np
    sine_zeros(i) = 0; 
end 

fileID = fopen('sine6000.h','w');              % Create file, sine6000.h, and obtain the file identifier;
                                               % 'w' - Open or create new file for writing. Discard existing contents, if any.
fprintf(fileID,'#define LOOPLENGTH 16\n');     

fprintf(fileID,'short sine [16] = {');         % Array name; 
fprintf(fileID,'%d, ' ,sine(1:15));            % Print 15 points;
fprintf(fileID,'%d' ,sine(16));                % Print 16-th point;
fprintf(fileID,'};\n');                        % Print closing bracket;

fprintf(fileID,'short sine_zeros [16] = {');   % Array name; 
fprintf(fileID,'%d, ' ,sine_zeros(1:15));      % Print 15 points;
fprintf(fileID,'%d' ,sine_zeros(16));          % Print 16-th point;
fprintf(fileID,'};\n');                        % Print closing bracket;
fclose(fileID);                                % Close file;
                               