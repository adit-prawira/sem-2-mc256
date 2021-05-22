clear; clc; close('all')
a=0.08; b=0.08; h=5; e=0.1; % Data in [m]

 
E=0.01*10^9;
rho=1.2*10^3;
tmax=0.4;
A=a*b; EA=E*A; m=rho*a*b*1;
% Young Modulus [Pa]
% density [kg/m^3]
% Simulation time [s]
x=[0:0.01:1]*h; H1x = 1-x/h; H2x = x/h; % Shape Functions
% --- SUPPLEMENTARY SYSTEM: Modelling rod with only 1 FE ---
ke=(EA/h)*[1 -1; -1 1]; me=(m*h/6)*[2 1; 1 2];
% --- MAIN SYSTEM: Constraining Left Boundary ---
me(:,1)=[]; me(1,:)=[]; ke(:,1)=[]; ke(1,:)=[];
invMxK=inv(me)*ke; x0=[e; 0];
FEM_xdot_anon = @(t,x) [x(2); -invMxK*x(1) ]; [tt,xx] = ode45(FEM_xdot_anon,[0 tmax],x0);
figure; plot(tt,xx(:,1),'b','LineWidth',2); grid on;
xl=xlabel('$t$ [s]'); yl=ylabel('$u_2(t)$ [m]')
str=sprintf('$u_2$ Time History (Axial displacement of tip of fixed rod, modelled with only 1 FE)'); ti=title(str,'FontWeight','bold');
set([xl,yl,ti],'Interpreter','LaTeX');
set(gca,'FontSize',16);
set(gcf,'Position',[120 30 1200 700])