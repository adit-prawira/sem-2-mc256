clear 
clc
close all
time = 500;
half_time = time/2;
Kc = 0.56;
tauI = 8;
tauD = 0.3;
beta = 0.1;
P = Kc;
I = Kc/tauI;
D = Kc*tauD;
Fds = tf([Kc*tauD 0], [beta*tauD 1]);
N = 1/(0.1*tauD);
Gs = tf(1, [1 3 3 1 0]);
LPF = tf(1, [beta*tauD 1]);
