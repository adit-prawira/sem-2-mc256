%%
clear; close all; clc
disp('>> ')
disp('>> ')
disp('>> ========= WELCOME TO THE OENG1116 TUTORIAL-3-Wk6 ===========')
disp('>> ')
disp('>> ')
disp('>> ')
disp('>> ')
commandwindow

%% ====================================================
disp('>> ========= COLORMAPS EXAMPLES ===========')
figure;
[X,Y,Z] = peaks(25);
surf(X,Y,Z);
colormap jet;
title('colormap jet')
pause(1)
%------------------
figure;
surf(X,Y,Z);
colormap hsv;
title('colormap hsv')
pause(1)
%------------------
figure;
surf(X,Y,Z);
colormap copper;
title('colormap copper')
pause(1)
%------------------
figure;
surf(X,Y,Z);
colormap cool;
title('colormap cool')
pause(1)
%------------------
figure;
surf(X,Y,Z);
colormap hot;
title('colormap hot')
pause(1)
%%
%
figure;
surf(X,Y,Z);
colormap summer;
title('colormap summer')
pause(1)
%
figure;
surf(X,Y,Z);
colormap spring;
title('colormap spring')
pause(1)
%------------------
%
figure;
surf(X,Y,Z);
colormap flag;
title('colormap flag')
pause(1)
%------------------
%
figure;
surf(X,Y,Z);
colormap prism;
title('colormap prism')
pause(1)

%commandwindow

%% ====================================================
clear; close all; clc; 
disp('>> ========= PLOTTING BASIC SPHERE ===========')
disp('>> clear; close all; clc; ')
disp('>> figure; hold on; ')
disp('>> axis equal; grid on')
disp('>> ')
disp('>> colormap jet;')
disp('>> [x,y,z]=sphere(36);')
disp('>> surf(x,y,z);')
disp('>> view(3);')
commandwindow

figure; hold on; 
axis equal; grid on

colormap jet;
[x,y,z]=sphere(36);
surf(x,y,z);
view(3);



%% ====================================================
clear; clc; close all;
disp('>> ========= MESHGRID EXAMPLE ===========')
disp('>> [X, Y] = meshgrid(-2:1:2, -3:3:3)')
disp('>> size(X)')
disp('>> size(Y)')
commandwindow
[X, Y] = meshgrid(-2:1:2, -3:3:3)
size(X)
size(Y)



%% ====================================================
clear; clc; close all;
disp('>> ========= ANOTHER MESHGRID EXAMPLE ===========')

disp('>> [X,Y] = meshgrid(-2:1:2, -3:3:3); ')
disp('>> Z = sin(X); ')
disp('>> surf(X,Y,Z); ')
disp('>> xlabel(''x''); ylabel(''y''); zlabel(''z''); ')
commandwindow

[X,Y] = meshgrid(-2:1:2, -3:3:3); 
Z = sin(X); 
surf(X,Y,Z); 
xlabel('x'); ylabel('y'); zlabel('z');

%% ====================================================
clear; clc; close all;
disp('>> ========= ANOTHER MESHGRID EXAMPLE ===========')

disp('>> [X,Y] = meshgrid(-2:0.5:2, -3:3:3); ')
disp('>> Z = sin(X); ')
disp('>> surf(X,Y,Z); ')
disp('>> xlabel(''x''); ylabel(''y''); zlabel(''z''); ')

[X,Y] = meshgrid(-2:0.5:2, -3:3:3); 
Z = sin(X); 
surf(X,Y,Z); 
xlabel('x'); ylabel('y'); zlabel('z');

%% ====================================================
clear; clc; close all;
disp('>> ========= BASIC "surf" PLOT ===========')
disp('>> ')
disp('>> figure; hold on; grid on; colorbar;')
disp('>> ')
disp('>> [X,Y] = meshgrid(-2: 1 : 2,   -3:1:3); ')
disp('>> Z=3*X+7*Y;')
disp('>> surf(X,Y,Z); view(40,25);')

disp('>> xl=xlabel(''$x$''); yl=ylabel(''$y$''); zl=zlabel(''$z$'');')
disp('>> set([xl,yl,zl], ''Interpreter'',''LaTeX'');')
disp('>> colormap jet; rotate3d on')
commandwindow


