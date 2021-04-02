if(exist('out', 'var'))
    Data = out.CaseData;
    figure(1);
    plot_case(Data, "C");
else
    fprintf("ERROR: Run the simulink program to produce CaseData object\n");
end
