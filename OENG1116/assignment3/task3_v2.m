clear
close all
clc

L =4;
a=0.125;
b=0.042;
rho = 1200;
A=a*b;
E =17.2*10^9;
I=a*b^3/12;
EI=E*I;
Nfe=2;
h=L/Nfe;

c=sqrt(E/1200);

m=A*rho;
ke= [12 6*h -12 6*h;...
    6*h 4*h^2 -6*h 2*h^2;
    -12 -6*h 12 -6*h;
    6*h 2*h^2 -6*h 4*h^2];
ke = ((E*I)/h^3).* ke;

M=[1000;0;0;1000];

w=(ke\M);
R=atan(2*w/L);
D = rad2deg(R);

fprintf("angular displacement = %f degree\n", round(D(1)))