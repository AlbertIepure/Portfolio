function zero_run_code = ZeroRunEnc_wo_EOB(sequence)

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
            
            