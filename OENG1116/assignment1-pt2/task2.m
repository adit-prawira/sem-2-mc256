%% s3859061
clear
clc
close all
r = [-5 0 0 5; 5 -5 0 0; 0 2 -2 0; 0 3 2 -5]*0.01;
D = [0;0;1;3.1];
tmax = 2*24;
t = [0 tmax];
X0 = [0;0;0;0];
xd = @(t, x) r*x + D;

[tt,xx] = ode45(xd, t,X0);

plot(tt,xx, 'LineWidth', 2); 
hold on;

plot(48, interp1(tt, xx(:,1), 48), 'ro', 'LineWidth', 2);

grid on; 
legend('x_1','x_2','x_3','x_4');
xl=xlabel('t [hrs]'); 
yl=ylabel('x_i (i=1,2,3,4) [kg]');

fprintf("x1(48) = %f\n", interp1(tt, xx(:,1), 48));
