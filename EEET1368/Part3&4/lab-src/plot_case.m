function plot_case(Data, case_label)
    sum = 0;
    reference_signals = transpose(Data.signals.values(:, 1));
    control_signals = transpose(Data.signals.values(:, 2));
    output_signals = transpose(Data.signals.values(:, 3));

    t = transpose(Data.time);
    size = length(output_signals);
    for i = 1: size
        sum = sum + (reference_signals(i) - output_signals(i))^2;
    end
    fprintf("Case %s: Sum of squared errors = %f\n", case_label, sum);
    plot(t, reference_signals, 'r', 'LineWidth',2);
    str = strcat("$y(t)$Vs.$t$ [s] (PID Case ") + case_label+")";
    title(str,'Interpreter','LaTeX');

    hold on
    plot(t, control_signals, 'b', 'LineWidth',2);

    plot(t, output_signals, 'g', 'LineWidth',2);
    hold off

    xlabel('$t$ [s]','Interpreter','LaTeX'); 
    ylabel('$y(t)$','Interpreter','LaTeX');
    set(gca,'FontSize',18); set(gcf,'Position',[214 334 834 428]);
    legend('Reference Signals', 'Control Signals', 'Output Signals');
    grid on;
end
