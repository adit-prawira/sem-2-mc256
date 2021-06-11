clear
close all 
clc

delay = 5;

Gs = tf(5, [20 1]);

deltat = 0.1;

tSim = 400;
tDist = 200;

Kc = 0.5056;
tauI =21.2806;
tauD= 1.2423;

P = Kc;
I = Kc/tauI;
D = Kc*tauD;
N = 1/0.1*tauD;

sim('Question2')
