%% Created by: Aditya Prawira
%  RMIT ID: S3859061

clear
clc
close all

% Global Variable
time = 100;
lambda = 1/4;
lambda2 = 1/8;

a1 = 1/3;
a2 = 1;
b1 = -1/2;
b0 = 1/6;
Gs = tf(0.5, [1 1]);
beta = 0.1;

pid = ModelPID(a1, a2, b0, b1, lambda);
D = tf([pid.Kc*pid.tauD 0], [pid.tauF 1]);


pid2 = ModelPID(a1, a2, b0, b1, lambda2);
D2 = tf([pid2.Kc*pid2.tauD 0], [pid2.tauF 1]);