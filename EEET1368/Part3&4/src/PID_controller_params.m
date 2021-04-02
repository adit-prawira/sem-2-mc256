clear
clc
close all

% global parameters
Gs = tf([-1 0.4],[1 0.5 0.04]);

% case 1: wn = 0.4
tf1 = 0.292;
td1 = 1.43;
ti1 = 7.1;
Kc1 = 0.332;
Cs1 = tf(Kc1, [ti1 0]);
Ds1 = tf([(Kc1*tf1)+(Kc1*td1) 1], [tf1 1]);

% case 2: wn  = 0.2
tf2 = 0.5581;
td2 = 1.3375;
ti2 = 8.0323;
Kc2 = 0.1793;
Cs2 = tf(Kc2, [ti2 0]);
Ds2 = tf([(Kc2*tf2)+(Kc2*td2) 1], [tf2 1]);