clear
clc
close all 

% Plant transfer function numerator parameters
b1 = 0; 
b0 = 2;

% Plant transfer function numerator parameters
a1 = 0.2; 
a0 = 0.01;

d = 0.5; % delay of 2 seconds

% Poles of closed-loop
lambda = 0.2;

t3 = 4*lambda;
t2 = 6*lambda^2;
t1 = 4*lambda^3;
t0 = lambda^4;

% Plant transfer function
Gs = tf([b1 b0], [1 a1 a0]);
Sy = [1 b1 0 0; a1 b0 b1 0; a0 0 b0 b1; 0 0 0 b0];
Acl = [t3 - a1; t2 - a0; t1; t0];
params = (num2cell(Sy\Acl));
[I0, c2, c1, c0] = params{:};

pid = PID(I0, c2, c1, c0);
D =  tf([pid.Kc*pid.tauD 0], [pid.tauF 1]);

s = tf('s');
Gs1 = 20/(s+10);
Gs2 = exp(-d*s)/(s+0.1)^2;
 
LoopTF = pid.Cs * Gs1 * Gs2;

CL = feedback(LoopTF,1) ;
CL_poles = pole(CL);
plot(CL_poles,'rx');

figure (1)
nyquist(LoopTF)
grid on
xlim([-3 1])
ylim([-1 1])

hold on
figure (2)
margin(LoopTF)
grid on
hold on


