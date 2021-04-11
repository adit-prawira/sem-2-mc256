clc
clear
close all

Gs = tf(100, [1 10 0]);
Rm = 3;
w0 = sqrt(2);
lambda = 8;
a = 0; b = 10;

%% Parameters that can be changed %%
zeta = 0.707; % damping coefficient is expected to be less than 1
wn = 8; % natural frequency is expected to be wn <= lambda
sampling_time = 0.001;
simulation_time = 50;
%% Calculate parameters for resonant controller (Applying pole-assignment)
t2 = 2*zeta*wn + lambda;
t1 = wn*(wn + 2*zeta*wn);
t0 = wn^2 * lambda;

c2 = (t2 - a)/b;
c1 = (t1 - w0^2)/b;
c0 = (t0 - (a * w0^2))/b;

ResonantController = tf([c2 c1 c0], [1 0 w0^2]);