figure; hold on; grid on; colorbar;

[X,Y] = meshgrid(-2: 1 : 2,   -3:1:3); 
Z=3*X+7*Y;
surf(X,Y,Z); view(40,25);

xl=xlabel('$x$'); yl=ylabel('$y$'); zl=zlabel('$z$');
set([xl,yl,zl], 'Interpreter','LaTeX');
colormap jet; rotate3d on

%% ====================================================
clear; clc; close all;
disp('>> ========= OHTHER EXAMPLES OF SURFACES ===========')
[X,Y] = meshgrid(-8:.1:8);
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
 
figure
colormap hsv
surf(X,Y,Z,'FaceColor','interp',...
   'EdgeColor','none',...
   'FaceLighting','gouraud')
daspect([5 5 1])
axis tight
view(-50,30)
camlight left
xl=xlabel('$x$'); 
yl=ylabel('$y$'); 
zl=zlabel('$z$');
set([xl,yl,zl],'Interpreter','LaTeX');
set(gca,'FontSize',18);
rotate3d on

%% ====================================================
clc;
disp('>> ========= OHTHER EXAMPLES OF SURFACES ===========')
figure
colormap hsv
surf(X,Y,Z,'FaceColor','interp','FaceLighting','gouraud')
%   'EdgeColor','none',...
 
daspect([5 5 1])
axis tight
view(-50,30)
camlight left
xl=xlabel('$x$'); 
yl=ylabel('$y$'); 
zl=zlabel('$z$');
set([xl,yl,zl],'Interpreter','LaTeX');
set(gca,'FontSize',18);
rotate3d on


%% ====================================================
clear; clc; close all;
disp('>> ========= FEM example for the 2DOF Axial Rod ===========')
%---------------------------
 
h=21; u1=5; u2=50; % m
 
x=[0:0.01:1]*h;
 
H1x = 1-x/h; H2x = x/h;
 
figure;
%--------------------------
subplot(3,1,1)
plot(x,H1x,'r', x,H2x,'b','LineWidth',2);
h_legend=legend('H_1(x)','H_2(x)','Location','East'); 
ylabel('H_i (i=1,2)')
grid on
axis([0 h -.1 1.1])

%--------------------------
% Continuation of the Script
%--------------------------
subplot(3,1,2)
plot(x,u1*H1x,'r',  x,u2*H2x,'b','LineWidth',2);
legend('u_1H_1','u_2H_2','Location','best'); 
ylabel('u_iH_i (i=1,2)')
grid on
axis([0 h -1 51])
%--------------------------
subplot(3,1,3)
u = u1*H1x + u2*H2x;
plot(x,u,'k','LineWidth',2);
legend('u_1H_1 + u_2H_2','Location','East'); 
grid on
axis([0 h -1 51])
ylabel('u_1H_1+u_2H_2')
xlabel('x')
xC=14.1234; %Just an example: we would like to know u at this point
yC=interp1(x,u,xC);
line('XData',xC, 'YData',yC,'Marker','o','MarkerSize',8,'Color',[1 0 0])
set(gcf,'Position', [488 47 649 733])



%% ====================================================
clear; clc; close all;
disp('>> ========= FEM Example-2 for the 2DOF Axial Rod ===========')
%---------------------------
clear; clc; close('all')
h=21; 
x=[0:0.01:1]*h; H1x = 1-x/h; H2x = x/h; % Shape Functions
figure; a=0.08; b=0.08; h=5; u1=-0.1; u2=0.2; % Data in [m]
E=0.01*10^9;                          % Young Modulus [Pa]
%--------------------------
subplot(3,1,1)
plot(x,H1x,'r', x,H2x,'b','LineWidth',2);
h_legend=legend('H_1(x)','H_2(x)','Location','East'); 
ylabel('H_i (i=1,2)'); grid on; axis tight;
%--------------------------
subplot(3,1,2)
plot(x,u1*H1x,'r',  x,u2*H2x,'b','LineWidth',2);
legend('u_1H_1','u_2H_2','Location','best'); 
ylabel('u_iH_i (i=1,2)'); grid on; axis tight;
%--------------------------
subplot(3,1,3)
u = u1*H1x + u2*H2x;
plot(x,u,'k','LineWidth',2);
legend('u_1H_1 + u_2H_2','Location','East'); 
grid on; axis tight; ylabel('u_1H_1+u_2H_2'); xlabel('x');
set(gcf,'Position', [488    47   649   733])

