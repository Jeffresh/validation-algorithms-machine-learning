function J = cost_function(X, y, theta, predict_function)
%COST_FUNCTION Summary of this function goes here
%   Detailed explanation goes here

h = predict_function(X,theta);
J = 1/(2*length(y)) * sum(h-y').^2;

end
