clear 
clc
close all
time = 500; %set any time , undefined
half_time = time/2;   %due to error input disturbance !!!!
Kc = 0.56;
tauI = 8;
tauD = 0.3;
beta = 0.1;  %as 1/(0.1*Tds +1)= 1/(beta*Tds +1)
P = Kc;
I = Kc/tauI;
D = Kc*tauD;
N = 1/(0.1*tauD); %PID,N derived from equations stated in the marking criteria
Gs = tf(1, [1 3 3 1 0]);
LPF = tf(1, [beta*tauD 1]);
Fds = tf([Kc*tauD 0], [beta*tauD 1]);