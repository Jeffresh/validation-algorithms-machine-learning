function generalization_error = simple_validation(x,y,test_data_percent, train_function, predict_function, grade)
%SIMPLE_VALIDATION Summary of this function goes here
%   Detailed explanation goes here



trn_data_length = round((length(x) * test_data_percent)/100,0);
data_indexes = randperm(length(x));

xtrn = x(data_indexes(1:trn_data_length));
xtest = x(data_indexes(trn_data_length+1:end));

ytrn = y(data_indexes(1:trn_data_length));
ytest = y(data_indexes(trn_data_length+1:end));

if nargin>5
  model = train_function(xtrn,ytrn,grade);
else
  model = train_function(xtrn,ytrn);
end

generalization_error = cost_function(xtest,ytest,model, predict_function);
end

