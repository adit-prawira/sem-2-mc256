
if(~isempty(out.PIResponse))
    Data = out.PIResponse;
    figure(1);
    plot_case(Data, "1");
else
    fprintf("Dataset hasn't been declared in the workspace please run params1.m and the run sim1.slx\n");
end

