%Zigzag scanning of a DCT N*N matrix
function row_vector = ZigZag8x8(INPUT_block)
element=0;
dimensions=size(INPUT_block);
number_of_elements=dimensions(2)*dimensions(1);  %calculating the M*N
for d=2:number_of_elements
 c=mod(d,2);  %checking whether the sum of the indexes is even or odd
    for i=1:dimensions(1)
        for j=1:dimensions(2)
            if((i+j)==d)
                element=element+1;
                if(c==0)
                row_vector(element)=INPUT_block(j,d-j);
                else          
                row_vector(element)=INPUT_block(d-j,j);
                end
             end    
         end
     end
end