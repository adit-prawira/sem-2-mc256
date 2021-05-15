clear
clc
close all

% Data of temperatures from Part 1
T0 = 27; % initial read of the resistor's temperature
T1 = 67; % final or steady state value of the resistor's temperature (Tss)
Ty = (T1-T0)*0.63 + T0; % The value of Ty is 63% of T1

K = (T1 - T0)/0.5; % the value of "a" from the approximated G(s) of Part 1
tau = 174; % time taken for T0 to reach Ty

duty_cycle = 0.5; % duty cycle of 50% (50% voltage drop)

% Calculation of Design based PI conroller
b = K/tau;
a = 1/tau;
zeta = 0.707;

% NATURAL FREQUENCY
wn = 3/tau;

% PARAMETERS OF REFERENCE SIGNAL
step_amplitude = 67; % chose between 40-70 degree celcius
sample_time = 1/5*wn;

% PARAMETERS OF STAURATION BLOCK
upper_limit = 1;
lower_limit = 0;

% Parameters for Simulation
simulation_time = 2000;

pi = FirstOrderPI(wn, zeta, a, b); % pi controller
Gs = tf(K, [tau 1]); % Approximated Plant's transfer function