clear;
clc;
close all

Filename='Regression1.xlsx'; %regression1.xlsx should be used %
Sheetread='x';
Input1='A1:M214';
Sheetread1='t';
Target1 ='A1:A214';
Sheetread2='xnew'; %load xnew and tnew for further testing the net with new data.
Input2='A1:M38';
Sheetread3='tnew';
Target2 ='A1:A38';
Input=xlsread(Filename,Sheetread,Input1);
Target=xlsread(Filename,Sheetread1,Target1 );
Inputnew=xlsread(Filename,Sheetread2,Input2);
Targetnew=xlsread(Filename,Sheetread3,Target2 );
x=Input';
t=Target';
xnew=Inputnew'; 
tnew=Targetnew';
trainFcn = 'trainlm'; hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize,trainFcn);
net.input.processFcns = {'mapminmax'}; % To standardize the input
RandStream.setGlobalStream (RandStream ('mrg32k3a'));% Just to get the same results;

% net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';

%% OVECONFIDENT RATIOS
% in this case the neural network is verconfident that will reduce the
% quality of evaluatino and test.
net.divideParam.trainRatio = 25/100;
net.divideParam.valRatio = 60/100;
net.divideParam.testRatio = 15/100;

%% PROPER RATIO
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

net.performFcn = 'mse';  % Choose MSE for performance

[net,tr] = train(net,x,t); % train neural network.
view(net);
y = net(x);
e = gsubtract(t,y); % calculate error with actual and predicted output
performance = perform(net,t,y);
figure;plotperform(tr)
figure;plottrainstate(tr)

figure, plotregression(t,y)   % Regression plot 
trainTargets = t .* tr.trainMask{1}; % Apply a mask (0's and 1's to select the proper targets) to select train data 
valTargets = t .* tr.valMask{1};  %Select validation data
testTargets = t .* tr.testMask{1};  %select test data
trainPerformance = perform(net,trainTargets,y);  % training data performance 
valPerformance = perform(net,valTargets,y);      % validation data performance 
testPerformance = perform(net,testTargets,y);    %test data performance 
Ynew=net(xnew); %Test the net with new data to calculate the performance and make predictions
Newperformance=mse(tnew,Ynew); %MSE for new data

table( tnew( 1: 10)',Ynew( 1: 10)', 'VariableNames',... 
{'Actual_data_tnew',' Predicted_data_Ynew'})