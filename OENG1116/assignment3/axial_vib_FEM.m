clear
clc
close all

set(0,'DefaultFigureWindowStyle','docked');


L = 1;
e = 0.1;
E = 0.01*10^9;
rho = 1.02*10^3;
c = sqrt(E/rho);
A = (0.08*0.08);
EA = E*A;

NumFE = 50;

h = L/NumFE;
m = A*1*rho;
ke = (EA/h)*[1 -1; -1 1]; % stifness matrix
me= (m*h/6) * [2 1; 1 2]; % Consistent mass matrix
M = zeros([1, 1]*(NumFE + 1));
K = zeros([1, 1]*(NumFE + 1));

for i = 1 : NumFE
    idx = [1 2] + (i - 1);
    M(idx, idx) = M(idx, idx) + me;
    K(idx, idx) = K(idx, idx) + ke;
end

[U, D] = eig(K, M);

w1_exact = pi*sqrt(E/(rho * L^2));
figure;
grid on; hold on;
for i = 1 : NumFE + 1
    w_exact = (i-1)*w1_exact;
    w_FEM = sqrt(abs(diag(D(i,i))));
    fprintf("w_%d = %7.2f rad/s, ", i, w_FEM);
    fprintf("w_exact_%d = %7.2f rad/s \n", i, w_exact);
    % plot ith exact frequency
    plot(i, w_exact, 'ob', 'MarkerSize', 8);
    %plot ith FEM frequency
    plot(i, w_FEM, 'xr', 'MarkerSize', 8); 
end

str=sprintf('FEM frequencies (NumFE=%i)',NumFE); 
legend('exact frequencies',str,'Location','NorthWest'); 
xlabel('Freq. Number $r$','Interpreter','LaTeX'); 
ylabel('$\omega_r$ [rad/s]','Interpreter','LaTeX'); 
title('\bf FREE-FREE ROD');
xlim([1 NumFE+1]);
set(gca,'FontSize',16);
set(gcf,'Position', [65 14 1107 680]);
if NumFE<10
 set(gca,'XTick',[1:NumFE+1]); 
end
% commandwindow