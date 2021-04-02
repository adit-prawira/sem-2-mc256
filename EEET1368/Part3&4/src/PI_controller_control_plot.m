control_signals_case1 = transpose(ControlScope.signals.values(:, 1));
control_signals_case2 = transpose(ControlScope.signals.values(:, 2));

t_control = transpose(ControlScope.time);

plot(t_control, control_signals_case1 , 'r', 'LineWidth',2);
title('$y(t)$Vs.$t$ [s] (PI controller control signals)','Interpreter','LaTeX');
hold on
plot(t_control, control_signals_case2, 'b', 'LineWidth',2);
hold off
xlabel('$t$ [s]','Interpreter','LaTeX'); 
ylabel('$y_c(t)$','Interpreter','LaTeX');
set(gca,'FontSize',18); set(gcf,'Position',[214 334 834 428]);
legend('Natural Frequency of 5', 'Natural Frequency of 0.5');
grid on;