clear
clc

s = tf('s');

alpha = 0.075/(6.125^2);

F = 21/(121*alpha)*(s + 10/21)*(-s + 10)/(s*s*(s+6.125)^2);

CL = feedback(F, 1);
pole(CL);

nyquist(F);
xlim([-1.5 1]);
ylim([-1 1]);