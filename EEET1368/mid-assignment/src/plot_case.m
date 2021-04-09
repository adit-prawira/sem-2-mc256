function plot_case(Data, case_label)
    reference_signals = transpose(Data.signals.values(:, 1));
    output_signals = transpose(Data.signals.values(:, 2));

    t = transpose(Data.time);
    plot(t, reference_signals, 'r', 'LineWidth',2);
    str = strcat("$y(t) $Vs. $t$[s] Task ") + case_label;
    title(str,'Interpreter','LaTeX');

    hold on
    plot(t, output_signals, 'g', 'LineWidth',2);
    hold off

    xlabel('$t$ [s]','Interpreter','LaTeX'); 
    ylabel('$y(t)$','Interpreter','LaTeX');
    set(gca,'FontSize',18); set(gcf,'Position',[214 334 834 428]);
    legend('Reference Signals', 'Output Signals');
    grid on;
end
