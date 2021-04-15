clc
clear
close all

Gs = tf(100, [1 10 0]);
Rm = 3;
w0 = sqrt(2);
lambda = 8;
a = 0; b = 10;

%% Parameters that can be changed %%
sampling_time = 0.001;
simulation_time = 50;
%% Calculate parameters for resonant controller (Applying pole-assignment)
t2 = 3*lambda;
t1 = 3*lambda^2;
t0 = lambda^3;

c2 = (t2 - a)/b;
c1 = (t1 - w0^2)/b;
c0 = (t0 - (a * w0^2))/b;

ResonantController = tf([c2 c1 c0], [1 0 w0^2]);