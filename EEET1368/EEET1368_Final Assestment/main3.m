clear
close all
clc

% Define transfer function
num=2;
den=[1 0 1];
Gs = tf(num, den);

%% equivalance to G(s) = b/(s^2 + a1*s + a0)
b=2;
a0=1;
a1=0;

delay=0;
% umin = -10000;
% umax =10000;

umin = -1*0.9;
umax = 5*0.9;
dAmp = -3; % disturbance amplitude

Tsim=10; % simulation time
deltat=0.01; % sampling interval



%% Controller design
alpha3 = 4;
wn=3;
zeta=0.707;

K1 = (wn^2 - a0)/b; 
K2 = (2*zeta*wn - a1)/b;
K3 = alpha3/b;

tauD = K2/K1;
tauf = 0.1*tauD;

sim('PIDEstimator')

figure(1)
plot(t,y)
grid on
hold on
%axis([-0 3 -1 2])
set(gca,'FontSize',20,'FontName','helvetica');
ylabel('Output')
xlabel('Time (sec)')
figure(2)
plot(t,u)
grid on
hold on

%axis([-0 3 -450 450])
set(gca,'FontSize',20,'FontName','helvetica');
ylabel('Control')
xlabel('Time (sec)')