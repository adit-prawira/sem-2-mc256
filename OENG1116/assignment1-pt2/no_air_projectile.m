
clear; close all; clc
th=45*pi/180; % red      ^ z 
v0=10;        % m/s      |
z0=0; h0=0;    % m        +--------------> h
tmax=2; t=[0:0.01:1]*tmax;
v0h=v0*cos(th); v0z=v0*sin(th); 
pr_xdot = @(t, x) ([x(2); -9.81; x(4); 0]);
[tt,zz]=ode45(pr_xdot,t,[z0; v0z; h0; v0h]);
plot(zz(:,3), zz(:,1),'LineWidth',3,'Color',[0 0.5 1]);
grid on; axis equal;
xlabel('h [m]'); 
ylabel('z [m]');
title('\bf Projectile (No Air Drag): Time History');
set(gca, 'FontSize',18); hold on;
g=line('XData',h0,'YData',z0,'Marker','.','MarkerSize',48); 
for i=1:length(tt)
   set(g,'XData',zz(i,3),'YData',zz(i,1)); drawnow; pause(0.01); 
end