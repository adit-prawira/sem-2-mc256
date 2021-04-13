%% Created by: Aditya Prawira
%  RMIT ID: S3859061
clear
clc
close all

a = 0.1; b = 0.001;
zeta = 0.707; wn = 1;
time = 20;

Gs = tf(b, [1 a]);
pi = FirstOrderPI(wn, zeta, a, b);