%---------------------------
% Continuation of the Script for Example-2
%---------------------------
%
% --- ANALYSING AXIAL FORCES ---
A=a*b; EA=E*A;
% --- Calculate Forces using FEM ---
ke=(EA/h)*[1 -1; -1 1];
F=ke*[u1;u2];
disp(sprintf('=== Case: u1=%g; u2=%g; h=%g; E=%g; a=%g; b=%g',u1,u2,h,E,a,b))
disp(sprintf('F1=%12.2f [N]; F2=%12.2f [N]; ',F(1),F(2)))
 
% --- Checking Axial Forces using Hooke's Law ---
Fchk=(u2-u1)*EA/h;
disp(sprintf('Check by Hooke''s Law: |F|=%12.2f [N]',Fchk))
 
commandwindow




%% ====================================================
clear; clc; close all;
disp('>> ========= EXAMPLE: FEM modelling of axial rod ===========')
 
%=== ENTERING DATA =========
L=1; E=0.01*10^9; % Pa
rho=1.2*10^3; % kg/m^3
a=0.08; b=0.08; A=a*b; EA=E*A;
c=sqrt(E/rho); 
NumFE=50;
h=L/NumFE; m=A*1*rho;
 
%=== BUILDING [M] & [K] global matrices =========
ke=(EA/h)*[1 -1; -1 1];
me=(m*h/6)*[2 1; 1 2];
M=zeros([1,1]*(NumFE+1)); K=zeros([1,1]*(NumFE+1));
for ii=1:NumFE
    idx=[1 2]+(ii-1);     
    M(idx, idx)=M(idx, idx)+me;   K(idx, idx)=K(idx, idx)+ke;
end

%=== Solving Eigenvalue Problem =========
[U,D]=eig(K,M);
 
%=== Plotting FEM and exact frequencies =========
w1_exact=1*pi*sqrt(E/(rho*L^2));

figure; grid on; hold on;
for i=1:NumFE+1
    w_exact=(i-1)*w1_exact;
    w_FEM=sqrt(abs(diag(D(i,i))));
    disp(sprintf('w_%2i = %7.2f rad/s   w_exact_%2i = %7.2f rad/s',i,w_FEM,i,w_exact))
    plot(i,w_exact,'ob','MarkerSize',8); % plot i-th exact frequency
    plot(i,w_FEM,'xr','MarkerSize',8);   % plot i-th FEM frequency
end

%=== "Decorations": adding legend, labels and title =========
str=sprintf('FEM frequencies (NumFE=%i)',NumFE);
legend('exact frequencies',str,'Location','NorthWest');
xlabel('Freq. Number $r$','Interpreter','LaTeX');
ylabel('$\omega_r$ [rad/s]','Interpreter','LaTeX');
title('\bf FREE-FREE ROD');
%
xlim([1 NumFE+1]);
set(gca,'FontSize',16);
set(gcf,'Position', [65 14 1107  680]);
if NumFE<10, set(gca,'XTick',[1:NumFE+1]); end
commandwindow



%% ====================================================
clear; clc; close all;
disp('>> ========= Solving Response to Initial Conditions ===========')

% OENG1116-S1-2021
% Designed by Prof P.M.Trivailo (C) 2021
%---------------------------
a=0.08; b=0.08; h=5; e=0.1; % Data in [m]
E=0.01*10^9;                % Young Modulus [Pa]
rho=1.2*10^3;               % density [kg/m^3]
tmax=0.4;                   % Simulation time [s]
A=a*b; EA=E*A; m=rho*a*b*1;

x=[0:0.01:1]*h; H1x = 1-x/h; H2x = x/h; % Shape Functions
% --- SUPPLEMENTARY SYSTEM: Modelling rod with only 1 FE ---
ke=(EA/h)*[1 -1; -1 1]; me=(m*h/6)*[2 1; 1 2];
% --- MAIN SYSTEM: Constraining Left Boundary ---
me(:,1)=[]; me(1,:)=[]; ke(:,1)=[]; ke(1,:)=[];
 
