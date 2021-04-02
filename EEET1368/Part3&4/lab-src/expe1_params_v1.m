clear 
clc
close all
time = 50;
half_time = time/2;
Kc = 0.56;
tauI = 8;
tauD = 0.3;
beta = 0.1;
P = Kc;
Fd = tf([Kc*tauD 1], [beta*tauD 1]);
Gs = tf(1, [1 3 3 1 0]);
Cs = tf([Kc*tauI Kc],[tauI 0]);
derivative_controller = tf([tauD 1], [beta*tauD 1]);
integral_controller = tf([tauI 1],[tauI 0]);