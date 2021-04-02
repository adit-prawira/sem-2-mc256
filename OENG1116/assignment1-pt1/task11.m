x=-5:0.01:5;
y1 = x.^2-5;
y2 = sqrt(x-5);

plot(x,y1,'LineWidth',2);

hold on 
plot(x, y2,'LineWidth',2);
hold off
grid on;