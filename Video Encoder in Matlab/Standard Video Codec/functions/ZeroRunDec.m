function decoded_stream = ZeroRunDec(input_stream, N)

decoded_stream = [];
i=1;
l=length(input_stream);

%%the last two values of the zero-run coded input stream can be the
%%following: a) (0,0) b) (0,x) x>0; c) (x,y) x,y > 0. For the first two
%%cases is sufficient to have i<l for the while loop, because in both cases
%%i is incremented by two so it exceeds by one the length of the
%%input_stream. But for the last case, if we would have only <, we would
%%miss the last value, which is not desirable. This is why I have used <=
%%and this doesn't generate any out of bounds error because the else is
%%entered only in the first two cases.

c = 0;
while i<=l
    if input_stream(i) ~= 1000 && c<=N*N
        if input_stream(i) ~= 0
            decoded_stream = [decoded_stream input_stream(i)];
            i=i+1;
            c=c+1;
        else
            if input_stream(i) == 0 && input_stream(i+1) == 0
                decoded_stream = [decoded_stream 0];
                c=c+1;
            else
                repetitions = input_stream(i+1);
                decoded_stream = [decoded_stream zeros(1,repetitions+1)];
                c=c+repetitions+1;
            end
            i=i+2;
        end
    elseif c==N*N
        c=0;
        i=i+1;
    else
        decoded_stream = [decoded_stream zeros(1,N*N-c)];
        c=0;
        i=i+1;
    end
end