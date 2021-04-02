clear
clc
close all

x=[-1:0.1:7]; 
y = 0.2*x.^3 - 2*x.^2 + 4*x - 50;
new_y = find(y > -48);

n_elements = length(new_y);