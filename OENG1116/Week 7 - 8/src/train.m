clear;
clc;
close all;

filename = 'Example1.xlsx';

x = xlsread(filename, 'x');
t = xlsread(filename, 't');

x=x';
t=t';
net = feedforwardnet(10);

RandStream.setGlobalStream (RandStream ('mrg32k3a'));
[net,tr] = train(net,x,t);
figure, plotperform(tr);
figure, plottrainstate(tr);
y=net(x);
