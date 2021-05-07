%% s3859061
clear
clc
close all

m = 2; % mass
g = 9.81; %gravity 
H = 7; % drop height
tmax= 3; % total simulation time
t=[0:0.01:1]*tmax;
alpha = 30; % incline angle

% Simulate segment AB to find the velocity of the mass when it bounced
xdotAB = @(t, x) ([x(2); -g ; x(4); 0]);

[tt,zz]=ode45(xdotAB,t,[H; 0; 0; 0]);

t_bounce= interp1(zz(:,1), tt, 0);
v_bounce = interp1(tt, zz(:,2), t_bounce);
%v_bounce = sqrt(2*g*H);

% Simulate segment BC with the bounce velocity
u = v_bounce; % set the bounce velocity as the initial velocity
z0 = 0;
h0 = 0;
v0z = abs(u)*cosd(alpha);
v0h = abs(u)*sind(alpha);

xdotBC = @(t, x) ([x(2); -g*cosd(alpha); x(4); g*sind(alpha)]);

[tt,zz]=ode45(xdotBC,t,[z0; v0z; h0; v0h]);

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
title('\bf Projectile (Without Air Drag)'); 
set(gca, 'FontSize',18); 

% print flip the values of z and h because we want to know the
% the position when z hits 0 again as it is the second bounce of the ball.
fprintf("Distance BC = %fm\n", interp1(Z, H, 0));