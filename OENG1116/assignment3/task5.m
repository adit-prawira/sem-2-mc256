%% s3859061
clear
close all
clc
 

% ROD 1
L1 = 1.2;
A1 = 0.08*0.08;
rho1 = 4540;
E1 = 110*10^9;
N1 = 24;
h1 = L1/N1;
m1 = A1*1*rho1; % mass of rod 1
ke1 = ((E1*A1)/h1)*[1 -1; -1 1];
me1 = ((m1*h1)/6)*[2 1; 1 2];

% ROD 2
L2 = 0.8;
A2 = 0.07*0.07;
rho2 = 2700;
E2 = 69*10^9;
N2 = 16;
h2 = L2/N2;
m2 = A2*1*rho2; % mass of rod 2
ke2 = ((E2*A2)/h2)*[1 -1; -1 1];
me2 = ((m2*h2)/6)*[2 1; 1 2];
 
%Global system matrices
M = zeros((N1+N2+1),(N1+N2+1)); 
K = zeros((N1+N2+1),(N1+N2+1));

for i = 1 : N1
    index = [1 2] + (i - 1);
    M(index, index) = M(index, index) + me1;
    K(index, index) = K(index, index) + ke1;
end

for i = N1 + 1 : N1 + N2
    index = [1 2] + (i - 1);
    M(index, index) = M(index, index) + me2;
    K(index, index) = K(index, index) + ke2;    
end
 
V = 15; %velocity in m/s


%Initial conditions
x0 = zeros(1,length(M));
v0 = [zeros(1,N1) -V/2 -V*ones(1,N2)];
 
%Boundary Conditions
M(1,:)=[]; M(:,1)=[]; 

K(1,:)=[]; K(:,1)=[];

x0(1) = []; v0(1) = [];

IC = [x0 v0]'; %Initial condition

time = 0:0.0001:0.005;
 
[t,x1] = ode45(@(t,x) [x(length(M)+1:2*length(M),1);...
                M\(- K*x(1:length(K),1))],time,IC);
            
disp = x1(:,1:length(M)); 
vel = x1(:,length(M)+1:2*length(M));
xdir = [h1:h1:L1 L1+h2:h2:L1+L2];
figure; grid on; rotate3d on;
[TT,XX]=meshgrid(time,xdir);

surf(XX,TT,disp');
colormap jet; lighting phong; shading interp;

xlabel('t (s)'); 
ylabel('x (m)');
zlabel('u(x,t) (m)');

figure

plot(time, disp(:,end))
xlabel('t (s)'); 
ylabel('diplacement (m)');
grid on;

dispAndTime = [disp(:,end) time'];
index = find(time' == 0.001);
displacement = dispAndTime(index,1);
fprintf("displacement at t = 0.001s is %.1fmm\n", displacement*1000);


