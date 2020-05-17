function h = polynomial_predict(input,theta)
%PREDICT Summary of this function goes here
%   Detailed explanation goes here

len = length(theta)-1;

if len < 1
    len = 1;
else
    input = repmat(input,len,1);
    for i =1:len
        input(i,:)= input(i,:).^i;
    end
    
end


h =[ones(1,size(input,2));input]' *theta;

end