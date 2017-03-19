
%Creates file Hconvoultion.h
h=[ 1     2     6    11    19    29    42    56    69    80    87    90    87    80    69    56    42    29    19    11     6     2     1];

fid = fopen('convolution.h','w');		     %open/create file
fprintf(fid,'short h[23]={');  %print array name,"={"
fprintf(fid,'%d, ' ,h(1:22));     %print first 22 points
fprintf(fid,'%d' ,h(23));     %print the last point
fprintf(fid,'};\n');        %print closing bracket
fclose(fid);				  %close file

   