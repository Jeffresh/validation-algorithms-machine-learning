function  plot_data (x,y)
%plot_data Plots the data.

plot(x,y,'rx','MarkerSize', 10);
axis([0,1.5,0, 15])
ylabel('Y values');
xlabel('X generated values'); 

end