% Closed-loop control system.
clear 
clc
close all

Gs = tf([0.2], [1 2 3]);

% Proportional control constant
step_amplitude = 3;
delta_t = 0.01;
Kc = 10;
disturbance_amplitude = -3;
target_time = 50;
noise_power = 0.1;

