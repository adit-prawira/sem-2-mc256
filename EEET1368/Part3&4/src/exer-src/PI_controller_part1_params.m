clear 
clc
close all

a = 0.1;
b = 0.3;
damping_coeff = 0.707;
wn = [a 5*a 10*a];
size = length(wn);
Kc = zeros(1, size);
c0 = zeros(1, size);
tauI = zeros(1, size);

for i = 1: size
    Kc(i) = ((2*damping_coeff*wn(i)) - a)/b;
    c0(i) = (wn(i)^2)/b;
    tauI(i) = Kc(i)/c0(i);
end

Cs1 = tf([Kc(1)*tauI(1) Kc(1)], [tauI(1) 0]);
Cs2 = tf([Kc(2)*tauI(2) Kc(2)], [tauI(2) 0]);
Cs3 = tf([Kc(3)*tauI(3) Kc(3)], [tauI(3) 0]);

Gs = tf(b, [1 a]);
