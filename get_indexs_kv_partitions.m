function indexes = get_indexs_kv_partitions(x,number_segments)
%GET_INDEXS_KV_PARTITIONS Summary of this function goes here
%   Detailed explanation goes here

 segments = zeros(1,number_segments);
 
 rows = size(x,1);
 
 segments = create_partitions(segments,number_segments,rows);
 
 a = cumsum(segments);
 segment_indexes = ones(1,2*number_segments);
 segment_indexes(2:2:end) = a;
 segment_indexes(3:2:end) = a(1:end-1)+1;
 
 j=1;

 
 for i=1:number_segments
     indexes(i) = {[segment_indexes(j),segment_indexes(j+1)]};
     j=j+2;   
 end
end

