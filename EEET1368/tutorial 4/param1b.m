clear
close all 
clc

tSimulation = 30;

tDelta = 0.001;
amplitude = 1;

tDist = tSimulation/2;
dAmplitude = -1;

a = 0.1;
b = 0.02;

tDelay = 0.01;

alpha1 = 2*a;
alpha2 = 3*a;

K1 = (alpha1 - a)/b;
K2 = alpha2/b;


den=conv([1 1],[1 20 100]);
Gs = tf(1, den);

umin = -12 * 0.85;
umax = 40*0.85;
sim('model1')