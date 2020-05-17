function theta = linear_model_1_train(x,y)
%LINEAR_MODEL_1_TRAIN Summary of this function goes here
%   Detailed explanation goes here
newx =[x;x.^2; x.^3; sin(x);];

theta = normal_equation(newx, y);

end

