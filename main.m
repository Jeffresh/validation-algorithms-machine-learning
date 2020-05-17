%% generate data 
clear all, close all
rand('seed', 0);
randn('seed', 0);
x = rand(1,100);
y = exp(x.^3 - x.^2 + 0.01*x + 2) + 0.04 * randn(size(x));

plot_data(x,y)


%% Polynomial model

close all

grade = 2;

theta = polynomial_train(x,y,grade);
points = linspace(0,1.5,100);
ypredicted = polynomial_predict(points, theta);

plot_data(x,y), hold on
plot(points,ypredicted, '-');hold off
legend('Training data', ['Polynomial regression Grade:' num2str(grade,'%d')])

%% fit to a linear model  a + bx + x^2 + dx^3+ e*sin(x)
close all

theta = linear_model_1_train(x,y);
points = linspace(0,1.5,100);
ypredicted = linear_model_1_predict(points,theta);

plot_data(x,y), hold on
plot(points,ypredicted, '-');hold off


%% fit to a linear model a + bx + x^2 + dx^3+ e*sin(x) + f*sin(x)
close all

theta = linear_model_2_train(x,y);
points = linspace(0,1.5,100);
ypredicted = linear_model_2_predict(points,theta);

plot_data(x,y), hold on
plot(points,ypredicted, '-');hold off