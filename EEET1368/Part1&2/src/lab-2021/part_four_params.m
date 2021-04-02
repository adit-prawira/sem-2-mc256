% Closed-loop control system.
clear 
clc
close all

Gs = tf(1, [1 8 13 6]);

% Proportional control constant
step_amplitude = 10;
delta_t = 0.001;
Kc = 1;
disturbance_amplitude = -3;
target_time = 50;
noise_power = 0.001;
ti = 8;
td = 0.01;

