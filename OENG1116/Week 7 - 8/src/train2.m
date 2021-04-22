clear; 
clc;
close all;

disp('>> ========= Test the network(validation)and calculate the performance ============')

filename = 'Example2.xlsx';

x = xlsread(filename, 'x');
t = xlsread(filename, 't');
x=x'; 
t=t'; 
plot(x,t,'o');
net = feedforwardnet(20);
net.performFcn

RandStream.setGlobalStream (RandStream ('mrg32k3a')); 
net = train(net,x,t);         
y = net(x);                        
perf = perform(net,t,y);  
plot(x,t,'o',x,y, '*');    
grid on;
