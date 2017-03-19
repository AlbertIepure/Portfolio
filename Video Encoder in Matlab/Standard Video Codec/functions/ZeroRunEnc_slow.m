function zero_run_code = ZeroRunEnc_slow(sequence)

% in the first part the general run-level-coding is done
s=length(sequence);
c = 0;

run_level_code(1) = sequence(1);
index = 1;
i=2;

while i<=s
    j = i;
    c = 0;
    while sequence(j)==sequence(j-1)
        c=c+1;
        run_level_code(index+1) = c;
        if j<s
            j=j+1;
            i = j;
        else
            break;
        end
    end
    if sequence(j-1)~=sequence(j)
        index = index+2;
        run_level_code(index)=sequence(i);
        run_level_code(index+1)=0;
        i=i+1;
    else
        break
    end
end

% here the code is unfolded, but only for non-zero values

l=length(run_level_code);
zero_run_code = [];
z=0;

for i=1:2:l
    if run_level_code(i) ~= 0
        repetitions = run_level_code(i+1);
        zero_run_code = [zero_run_code, run_level_code(i)*ones(1,repetitions+1)]; %unfold the non-zero values
        z = length(zero_run_code);
    else
        zero_run_code(z+1:z+2) = run_level_code(i:i+1);%copy the pair as it is for zero values
    end
end
        
