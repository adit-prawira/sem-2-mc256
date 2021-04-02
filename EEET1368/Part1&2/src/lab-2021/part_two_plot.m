y1 = transpose(ScopeData.signals.values(:,1));
y2 = transpose(ScopeData.signals.values(:,2));
t = transpose(ScopeData.time);
plot(t, y1, 'r', 'LineWidth',2);
title('$y1(t)$Vs.$t$ [s] and $y2(s)$Vs.$t$ [s]','Interpreter','LaTeX')

hold on
plot(t, y2, 'b', 'LineWidth',2);
hold off

xlabel('$t$ [s]','Interpreter','LaTeX'); 
ylabel('$G(s)$','Interpreter','LaTeX');
set(gca,'FontSize',18); set(gcf,'Position',[214 334 834 428]);
legend('y1(t) vs t[s] (Step Signal)', 'y2(t) vs t[s] (Square Wave Signal)');
grid on;