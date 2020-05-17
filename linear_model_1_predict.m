function ypredicted = linear_model_1_predict(points,theta)
%LINEAR_MODEL_1_PREDICT Summary of this function goes here
%   Detailed explanation goes here
points = [points;points.^2; points.^3;sin(points)];
ypredicted =[ones(1,size(points,2));points]' *theta;
end

