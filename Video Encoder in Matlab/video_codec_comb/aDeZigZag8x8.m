%Starting from a vector obtained by scanning a N*N matrix in zig-zag raster
%scan, obtain the original matrix

function INPUT_block = aDeZigZag8x8(row_vector)
element=0;
number_of_elements=length(row_vector);  %calculating the N*N
dimensions=sqrt(number_of_elements);
for d=2:number_of_elements
 c=mod(d,2);  %checking whether the sum of the indexes is even or odd
    for i=1:dimensions
        for j=1:dimensions
            if((i+j)==d)
                element=element+1;
                if(c==0)
                INPUT_block(j,d-j)=row_vector(element);
                else          
                INPUT_block(d-j,j)=row_vector(element);
                end
             end    
         end
     end
end