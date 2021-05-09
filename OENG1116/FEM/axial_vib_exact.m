clear
clc
close all

set(0,'DefaultFigureWindowStyle','docked');

L = 1;
e = 0.1;
E = 0.01*10^9;
rho = 1.2*10^3;
c = sqrt(E/rho);

tSim = 0.1;
t = [0 : 0.01 : 1]*tSim;
x = [0 : 0.02 : 1]*L;

[T, X] = meshgrid(t, x);

N = 100; % 100 iterations
U = 0; % initialize displacement as 0

for r = 1:N
    U = U + (((-1)^(r-1)/(2*r - 1)^2) .* ...
        sin(((2*r - 1)*pi*X)/(2*L)) .* ...
        cos(((2*r - 1)*pi*c*T)/(2*L))); 
end
U = U*(8*e*L)/pi^2;

%% PLOT SETUP
figure('Position',[10+10+10+940 -80 940 -80+600]);
surf(T,X,U);
axis([0 tSim 0 L -e e]); grid on;
xlabel('$t [s]$','Interpreter','LaTeX');
ylabel('$x [m]$','Interpreter','LaTeX');
zlabel('$u(x,t)$ [m]','Interpreter','LaTeX');
title('Exact analytical solution','FontWeight','bold');
rotate3d on;
hold on;
colormap jet; colorbar;
hh=camlight;
set(hh,'Position',[0.09,0.04,0.03])
view([23, 8]);
lighting phong; shading interp;
contour3(T,X,U,[-0.1:0.02:0.1],'k');
set(gca,'FontSize',16);