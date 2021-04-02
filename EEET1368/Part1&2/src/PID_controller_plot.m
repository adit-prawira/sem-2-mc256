pid_signals_one = transpose(ScopeData.signals.values(:, 1));
pid_signals_two = transpose(ScopeData.signals.values(:, 2));
pid_alter_signals_one = transpose(ScopeData.signals.values(:, 3));
pid_alter_signals_two = transpose(ScopeData.signals.values(:, 4));

t = transpose(ScopeData.time);

plot(t, pid_signals_one, 'r', 'LineWidth',2);
title('$y(t)$Vs.$t$ [s] (PID Output Signals)','Interpreter','LaTeX')

hold on
plot(t, pid_signals_two, 'b', 'LineWidth',2);
plot(t, pid_alter_signals_one, 'LineWidth',2);
plot(t, pid_alter_signals_two, 'g', 'LineWidth',2);
hold off

xlabel('$t$ [s]','Interpreter','LaTeX'); 
ylabel('$y(t)$','Interpreter','LaTeX');
set(gca,'FontSize',18); set(gcf,'Position',[214 334 834 428]);
legend('PID Output Signals 1', 'PID Output Signals 1', ...
    'Alternative PID Output Signals 1', 'Alternative PID Output Signals 2');
grid on;