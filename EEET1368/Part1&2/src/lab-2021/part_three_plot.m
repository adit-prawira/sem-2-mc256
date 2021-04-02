control_signals = transpose(ScopeData.signals.values(:,1));
output_signals = transpose(ScopeData.signals.values(:,2));
reference_signals = transpose(ScopeData.signals.values(:,3));

t = transpose(ScopeData.time);
plot(t, control_signals, 'r', 'LineWidth',2);
title('$y(t)$Vs.$t$ [s] (Closed-loop Control)','Interpreter','LaTeX')

hold on
plot(t, output_signals, 'b', 'LineWidth',2);

plot(t, reference_signals, 'g', 'LineWidth',2);
hold off

xlabel('$t$ [s]','Interpreter','LaTeX'); 
ylabel('$y(t)$','Interpreter','LaTeX');
set(gca,'FontSize',18); set(gcf,'Position',[214 334 834 428]);
legend('Control Signals', 'Output Signals', 'Reference Signals');
grid on;