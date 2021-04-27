%% s3859061
clear
clc
close all

alpha = 30;
drop_height = 7;
m = 2;
g = 9.81;
tmax=3; 
t=[0:0.001:1]*tmax;

% initial parameters at B
v0 = sqrt(2*g*drop_height); % convervation enegry of no energy loss
z0 = 0;
h0 = 0;
v0z = v0*cosd(alpha);
v0h = v0*sind(alpha);

xdot = @(t, x) ([x(2); -g*cosd(alpha); x(4); g*sind(alpha)]);
[tt,zz]=ode45(xdot,t,[z0; v0z; h0; v0h]);

% ignore the first element because it indicates the first bounce
H = zz(2:end, 3);  
Z = zz(2:end, 1);

plot(H, Z,'LineWidth',3,'Color',[0 0.5 1]);
hold on;

plot(interp1(Z, H, 0), 0, 'ro', 'LineWidth', 2);
grid on; 
axis equal; 
xlabel('$h$ [m]','Interpreter','LaTeX'); 
ylabel('$z$ [m]','Interpreter','LaTeX');
title('\bf Projectile (No Air Drag)'); 
set(gca, 'FontSize',18); 

% print flip the values of z and h because we want to know the
% the position when z hits 0 again as it is the second bounce of the ball.
fprintf("Distance BC = %fm\n", interp1(Z, H, 0));