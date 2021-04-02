Data1 = out.CaseAData;
Data2 = out.CaseBData;
Data3 = out.CaseCData;

figure(1);
plot_case(Data1, "A");
figure(2);
plot_case(Data2, "B");
figure(3);
plot_case(Data3, "C");