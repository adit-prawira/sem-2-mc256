clear
clc

s = tf('s');

alpha = 0.075/(6.125^2);

% In the demo, I forgot the initial 0.075 in the LoopTF. Now it's good.
LoopTF = 0.075*21/(121*alpha)*(s+10/21)*(-s+10)/(s*s*(s+6.125)^2);

CL = feedback(LoopTF,1) 
CL_poles = pole(CL);
plot(CL_poles,'rx');
% Notice all the closed-loop poles on the left hand side of complex plane.

figure
nyquist(LoopTF)
xlim([-1.5 1])
ylim([-1 1])
