
if(~isempty(out.PIDResponse))
    Data = out.PIDResponse;
    figure(1);
    plot_case(Data, "3");
else
    fprintf("Dataset hasn't been declared in the workspace please run params3.m and the run sim3.slx\n");
end

