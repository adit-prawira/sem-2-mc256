clear
clc
close all

D = 1000;
k1 = 0.08;
k2 = 0.1;
y0 = 0;
tmax = 20;
t = [0:0.01:1]*tmax;
y_xdot1 = @(t,y) k1*y + D;
y_xdot2 = @(t,y) k2*y + D;
[dt1, dy1] = ode45(y_xdot1, t, y0);
[dt2, dy2] = ode45(y_xdot2, t, y0);

y_exact1= 12500*exp((2*t)/25) - 12500;
y_exact2 = 10000*exp(t/10) - 10000;

plot(dt1,dy1,'LineWidth',6,'Color','r','LineStyle','--');
grid on;
xlabel('$t$ [s]','Interpreter','LaTeX'); ylabel('Balance $y(t)$, \$','Interpreter','LaTeX'); 
str = sprintf('Bank Balance: Time History ($$k1$$=%4.2f\\%%, $$k2$$=%4.2f\\%%, $$y_0$$=%g\\$, $$D$$=%g\\$)',k1*100,k2*100,y0,D);
title(str, 'Interpreter','LaTeX');
set(gca,'FontSize',16); 
set(gcf,'Position',[214 334 834 428]);

hold on; 
plot(t,y_exact1,'LineWidth',2,'Color','b');

plot(dt2,dy2,'LineWidth',6,'LineStyle','--');
plot(t,y_exact2,'LineWidth',2,'Color','g');

legend('Numerical Solution (8%)','Exact Analytical Solution (8%)',...
    'Numerical Solution (10%)','Exact Analytical Solution (10%)',...
    'Location','SouthEast');