invMxK=inv(me)*ke; x0=[e; 0]';
FEM_xdot_anon = @(t,x) [x(2); -invMxK*x(1) ];
[tt,xx] = ode45(FEM_xdot_anon,[0 tmax],x0);
figure; plot(tt,xx(:,1),'b','LineWidth',2); grid on;

xl=xlabel('$t$  [s]'); yl=ylabel('$u_2(t)$   [m]')
str=sprintf('$u_2$ Time History (Axial displacement of tip of fixed rod, modelled with only 1 FE)');
ti=title(str,'FontWeight','bold');
set([xl,yl,ti],'Interpreter','LaTeX');
set(gca,'FontSize',16);
set(gcf,'Position',[120 30  1200  700])



%% ====================================================
clc; close all;
disp('>> ========= Plot x-t-u with "u" contour lines ===========')
% OENG1116-S1-2021
% Designed by Prof P.M.Trivailo (C) 2021
%---------------------------
%
figure; hold on; grid on; rotate3d on; 
[TT,XX]=meshgrid(tt,[0 h]);
ZZ=[0*xx(:,1)'; xx(:,1)'];
surf(TT,XX,ZZ); 
colormap jet; lighting phong; shading interp;
contour3(TT,XX,ZZ,[-1:0.2:1]*e,'k'); 
view([-46, 36]); 
%--- "Decorations" ---
colorbar; hh=camlight;
set(hh,'Position',[0.09,0.04,0.03]); 
xl=xlabel('$t [s]$'); yl=ylabel('$x [m]$'); zl=zlabel('$u(x,t)$ [m]');
set([xl,yl,zl],'Interpreter','LaTeX');
str=sprintf('FEM solution for NumFE=1');
title(str,'FontWeight','bold');
set(gca,'FontSize',16);
set(gcf,'Position',[120   300   920   450]); 



%% ====================================================
clc; 
disp('>> ========= Plot x-u-t with "t" contour lines ===========')
% Continuation of the Script
% Designed by Prof P.M.Trivailo (C) 2021
%---------------------------
%
figure; hold on; grid on; rotate3d on; 
surf(XX,ZZ,TT); 
colormap jet; 
lighting phong; shading interp;
contour3(XX,ZZ,TT,[0:0.02:1]*tmax,'k'); 
view([-46, 6]);
 
%--- "Decorations"
colorbar; hh=camlight;
set(hh,'Position',[2,-4, 0.11]);
zl=zlabel('$t [s]$'); xl=xlabel('$x [m]$'); yl=ylabel('$u(x,t)$ [m]');
set([xl,yl,zl],'Interpreter','LaTeX');
str=sprintf('FEM solution for NumFE=1');
title(str,'FontWeight','bold');
set(gca,'FontSize',16);
set(gcf,'Position',[488   10   560   814]); 


%% ====================================================
clc;
disp('>> ========= Plot x-u-t with "x" contour lines ===========')

% Continuation of the Script
% Designed by Prof P.M.Trivailo (C) 2021
%---------------------------
%
figure; hold on; grid on; rotate3d on; 
surf(ZZ,TT,XX);
colormap jet; 
lighting phong; shading interp;
contour3(ZZ,TT,XX,[0:0.05:1]*h,'k'); 
view([-70, 20]);
 
%--- "Decorations"
colorbar; hh=camlight;
set(hh,'Position',[-0.4, -1.2, 2]);
yl=ylabel('$t [s]$'); zl=zlabel('$x [m]$'); xl=xlabel('$u(x,t)$ [m]');
set([xl,yl,zl],'Interpreter','LaTeX');
str=sprintf('FEM solution for NumFE=1');
title(str,'FontWeight','bold');
set(gca,'FontSize',16);
set(gcf,'Position',[40 80  1120   470]); 



%%
clear; close all; clc
disp('>> ')
disp('>> ')
disp('>> ========= END OF THE TUTORIAL-3 ===========')
disp('>> ')
disp('>> ')
disp('>> ========= THANK YOU FOR YOUR PARTICIPATION !!! ===========')
disp('>> ')
disp('>> ')
commandwindow
