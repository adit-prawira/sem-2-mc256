clear
clc
close all
filename = 'classification.xlsx';
sheetread = 'x';
input1 = 'A1:I699';
sheetread1 = 't';
target1 = 'A1:B699';
input = xlsread(filename, sheetread, input1);
target = xlsread(filename, sheetread1, target1);
x=input';
t=target';

hiddenLayerSize = 15;
trainFcn = 'trainscg'; %Training function for classification
net = patternnet(hiddenLayerSize, trainFcn);  % Network Architecture
net.input.processFcns = {'mapminmax'}; % To standardize data 

RandStream.setGlobalStream (RandStream ('mrg32k3a'));

net.divideMode = 'sample'; 
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

net.performFcn = 'crossentropy';  % Cross-Entropy for network perfoamnce

net.plotFcns = {'plotperform','plottrainstate','ploterrhist'};

[net,tr] = train(net,x,t);  % train the network
view(net)                 % view neural network
y = net(x);                % Compute predictions from the inputs 

e = gsubtract(t,y); % substract the real output with the predicted output

%% plotting section
figure;plottrainstate(tr);       % Trainstate plot 
performance = perform(net,t,y);  % Network performance
figure;plotperform(tr);
trainTargets = t .* tr.trainMask{1}; % Apply a mask (0's and 1's to select the proper targets)
valTargets = t .* tr.valMask{1}; %Select validation data
testTargets = t .* tr.testMask{1}; %select test data
trainPerformance = perform(net,trainTargets,y); %calculate training performance
valPerformance = perform(net,valTargets,y);     %calculate validation performance
testPerformance = perform(net,testTargets,y); 
