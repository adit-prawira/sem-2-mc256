clear
close all 
clc

%% Customisable parameters
b = 2;
a1 = 0;
a0 = -1;

deltat = 0.001;
dAmp = -2;
tSim = 10;
delay = 0.01;

%% Main Parameters
zeta = 0.707;
wn = 3;
alpha3 = 4;

umax = 999;
umin = -999;

K1 = (wn^2 - a0)/b;
K2 = (2*zeta*wn - a1)/b;
K3 = alpha3/b;

taud= K2/K1;
tauf = 0.1*taud;

Gs = tf(b, [1 a1 a0]);