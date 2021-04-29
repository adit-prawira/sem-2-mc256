%K1,K2,K3,tauf,alpha3,a1,a0,deltat,umin,umax
clear
clc
close all

delay = 0.01;
Tsim = 20;
K1 = 5;
K2 = 2.121;
K3 = 2;
taud = K2/K1;
tauf = 0.1*taud;
alpha3 = 4;
a1 = 0;
a0 = -1;
b0 = 2;
deltat = 0.001;
umin = -29.1*0.85;

umax = 0.85*5.4;

Gs = tf(2, [1 0 -1]);
