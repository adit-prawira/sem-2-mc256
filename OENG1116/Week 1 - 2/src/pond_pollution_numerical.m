r=0.03*[-1 0 1; 1 -1 0; 0 1 -1];
D=[3; 0; 0]; 
X = [x1; x2; x3];
tmax = 48;
t = [0:0.01:1]*tmax;
X0 = [0;0;0];
maxx_xdot = @(t, x) r*x + D;

[dt, dX] = ode45(maxx_xdot, t, X0);
dx1 = dX(:,1);
dx2 = dX(:,2);
dx3 = dX(:,3);
plot(dt, dx1,'r-', dt ,dx2,'b--',dt,dx3,'k:','LineWidth',3); 
legend('x_1','x_2','x_3','Location','NorthWest');
xlabel('$t$ [hrs]','Interpreter','LaTeX');
ylabel('$x_i$ (i=1,2,3) [kg]','Interpreter','LaTeX');
grid on
title_label='Final pollutant amounts in ponds: ';
str=sprintf('%s$$x_1$$=%5.2f kg; $$x_2$$=%5.2f kg; $$x_3$$=%5.2f kg; TOTAL=%6.2f kg',title_label,dX(end,:),sum(dX(end,:))); 
title(str,'Interpreter','LaTeX')
set(gca,'FontSize',16); set(gcf,'Position',[488 -90 1361 852]);