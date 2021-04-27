
clear; close all; clc
m=10; coeff=0.6; 
th=45*pi/180;   
v0=10;           
z0=0; h0=0;       
g=9.81;
t=[0:0.01:1]*1.3;
v0h=v0*cos(th); v0z=v0*sin(th); 
 
figure; grid on; hold on; axis equal; 
pr_xdot = @(t, x) ([x(2); -9.81-coeff*x(2)*sqrt(x(2)^2+x(4)^2)/m;...
    x(4); -coeff*x(4)*sqrt(x(2)^2+x(4)^2)/m]);
[tt,zz]=ode45(pr_xdot,t,[z0; v0z; h0; v0h]);
plot(zz(:,3), zz(:,1),'LineWidth',3,'Color',[0 0.5 1]);
xlabel('$h$ [m]','Interpreter','LaTeX');
ylabel('$z$ [m]','Interpreter','LaTeX');
title('\bf Projectile (With Air Drag): Time History');
set(gca, 'FontSize',18);
set(gcf,'Position', [20 80 1270  680]);
 
g=line('XData',h0,'YData',z0,'Marker','.','MarkerSize',48);
for i=1:length(tt),
    set(g,'XData',zz(i,3),'YData',zz(i,1)); drawnow;   pause(0.01);
end