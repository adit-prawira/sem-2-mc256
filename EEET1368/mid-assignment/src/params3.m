%% Created by: Aditya Prawira
%  RMIT ID: S3859061

clear
clc
close all 

% Simulation Parameter
time = 10;
disturbance_time = 3;
input_amplitude = 1;
input_disturbance_amplitude = -3;

% Plant transfer function numerator parameters
b1 = -1; 
b0 = 1;

% Plant transfer function numerator parameters
a1 = 0.2; 
a0 = 10;

% Choose zeta < 1 for underdamped condition
zeta = 0.707;
wn = 10;
delta_t = 1/5*wn;
% Poles of closed-loop
lambda = 10;

t3 = 2*(zeta*wn + lambda);
t2 = 4*zeta*wn*lambda + wn^2 + lambda^2;
t1 = 2*wn*lambda*(zeta*wn + wn);
t0 = wn^2 * lambda^2;

% Plant transfer function
Gs = tf([b1 b0], [1 a1 a0]);
Sy = [1 b1 0 0; a1 b0 b1 0; a0 0 b0 b1; 0 0 0 b0];
Acl = [t3 - a1; t2 - a0; t1; t0];
params = (num2cell(Sy\Acl));
[I0, c2, c1, c0] = params{:};

pid = PID(I0, c2, c1, c0);
D =  tf([pid.Kc*pid.tauD 0], [pid.tauF 1]);