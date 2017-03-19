function zero_run_code_w_eob = aZeroRunEnc(sequence)

s=length(sequence);
i=1;
zero_run_code = [];

while i<s
    if sequence(i)~=0
        zero_run_code = [zero_run_code sequence(i)];
        i=i+1;
    else
        if sequence(i)==0 && sequence(i+1)~=0
            repetitions = 0;
            zero_run_code = [zero_run_code 0 repetitions];
            i=i+1;
        else
            repetitions=-1;
            while sequence(i)==0
                repetitions=repetitions+1;
                if i<s
                    i=i+1;
                else
                    break;
                end
            end
            zero_run_code = [zero_run_code 0 repetitions];
        end
    end
end

if zero_run_code(end) ~= 0 && zero_run_code(end-1) == 0 %%make sure that the last pair of values is of the form (0,x)
    zero_run_code_w_eob = [zero_run_code(1:end-2),260];%%1000 represents the EOB
else
    zero_run_code_w_eob = zero_run_code; %then the last value is an isolated nonzero number
end


            
            