function Theta = normal_equation(X,Y)
new_X = [ones(1,size(X,2)); X]';
Theta = pinv(new_X' * new_X) *new_X' * Y';
end