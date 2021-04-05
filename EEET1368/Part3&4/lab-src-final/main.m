clear
clc
close all

a = 0.1;
b = -5/36;
zeta = 0.707;
wn = 5*a;
pi = ModelPI(wn, zeta, a, b);

lambda = 1;
damp_coeff = 0.707;
wn = 1;
b1 = 0;
b0 = 2;
a1 = 3;
a2 = -1;
pid = ModelPID(a1, a2, b0, b1, damp_coeff, wn, lambda);
%c1 = (2*wn*zeta*(zeta-wn) - 0.1)/(1 + 4*wn*(zeta - wn));
%c0 = wn^2 * (1 - 2*c1);