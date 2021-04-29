clear
clc
close all

Filename='Regression2.xlsx'; %regression1.xlsx should be used %
Sheetread='x';
Input1='A1:H423';
Sheetread1='t';
Target1 ='A1:A423';
Sheetread2='xnew'; %load xnew and tnew for further testing the net with new data.
Input2='A1:H75';
Sheetread3='tnew';
Target2 ='A1:A75';
Input=xlsread(Filename,Sheetread,Input1);
Target=xlsread(Filename,Sheetread1,Target1 );
Inputnew=xlsread(Filename,Sheetread2,Input2);
Targetnew=xlsread(Filename,Sheetread3,Target2 );
x=Input';
t=Target';
xnew=Inputnew'; 
tnew=Targetnew';

trainFcn = 'trainlm';  
hiddenLayerSize = 12;
net = fitnet(hiddenLayerSize,trainFcn);
net.input.processFcns = {'mapstd'}; %Normalization of input data 
net.output.processFcns = {'mapstd'};%Normalization of output data
net.layers{1}.transferFcn = 'logsig'; %activation function for hidden layer
net.layers{2}.transferFcn = 'purelin'; % activation function for output layer
% net.divideFcn = 'dividerand';
RandStream.setGlobalStream (RandStream ('mrg32k3a')); %To get the same results as slides
net.divideMode = 'sample';  
net.divideParam.trainRatio = 70/100;%Divide up the samples
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
net.performFcn = 'mse'; 
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression'};
[net,tr] = train(net,x,t); %Train the network
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y);
%view(net);
figure, plotperform(tr);
figure, plottrainstate(tr);
figure, plotregression(t,y);
trainTargets = t .* tr.trainMask{1}; % Apply a mask (0's and 1's to select the proper targets)
valTargets = t .* tr.valMask{1}; %Select validation data
testTargets = t .* tr.testMask{1}; %select test data
trainPerformance = perform(net,trainTargets,y); % Compute performance for the training data
valPerformance = perform(net,valTargets,y); % Compute performance for validation data
testPerformance = perform(net,testTargets,y); % compute performance for test data 

% load xnew.mat; %load xnew and tnew for further testing the net with new data.
% load tnew.mat;
% xnew=xnew';
% tnew=tnew';
Ynew=net(xnew);
Newperformance=mse(tnew,Ynew); %MSE for new data
table( tnew( 1: 10)',Ynew( 1: 10)', 'VariableNames',... 
{'Actual_data_tnew',' Predicted_data_Ynew'})
Errorpercentage=((tnew-Ynew)./tnew)*100; % Calculate error percentage for tnew and ynew for first ten data