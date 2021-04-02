m = 10;
c = 10;
k = 100;
q0 = 3;
q0dot = 15;
tmax = 6;
t = [0:0.01:1]*tmax;
A = [0 1; -k/m -c/m];
B = [0; 1/m];
F = 0;
mck_xdot = @(t,x) A*x + B*F;

[dt, dx] = ode45(mck_xdot, t, [q0; q0dot]);

plot(t,dx(:,1),'LineWidth',3,'Color',[0 0.5 1]);
grid on; 
xlabel('$t$ [s]','Interpreter','LaTeX');
ylabel('$q$ [m]','Interpreter','LaTeX');
str1='\bf Free Vibration of Mass-Damper-Spring System: Time History '; 
str2=sprintf('(m=%g kg; c=%g N*s/m; k=%g N/m)',m,c,k);
title([str1 str2]);
set(gca, 'FontSize',16); set(gcf,'Position',[240 -50 1200 750]);