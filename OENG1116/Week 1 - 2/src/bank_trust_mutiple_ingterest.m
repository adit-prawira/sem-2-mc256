clear
clc
close all

D = 1000;
y0 = 0;
tmax = 20;
years = [0:0.01:1]*tmax;

interest_rates = [10:-1:5]; % [10% 9% 8% ... 5%]
size = length(interest_rates);
labels = [];

syms y(t)
for i = 1: size
    k = interest_rates(i)/100;
    ode = diff(y,t) == k*y + D;
    initial_balance = y(0) == y0;
    y_solution(t) = dsolve(ode, initial_balance);
    y_solution_max = eval(y_solution(tmax));
    label=sprintf('k=%3i%%: Balance y(%i yrs) = $%8.2f',interest_rates(i),tmax,y_solution_max); 
    if i==size
        labels=[labels,'''',label,''''];
    else
        labels=[labels,'''',label, '''', ','];
    end 
    hold on
    plot(years,y_solution(years),'LineWidth',2);
end
grid on; 
xlabel('$t$, yrs','Interpreter','LaTeX'); 
ylabel('Balance $$y$$, \$','Interpreter','LaTeX'); 
str3=sprintf('Annual Contribution: $%g',D); 
title(str3);
set(gca,'FontSize',16); 
set(gcf,'Position',[214 334 834 428]);
eval(['lg=legend(',labels,')']); 
set(lg,'Location','NorthWest');

