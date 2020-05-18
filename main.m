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


%% Simple validation to polynomial adjustment

max_polynom_grade = 30;
max_iterations = 1000;
test_data_percent = 70;

for polynom = 1:max_polynom_grade
    for i = 1:max_iterations
    error(i) = simple_validation(x,y,test_data_percent, @polynomial_train, @polynomial_predict,polynom);
    end
    mean_error(polynom)=(mean(error));
end

plot(mean_error)
legend('generalization error')
xlabel('polynomial grade')

%% Simple validation to a linear model  a + bx + x^2 + dx^3+ e*sin(x)

max_iterations = 1000;
test_data_percent = 70;


for i = 1:max_iterations
    error(i) = simple_validation(x,y,test_data_percent, @linear_model_1_train, @linear_model_1_predict);
end

mean_error=(mean(error));



%% Simple validation to a linear model  a + bx + x^2 + dx^3+ e*sin(x) + f*sin(x)

max_iterations = 1000;
test_data_percent = 70;

for i = 1:max_iterations
    error(i) = simple_validation(x,y,test_data_percent, @linear_model_2_train, @linear_model_2_predict);
end

mean_error=(mean(error));

%% Cross validation polynomial adjustment

max_polynom_grade = 30;
max_iterations = 23;
order = 10;

for polynom = 1:max_polynom_grade
    for i = 1:max_iterations
    error(i) = kross_validation(x,y,order, @polynomial_train, @polynomial_predict,polynom);
    end
    mean_error(polynom)=(mean(error));
end

plot(mean_error)
legend('generalization error')
xlabel('polynomial grade')

%% Cross validation to a linear model  a + bx + x^2 + dx^3+ e*sin(x)

max_iterations = 23;
order = 10;

for i = 1:max_iterations
error(i) = kross_validation(x,y,order, @linear_model_1_train, @linear_model_1_predict);
end

mean_error=(mean(error))


%% Cross validation to a linear model  a + bx + x^2 + dx^3+ e*sin(x) + f*sin(x)

max_iterations = 23;
order = 10;

for i = 1:max_iterations
error(i) = kross_validation(x,y,order, @linear_model_2_train, @linear_model_2_predict);
end

mean_error=(mean(error))


%% leave one out validation polynomial adjustment

max_iterations = 23;
order = 10;

for polynom = 1:max_polynom_grade
    for i = 1:max_iterations
    error(i) = leave_one_out(x,y,order, @polynomial_train, @polynomial_predict,polynom);
    end
    mean_error(polynom)=(mean(error));
end

plot(mean_error)
legend('generalization error')
xlabel('polynomial grade')

%% Leave one out to a linear model  a + bx + x^2 + dx^3+ e*sin(x)

max_iterations = 23;
order = 10;

for i = 1:max_iterations
error(i) = leave_one_out(x,y,order, @linear_model_1_train, @linear_model_1_predict);
end

mean_error=(mean(error))

%% Leave one out validation to a linear model  a + bx + x^2 + dx^3+ e*sin(x) + f*sin(x)

max_iterations = 23;
order = 10;

for i = 1:max_iterations
error(i) = leave_one_out(x,y,order, @linear_model_2_train, @linear_model_2_predict);
end

mean_error=(mean(error))



