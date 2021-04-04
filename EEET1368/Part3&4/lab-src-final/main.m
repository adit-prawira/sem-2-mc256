clear
clc
close all

a = 0.1;
b = -5/36;
zeta = 0.707;
wn = 5*a;
pi = ModelPI(wn, zeta, a, b);
%c1 = (2*wn*zeta*(zeta-wn) - 0.1)/(1 + 4*wn*(zeta - wn));
%c0 = wn^2 * (1 - 2*c1);