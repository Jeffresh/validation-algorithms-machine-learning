function segments = create_partitions(segments,number_segments, rows)
%CREATE_PARTITIONS Summary of this function goes here
%   Detailed explanation goes here


 segment_size= floor(rows/number_segments);
 
 segments = segments + segment_size;
 
 rest = mod(rows,number_segments);
 
 
 if rest <= number_segments

     segments(1:rest) = segments(1:rest)+1;

 else    
     create_partitions(segments, number_segments, rest);    

 end



end

