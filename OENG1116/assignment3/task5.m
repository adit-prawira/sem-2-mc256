%%s3838184
clear
close all
clc

global M_Global K_Global
% data for rod 1
L1 = 1.2;  %length
a1 = 0.08; %side length
rho1 = 4540; %density
E1 = 110e9; %elastic modulus
ne1 = 24; %number of elements
le1 = L1/ne1; %element length
A1 = a1*a1; %CSA

%elemental mass matrix
m1 = rho1*A1; 
me1 = ((m1*le1)/6)*[2 1; 1 2];

%elemental stiffness matrix
ke1 = ((E1*A1)/le1)*[1 -1; -1 1];

% data for rod 2
L2 = 0.8;  %length
a2 = 0.07; %side length
rho2 = 2700; %density
E2 = 69e9; %elastic modulus
ne2 = 16; %number of elements
le2 = L2/ne2; %element length
A2 = a2*a2; %CSA

%elemental mass matrix
m2 = rho2*A2; 
me2 = ((m2*le2)/6)*[2 1; 1 2];

%elemental stiffness matrix
ke2 = ((E2*A2)/le2)*[1 -1; -1 1];

%Global system matrices
M_Global = zeros((ne1+ne2+1),(ne1+ne2+1)); 
K_Global = zeros((ne1+ne2+1),(ne1+ne2+1));

for i = 1 : ne1
    index = [1 2] + (i - 1);
    M_Global(index, index) = K_Global(index, index) + me1;
    K_Global(index, index) = K_Global(index, index) + ke1;
end

for i = ne1 + 1 : ne1 + ne2
    index = [1 2] + (i - 1);
    M_Global(index, index) = M_Global(index, index) + me2;
    K_Global(index, index) = K_Global(index, index) + ke2;    
end

V = 15; %velocity in m/s
%Initial conditions
x0 = zeros(1,length(M_Global));
v0 = [zeros(1,ne1) -V/2 -V*ones(1,ne2)];

%Boundary Conditions
M_Global(1,:)=[]; M_Global(:,1)=[]; 
K_Global(1,:)=[]; K_Global(:,1)=[];

x0(1) = []; v0(1) = [];

IC = [x0 v0]'; %Initial condition
TIME = 0:0.00005:0.005;

[t,x1] = ode45(@(t,x) task5_fun(t,x),TIME,IC);
disp = x1(:,1:length(M_Global)); 
vel = x1(:,length(M_Global)+1:2*length(M_Global));

xdir = [0:le1:L1 L1+le2:le2:L1+L2];
figure; grid on; rotate3d on;
[TT,XX]=meshgrid(TIME,xdir);
surf(TT,XX,disp');
colormap jet; lighting phong; shading interp;
xlabel('t (s)'); ylabel('x (m)');
zlabel('u(x,t) (m)');
figure
plot(TIME, disp(:,end))
xlabel('t (s)'); ylabel('diplacement (m)')

fprintf("uQ = %fmm\n", interp1(disp(:,end), TIME, 0.001)*1000);


function X_dt = task5_fun(t,x)
    global M_Global K_Global
    X_dt = [x(length(M_Global)+1:2*length(M_Global),1);...
            M_Global\(- K_Global*x(1:length(K_Global),1))];   
end