function theta = train(X, Y, polynom_grade)
%TRAINING Summary of this function goes here
%   Detailed explanation goes here

    if polynom_grade > 1
        newX = repmat(X,polynom_grade,1);

        for i =1:polynom_grade
            newX(i,:)= newX(i,:).^i;
        end
        X = newX;
    end
    
    theta = normal_equation(X, Y);

end

