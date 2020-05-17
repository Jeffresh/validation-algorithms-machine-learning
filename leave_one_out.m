function generalization_error = leave_one_out(x,y,order, train_function, predict_function, grade)
%KROSS_VALIDATION Summary of this function goes here
%   Detailed explanation goes here
number_segments = order;
 
indexes_partitions = get_indexs_kv_partitions(x',number_segments);

for j=1:number_segments
    [x_train,y_train, x_test,y_test] =  get_kv_partition(x',y',indexes_partitions,j);
    if nargin>5
      model = train_function(x_train',y_train',grade);
    else
      model = train_function(x_train',y_train');
    end
    wcp(j) = cost_function(x_test',y_test',model, predict_function);
end
generalization_error = mean(wcp);
end
