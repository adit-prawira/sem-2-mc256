clear
clc
close all
g = 9.81;
drop_height = 7;
% Initial Conditions: 
v0=sqrt(2*g*drop_height);  % m/s         
z0=drop_height;   % m           
tmax=3; % s           
t=[0:0.01:1]*tmax;
xdot = @(t, x) ([x(2); -9.81]);
[tt,zz]=ode45(xdot,t,[z0; v0]);
plot(tt,zz(:,1),'LineWidth',3,'Color',[0 0 1]);
grid on; xlabel('t [s]'); 
ylabel('z[m]');
title('Falling  Mass (No Air Drag): Time History');
set(gca, 'FontSize',12);