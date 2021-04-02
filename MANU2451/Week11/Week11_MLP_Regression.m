clear all;
close all;
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sampling 41 points in the range of [-1,1] %
% the data is -1, -0.95, -0.9, ..., 0.95, 1 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x=-1:0.05:1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generating training data, the desired outputs %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y=0.8*x.^3 + 0.3 * x.^2 -0.4 * x;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% specify the structure and learning algorithm for MLP %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% net=newff(minmax(x),[3,1],{'tansig','purelin'},'trainlm');
net=newff(minmax(x),[5,3,1],{'logsig','tansig','purelin'},'trainbr');
net.trainparam.show=2000; % epochs between display
net.trainparam.lr=0.01; % learning rate
net.trainparam.epochs=10000; % maximum epochs to train
net.trainparam.goal=1e-4; % performance goal, training will stop if this is reached

%%%%%%%%%%%%%%%%%
% Train the MLP %
%%%%%%%%%%%%%%%%%

[net,tr]=train(net,x,y);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test the MLP, net_output is the output of the MLP, ytest is the desired output. % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xtest=-0.97:0.1:0.93; % Data is -0.97, -0.87, ..., 0.83, 0.93 (never seen before)
ytest=0.8*xtest.^3 + 0.3 * xtest.^2 -0.4 * xtest;
net_output=sim(net,xtest);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot out the test results %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot(xtest,ytest,'b+');
hold on;
plot(xtest,net_output,'r-');
hold off
legend('actual','predicted')