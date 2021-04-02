I_0 = 0;
I_f = 30;
k = log(30/11)/0.01;
t_max = 0.1;

t = [0:0.01:1]*t_max;

I_xdot = @(t, I) -k*(I - I_f); % dI/dt = -k*(I - If);
[tt, TT] = ode45(I_xdot, t, I_0);
I_exact = 30*exp(-k*t);

plot(tt, TT, 'LineWidth', 6, 'Color' , 'r', 'LineStyle', '--');
xlabel('$t$ [s]','Interpreter','LaTeX'); 
ylabel('$I(t)$ [$\cal A$]','Interpreter','LaTeX');
str = sprintf('El.Current: Time History ($$k$$=%4.3f, $$I_0$$=%g$$\\cal A$$, $$I_f$$=%g$$\\cal A$$)',k,I_0,I_f);
title(str, 'Interpreter','LaTeX');
set(gca,'FontSize',16); set(gcf,'Position',[214 334 834 428]);

hold on;
plot(t, I, 'b', 'LineWidth', 2);
legend("Numerical Model", "Exact Analytic Mode");

grid on;