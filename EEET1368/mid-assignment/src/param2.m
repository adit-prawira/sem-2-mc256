clear
clc
close all

% Global Variable
time = 500;
half_time = time/2;
lambda = 1/2;
a1 = 1/3;
a2 = 1;
b1 = -1/2;
b0 = 1/6;
Gs = tf(0.5, [1 1]);

damp_coeff = 1;
wn = 0.2;
pid = ModelPID(a1, a2, b0, b1, damp_coeff, wn, lambda);
