clear
clc
close all 

%% Input parameters
Rm = 3;
w0 = sqrt(2);

%% Parameters that can be changed %%
zeta = 0.707; % damping coefficient is expected to be less than 1
wn = 1;
sampling_time = 1/(10*wn);
simulation_time = 200;

%% Plant transfer function numerator parameters
b1 = 0; 
b0 = 100;

%% Plant transfer function numerator parameters
a1 =10; 
a0 = 0;
%% Poles of closed-loop
lambda = 8;
%% Parmeters for controller
t3 = 0.1;
t2 = 4*zeta*wn*lambda + wn^2 + lambda^2;
t1 = 2*wn*lambda*(zeta*wn + wn);
t0 = wn^2 * lambda^2;

c2 = (t2 - b0^2)/b0;
c1 = (t1 - a1*w0^2)/b0;
c0 = t0/b0;

%% Plant transfer function
Gs = tf([b1 b0], [1 a1 a0]);
ResonantController = tf([c2 c1 c0], [1 0 w0^2]);