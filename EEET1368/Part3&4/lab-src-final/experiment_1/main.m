% TODO: plot MeanSquaredError for each case

if(~isempty(out.CaseAData))
    Data = out.CaseAData;
    case_label =  "A";
    figure(1);
    plot_case(Data, case_label);
    figure(2);
    t = transpose(Data.time);
    mean_squared_errors = transpose(out.MeanSquared.signals.values(:, 1));
    plot(t, mean_squared_errors, 'r', 'LineWidth',2);
    str = strcat("Mean Squared Errors (PID Case ") + case_label+")";
    title(str,'Interpreter','LaTeX');
    grid on;
elseif (~isempty(out.CaseBData))
    Data = out.CaseBData;
    case_label =  "B";
    figure(1);
    plot_case(Data, case_label);
    figure(2);
    t = transpose(Data.time);
    mean_squared_errors = transpose(out.MeanSquared.signals.values(:, 1));
    plot(t, mean_squared_errors, 'r', 'LineWidth',2);
    str = strcat("Mean Squared Errors (PID Case ") + case_label+")";
    title(str,'Interpreter','LaTeX');
    grid on;
elseif(~isempty(out.CaseCData))
    Data = out.CaseCData;
    case_label =  "C";
    figure(1);
    plot_case(Data, case_label);
    figure(2);
    t = transpose(Data.time);
    mean_squared_errors = transpose(out.MeanSquared.signals.values(:, 1));
    plot(t, mean_squared_errors, 'r', 'LineWidth',2);
    str = strcat("Mean Squared Errors (PID Case ") + case_label+")";
    title(str,'Interpreter','LaTeX');
    grid on;
else
    fprintf("No data to be plotted\n");
end

