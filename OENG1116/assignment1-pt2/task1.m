clear
clc
close all

t = 120;
k = -0.02;
t0 = 24;
ts = 112;
t_out = ts + (t0-ts)*exp(k*t);
