clear
clc
close all

K = 88;
tau = 170;

b = K/tau;
a = 1/tau;
zeta = 0.707;
wn = 0.014;

step_amplitude = 45; %chose between 40-70 degree celcius
simulation_time = 2000;
sample_time = 0.01;

pi = FirstOrderPI(wn, zeta, a, b);
Gs = tf(88, [170 1]);