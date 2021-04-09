if(~isempty(out.PIDResponse))
    Data = out.PIDResponse;
    figure(1);
    plot_case(Data, "2");
else
    fprintf("Dataset hasn't been declared in the workspace please run params2.m and the run sim2.slx\n");
end

