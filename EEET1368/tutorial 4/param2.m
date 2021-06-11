clear
close all 
clc

%% Customisable parameters
b = 2;
a1 = 0;
a0 = -1;

%% Main Parameters
zeta = 0.707;
wn = 3;
alpha3 = 4;

K1 = (wn^2 - a0)/b;
K2 = (2*zeta*wn - a1)/b;
K3 = alpha3/b;

tauD= K2/K1;
tauF = 0.1*tauD;
