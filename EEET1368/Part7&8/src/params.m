clear
clc
close all

K = 80;
tau = 174;

T0 = 27;
T1 = 67;
Ty = (T1-T0)*0.63 + T0;

duty_cycle = 0.5;

b = K/tau;
a = 1/tau;
zeta = 0.707;
wn = 0.001;

step_amplitude = 70; %chose between 40-70 degree celcius
simulation_time = 2000;
sample_time = 1/5*wn;

% saturation
upper_limit = 1;

pi = FirstOrderPI(wn, zeta, a, b);
Gs = tf(K, [tau 1]);