%% s3859061
clear
close all
clc

% ROD 1
L1 = 1.2;
a1 = 0.08*0.08;
rho1 = 4540;
E1 = 110*10^9;
N1 = 24;
h1 = L1/N1;
m1 = a1*1*rho1; % mass of rod 1
ke1 = ((E1*a1)/h1)*[1 -1; -1 1];
me1 = ((m1*h1)/6)*[2 1; 1 2];

% ROD 2
L2 = 0.8;
a2 = 0.07*0.07;
rho2 = 2700;
E2 = 69*10^9;
N2 = 16;
h2 = L2/N2;
m2 = a2*1*rho2; % mass of rod 2
ke2 = ((E2*a2)/h2)*[1 -1; -1 1];
me2 = ((m2*h2)/6)*[2 1; 1 2];

M=zeros([1,1]*(N1+N2+1));
K=zeros([1,1]*(N1+N2+1));
v0 = 15;

for i = 1 : N1
    idx = [1 2] + (i - 1);
    M(idx, idx) = M(idx, idx) + me1;
    K(idx, idx) = K(idx, idx) + ke1;
end

for i = N1 + 1 : N1 + N2
    idx = [1 2] + (i - 1);
    M(idx, idx) = M(idx, idx) + me2;
    K(idx, idx) = K(idx, idx) + ke2;
    
end

M(1,:)=[]; 
K(1,:)=[];
M(:,1)=[]; 
K(:,1)=[];

[U, D] = eig(K, M);

NumFE = N1 + N2;
h = h1 + h2;

tmax = 0.005;
x=[0:0.01:1]*h;
e = 0.1;

H1x = 1-x/h; 
H2x = x/h;

invMxK=M\K; 

% x0=[e; 0];

x0=[e*[1:NumFE]/NumFE, zeros(1,NumFE)]';
FEM_xdot_anon = @(t,x) [eye(NumFE)*x(NumFE+1:2*NumFE); -invMxK*x(1:NumFE)]; 

[tt,xx] = ode45(FEM_xdot_anon,[0 tmax],x0);
figure; 
plot(tt,xx(:,NumFE),'b','LineWidth',2); 
grid on;
xl=xlabel('$t$  [s]'); 
yl=ylabel('$u_2(t)$   [m]');
str=sprintf('$u_2$ Time History (Axial displacement of tip of fixed rod, modelled with %i FE)',NumFE); ti=title(str,'FontWeight','bold'); set([xl,yl,ti],'Interpreter','LaTeX');
set(gca,'FontSize',16);
set(gcf,'Position',[30 60  1200  700])

