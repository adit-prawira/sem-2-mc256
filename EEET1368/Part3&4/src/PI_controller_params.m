clear 
clc
close all

%global parameter
Gs = tf([0.1],[10 1]);
damping_coef = 0.707;
a = 0.1;
b = 0.01;

% case 1
wn_1 = 5;
Kc_1 = ((2*damping_coef*wn_1) - a)/b;
c0_1 = (wn_1*wn_1)/b;
tau_1 = Kc_1/c0_1;
Cs_1 = tf([Kc_1*tau_1 Kc_1], [tau_1 0]);

% case 2
wn_2 = 0.5;
Kc_2 = ((2*damping_coef*wn_2) - a)/b;
c0_2 = (wn_2 * wn_2)/b;
tau_2 = Kc_2/c0_2;
Cs_2 = tf([Kc_2*tau_2 Kc_2], [tau_2 0]);