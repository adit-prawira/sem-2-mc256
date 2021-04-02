T0 = 30;
Ts = 75;

k = log(44/45);
tmax = 200;
t = [0:0.01:1]*tmax;

T_xdot = @(t, T) k*(T-Ts);
[tt, TT] = ode45(T_xdot, t, T0);
T_exact = Ts +(T0-Ts)*exp(k*t);

% numerical approach plot
plot(tt,TT,'LineWidth',6,'Color','r','LineStyle','--'); 
grid on;
xlabel('$t$ [s]','Interpreter','LaTeX'); 
ylabel('$T(t)$ [$^\circ$]','Interpreter','LaTeX'); 
str = sprintf('Temperature: Time History ($$k$$=%4.3f, $$T_0$$=%g$$^\\circ C$$, $$T_s$$=%g$$^\\circ C$$)',k,T0,Ts);
title(str, 'Interpreter','LaTeX');
set(gca,'FontSize',16); set(gcf,'Position',[214 334 834 428]);


% plot representing the analytic approach plot
hold on;
plot(t,T_exact,'LineWidth',2,'Color','b');
legend('Numerical Solution','Exact Analytical Solution','Location','SouthEast');
axis([0 tmax T0 Ts]);