clear
close all
clc

%% Plant transfer function parameters
b = 2;
a = 0;
Gs = tf(b, [1 a]);
deltat = 0.01;
tSim = 20;

%% Reference input parameters
w0 = 1;
shift = 2;
amplitude = 3;

%% Parameters of simulation
wn = 4;
zeta = 1;
alpha1 = 3;

K1 = (alpha1 - a)/b;
gamma1 = (2*zeta*wn)/b;
gamma2 = (wn^2 - w0^2)/b;

umax = 8.8;
umin = -100;

sim('ResonantEstimator')




