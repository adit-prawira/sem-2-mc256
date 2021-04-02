% TODO: plot MeanSquaredError for each case

if(~isempty(out.CaseAData))
    Data = out.CaseAData;
    figure(1);
    plot_case(Data, "A");
elseif (~isempty(out.CaseBData))
    Data = out.CaseBData;
    figure(1);
    plot_case(Data, "B");
elseif(~isempty(out.CaseCData))
    Data = out.CaseCData;
    figure(1);
    plot_case(Data, "C");
else
    fprintf("No data to be plotted\n");
end

