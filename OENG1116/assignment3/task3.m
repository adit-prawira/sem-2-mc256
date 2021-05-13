%% s3859061
clear
clc
close all
set(0,'DefaultFigureWindowStyle','docked') 

L = 4;
rho = 1200;
W = 0.125;
H = 0.042; 
E = 17.2*10^9; % N/m^2

Nfe = 2;
M  = 1000; % magnitude of each torque (Nm)

I=W*H^3/12;
h = L/Nfe;
m = 7500*W*H;
dof = (Nfe + 1)*2;

%% Stifness matrix
ke = [12 6*h -12 6*h;...
    6*h 4*h^2 -6*h 2*h^2;
    -12 -6*h 12 -6*h;
    6*h 2*h^2 -6*h 4*h^2];
ke = ((E*I)/H^3).* ke;

KK = zeros(dof, dof);

%% Constant mass matrix
me = [156 22*h 54 -13*h;...
    22*h 4*h^2 13*h -3*h^2;...
    54 13*h 156 -22*h;...
    -13*h -3*h^2 -22*h 4*h^2];
me = ((m*h)/420).*me;
MM = zeros(dof, dof);

%%
for i=1:Nfe
    idx = [1:4] + (i-1)*2; 
    KK(idx,idx)=KK(idx,idx)+ke; 
    MM(idx,idx)=MM(idx,idx)+me;
end

MM(dof,:)=[]; KK(dof,:)=[];MM(:,dof)=[]; KK(:,dof)=[];
MM(1,:)=[]; KK(1,:)=[];MM(:,1)=[]; KK(:,1)=[];
[U, D] = eig(KK, MM);
w1_exact = pi*sqrt(E/(rho * L^2));

for i = 1 : Nfe + 1
    w_exact = (i-1)*w1_exact;
    w_FEM = sqrt(abs(diag(D(i,i))));
    fprintf("w_%d = %7.2f rad/s, ", i, w_FEM);
    fprintf("w_exact_%d = %7.2f rad/s \n", i, w_exact);
    % plot ith exact frequency
    plot(i, w_exact, 'ob', 'MarkerSize', 8);
    %plot ith FEM frequency
    plot(i, w_FEM, 'xr', 'MarkerSize', 8); 
end
% 
% str=sprintf('FEM frequencies (Nfe=%i)',Nfe); 
% legend('exact frequencies',str,'Location','NorthWest'); 
% xlabel('Freq. Number $r$','Interpreter','LaTeX'); 
% ylabel('$\omega_r$ [rad/s]','Interpreter','LaTeX'); 
% title('\bf FREE-FREE ROD');
% xlim([1 Nfe+1]);
% set(gca,'FontSize',16);
% set(gcf,'Position', [65 14 1107 680]);
% if Nfe<10
%  set(gca,'XTick',[1:Nfe+1]); 
% end