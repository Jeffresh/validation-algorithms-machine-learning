function [xtrain,ytrain, xtest,ytest] = get_kv_partition(x_reduced, y_coded, indexes_partitions, i)
%GET_KV_PARTITION Summary of this function goes here
%   Detailed explanation goes here


number_segments = size(indexes_partitions,2);
if i==1

    xtest = x_reduced(1:indexes_partitions{1}(2),:);
    ytest = y_coded(1:indexes_partitions{1}(2),:);

    xtrain = x_reduced(indexes_partitions{2}(1):indexes_partitions{number_segments}(2),:);
    ytrain = y_coded(indexes_partitions{2}(1):indexes_partitions{number_segments}(2),:);
 elseif i == number_segments

     xtest = x_reduced(indexes_partitions{number_segments}(1):indexes_partitions{number_segments}(2),:);
     ytest = y_coded(indexes_partitions{number_segments}(1):indexes_partitions{number_segments}(2),:);

     xtrain = x_reduced(1:indexes_partitions{number_segments-1}(2),:);
     ytrain = y_coded(1:indexes_partitions{number_segments-1}(2),:);

 else

     xtest = x_reduced(indexes_partitions{i}(1):indexes_partitions{i}(2),:);
     ytest = y_coded(indexes_partitions{i}(1):indexes_partitions{i}(2),:);

     xtrain = [x_reduced(1:indexes_partitions{i-1}(2),:);...
         x_reduced(indexes_partitions{i+1}(1):indexes_partitions{number_segments}(2),:)];

     ytrain = [y_coded(1:indexes_partitions{i-1}(2),:);...
         y_coded(indexes_partitions{i+1}(1):indexes_partitions{number_segments}(2),:)];

 end
     
end

