clear
clc
close all
y0 = 0;
k1 = 0.08;
k2 = 0.1;
D = 1000;
t = [0:0.01:1]*20;
y_t1 = 12500*exp((2*t)/25) - 12500;

y_t2 = 10000*exp(t/10) - 10000;

plot(t, y_t1,'LineWidth',2,'Color','b');
grid on;
xlabel('$t$ [s]','Interpreter','LaTeX'); ylabel('Balance $y(t)$, \$','Interpreter','LaTeX'); 
str = sprintf('Bank Balance: Time History ($$k1$$=%4.2f\\%%, $$k2$$=%4.2f\\%%, $$y_0$$=%g\\$, $$D$$=%g\\$)',k1*100,k2*100,y0,D);
title(str, 'Interpreter','LaTeX');
set(gca,'FontSize',16); 
set(gcf,'Position',[214 334 834 428]);

hold on;
plot(t, y_t2, 'r', 'LineWidth', 2);
legend("8% Interets", "10% Interest");
hold off;