clear
clc
close all
t=[0:0.01:1]*4*pi; 
y=sin(t); plot(t,y,'r'); 
grid on; 
hold on; 
xlabel('t'); 
ylabel('y');

% option 2 is chosen
t2=[0:1:12]; y2=interp1(t,y,t2); plot(t2,y2,'k-o','LineWidth',2);
