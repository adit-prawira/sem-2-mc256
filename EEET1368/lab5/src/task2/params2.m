clear
clc
close all

x1 = 300;
y1 = 35;

x2 = 600;
y2 = 65;

slope = (y2 - y1)/(x2 - x1);

time = 1000;

a = 80;
tau = 174;
Gs = tf(a, [tau 1]);
lambda = 0.011;
T0 = 27;
c2 = (3*lambda*tau - 1)/a;
c1 = (3 * lambda^2 * tau)/a;
c0 = (lambda^3 * tau)/a;

Cs = tf([c2 c1 c0], [1 0 0]);


