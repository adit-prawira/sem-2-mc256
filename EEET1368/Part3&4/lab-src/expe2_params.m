clear
clc
close all

% Global Variable
time = 100;
half_time = time/2;
lambda = 1;
a1 = 0.1;
a2 = 0.4;
b1 = -1;
b0 = 0.4;
Gs = tf([-1 0.4], [1 0.5 0.04]);

% Case A
damp_coeff1 = 0.707;
wn1 = 0.2;
system1 = ModelPID(a1, a2, b0, b1, damp_coeff1, wn1, lambda);

% Case B
damp_coeff2 = 0.707;
wn2 = 0.4;
system2 = ModelPID(a1, a2, b0, b1, damp_coeff2, wn2, lambda);

% Case C
damp_coeff3 = 0.707;
wn3 = 1;
system3 = ModelPID(a1, a2, b0, b1, damp_coeff3, wn3, lambda);