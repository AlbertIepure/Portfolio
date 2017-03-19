function[file_path] = addQ2Path(file_path,index,Q)
if Q >= 1
    Q = num2str(Q,'%02d');
    file_path(index) = Q(1);
    file_path(index+1) = Q(2);
else
    Q = num2str(Q,'%01.2f');
    file_path(index) = Q(1);
    file_path(index+1) = Q(2);
    file_path(index+2) = Q(3);
    file_path(index+3) = Q(4);
    file_path = [file_path , '.mat'];
end
end