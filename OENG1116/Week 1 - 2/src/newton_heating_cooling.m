% Parametes
tt = [0:0.01:1]*200;
T0 = 30; % Initial temperature of the metal bar

% Temperature of the surroundings in this case is the container
% filled with 75 Celcius water.
Ts = 75;

% value of k derived from model.
k = log(44/45);

% differential equation of the dT/dt
syms T(t)
ode = diff(T,t) == k*(T - Ts);
cond = T(0)==T0;
ySol(t) = dsolve(ode, cond);

TT = eval(subs(ySol, {t}, {tt}));

figure;
plot(tt, TT, 'r', 'LineWidth', 2);
hold on;
grid on;

%%%%%%%%%%%%%%%%% PLOT DECORATION %%%%%%%%%%%%%%%%%
line('XData',tt(1),'YData',TT(1),'Marker','.','MarkerSize',24,'Color','r');

% the point that indicates at what time the metal bar reach temprature of
% 70 Celcius
t70=interp1(TT,tt,70);
line('XData',t70,'YData',70,'Marker','.','MarkerSize',24,'Color','k');
line('XData',t70,'YData',T0,'Marker','.','MarkerSize',24,'Color','k');
line('XData',[1 1]*t70,'YData',[T0 70],'LineStyle','--','Color','k');
line('XData',[0 1]*t70,'YData',[1 1]*70,'LineStyle','--','Color','k');
text('String',sprintf('$t_{70}=%6.2f$ s ',t70),'Interpreter','LaTeX','Color','k','FontSize',16,...
    'Position',[t70 T0],'VerticalAlignment','bottom','HorizontalAlignment','right');
text('String','$70^\circ$C','Interpreter','LaTeX','Color','k','FontSize',16,...
    'Position',[0 70],'VerticalAlignment','top');

% the point that indicates at what time the metal bar reach temprature of
% 74 Celcius
t74=interp1(TT,tt,74);
line('XData',t74,'YData',74,'Marker','.','MarkerSize',24,'Color','b');
line('XData',t74,'YData',T0,'Marker','.','MarkerSize',24,'Color','b');
line('XData',[1 1]*t74,'YData',[T0 74],'LineStyle','--','Color','b');
line('XData',[0 1]*t74,'YData',[1 1]*74,'LineStyle','--','Color','b');
text('String',sprintf('$t_{74}=%6.2f$ s ',t74),'Interpreter','LaTeX','Color','b','FontSize',16,...
    'Position',[t74 T0],'VerticalAlignment','bottom','HorizontalAlignment','right');
text('String','$74^\circ$C','Interpreter','LaTeX','Color','b','FontSize',16,...
    'Position',[0 74],'VerticalAlignment','top');
grid on; xlabel('$t$, s','Interpreter','LaTeX'); 
ylabel('$T$, $^\circ$ C','Interpreter','LaTeX');
set(gcf,'Position',[214   334   834   428]);