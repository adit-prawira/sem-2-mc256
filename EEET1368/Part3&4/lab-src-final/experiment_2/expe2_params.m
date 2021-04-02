clear
clc
close all

% Global Variable
time = 500;
half_time = time/2;
lambda = 1;
a1 = 0.1;
a2 = 0.4;
b1 = -1;
b0 = 0.4;
transfer_func = tf(10, [10 1]);

% Case C
damp_coeff3 = 0.707;
wn3 = 0.6;
case_c = ModelPID(a1, a2, b0, b1, damp_coeff3, wn3, lambda);


% Case A
damp_coeff1 = 0.707;
wn1 = 0.2;
case_a = ModelPID(a1, a2, b0, b1, damp_coeff1, wn1, lambda);

% Case B
damp_coeff2 = 0.707;
wn2 = 0.4;
case_b = ModelPID(a1, a2, b0, b1, damp_coeff2, wn2, lambda);