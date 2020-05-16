%% generate data 
clear all, close all
rand('seed', 0);
randn('seed', 0);
x = rand(1,100);
y = exp(x.^3 - x.^2 + 0.01*x + 2) + 0.04 * randn(size(x));

plot_data(x,y)


%% Polynomial model

grade = 2;

points = linspace(0,1.5,100);

theta = train(x,y,grade);

ypredicted = predict(points, theta);

plot_data(x,y), hold on
plot(points,ypredicted, '-');hold off
legend('Training data', ['Polynomial regression Grade:' num2str(grade,'%d')])

