clear
clc
close all

% Global Variable
time = 100;
half_time = time/2;
lambda = 1;
a1 = 1/3;
a2 = 1;
b1 = -1/2;
b0 = 1/6;
Gs = tf(0.5, [1 1]);
damp_coeff = 0.707;
damp_coeff2 = 1;
beta = 0.1;

wn = 0.19;
pid = ModelPID(a1, a2, b0, b1, damp_coeff, wn, lambda);
D = tf([pid.Kc*pid.tauD 0], [pid.tauF 1]);

pid2 = ModelPID(a1, a2, b0, b1, damp_coeff2, wn, lambda);
D2 = tf([pid2.Kc*pid2.tauD 0], [pid.tauF 1]);
