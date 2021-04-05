clear 
clc
close all
time = 500; %set simulation time of 500s.

%Set half of the simulation time for input disturbance
half_time = time/2;   

%Plant transfer function
Gs = tf(1, [1 3 3 1 0]); 

Kc = 0.56; % proportional controller gain
tauI = 8; %Integral time constant
tauD = 0.3; %derivative gain
beta = 0.1;  %as 1/(0.1*tauDs +1)= 1/(beta*tauDs +1)

% PID Parameters
P = Kc;
I = Kc/tauI;
D = Kc*tauD;
N = 1/(0.1*tauD);



