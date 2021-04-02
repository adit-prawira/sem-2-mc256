% parameters
m = 10;
c = 16;
k = 10000;
% initial conditions
q0 = 0;
q0_dot = 0;
tmax = 4;
t = [0:0.001:1]*tmax;
A = [0 1; -k/m -c/m];
B = [0; 1/m];

mck_xdot = @(t,x) A*x + B*(-1000*(t <= 2) + 500*(t > 2));
F = @(t) -500*(t <= 2) + 1000*(t > 2);

[dt, dx] = ode45(mck_xdot, t, [q0; q0_dot]);

%--------------------
subplot(2,1,1); 
plot(t,F(t),'LineWidth',3,'Color','r'); 
grid on; 
xlabel('$t$ [s]','Interpreter','LaTeX'); 
ylabel('$F$ [N]','Interpreter','LaTeX');
axis([0 tmax -600 1100]);
set(gca, 'FontSize',16);
%--------------------
str1='\bf Free Vibration of Mass-Damper-Spring System: Time History '; 
str2=sprintf('(m=%g kg; c=%g N*s/m; k=%g N/m)',m,c,k);
title([str1 str2]);
%--------------------
subplot(2,1,2); 
plot(t,dx(:,1),'LineWidth',3,'Color',[0 0.5 1]); 
grid on;
xlabel('$t$ [s]','Interpreter','LaTeX'); 
ylabel('$q$ [m]','Interpreter','LaTeX');
set(gca, 'FontSize',16);
set(gcf,'Position',[ 240 -50 1200 750]);
t=[0:0.01:1]; y=cos(2*pi*t); plot(t,y,'r'); grid on; hold on; xlabel('t'); ylabel('y');
t2=[0:0.1:1]; y2=interp1(t,y,t2); plot(t2,y2,'k-o','LineWidth',2);