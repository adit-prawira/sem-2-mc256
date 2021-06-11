clear
close all 
clc

%% Parameters to update
num=2;
den=conv([1 0.1],[1 20 100]);
Gs= tf(num, den);

delay=0.5;
a=0.1;
b=0.02;
dAmp = 20;
% umin=-12*0.85;
% umax=40*0.85;
umin =-10000;
umax = 10000;

%% closed-loop performance specification
alpha1=2*a;
alpha2=3*a;

K1=(alpha1-a)/b;
K2=alpha2/b;

 
deltat=0.001;
Tsim=20;
sim('PIEstimator')


figure(1)
plot(t,y)
hold on


set(gca,'FontSize',20,'FontName','helvetica');
ylabel('Output')
xlabel('Time (sec)')
figure(2)
plot(t,u)
hold on

set(gca,'FontSize',20,'FontName','helvetica');
ylabel('Control')
xlabel('Time (sec)')