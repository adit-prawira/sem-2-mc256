%%
clear; close all; clc;
disp('>> ')
disp('>> ')
disp('>> ========= WELCOME TO THE OENG1116 TUTORIAL-4===========')
disp('>> ')
disp('>> ')
disp('>> ')
disp('>> ')
commandwindow
%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of Classification===========')
disp('>> ')
disp('>> ')
disp('>> ')
clear;clc;
Filename='classification.xlsx'; %classification.xlsx should be used %
Sheetread='x';
Input1='A1:I699';
Sheetread1='t';
Target1 ='A1:B699';
Input=xlsread(Filename,Sheetread,Input1);
Target=xlsread(Filename,Sheetread1,Target1 );
x=Input';
t=Target';
hiddenLayerSize = 10;
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
e = gsubtract(t,y);        % Compare the predictions to the targets (true values)
% Performance plot 
figure;plottrainstate(tr);       % Trainstate plot 
performance = perform(net,t,y);  % Network performance
figure;plotperform(tr);
trainTargets = t .* tr.trainMask{1}; % Apply a mask (0's and 1's to select the proper targets)
valTargets = t .* tr.valMask{1}; %Select validation data
testTargets = t .* tr.testMask{1}; %select test data
trainPerformance = perform(net,trainTargets,y) %calculate training performance
valPerformance = perform(net,valTargets,y)     %calculate validation performance
testPerformance = perform(net,testTargets,y)   %calculate testing performance


%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of Regression 1===========')
disp('>> ')
disp('>> ')
disp('>> ')
clear;clc;
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
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
net.performFcn = 'mse';  % Choose MSE for performance
[net,tr] = train(net,x,t);
view(net);
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y);
figure;plotperform(tr)
figure;plottrainstate(tr)
figure, plotregression(t,y)   % Regression plot 
trainTargets = t .* tr.trainMask{1}; % Apply a mask (0's and 1's to select the proper targets) to select train data 
valTargets = t .* tr.valMask{1};  %Select validation data
testTargets = t .* tr.testMask{1};  %select test data
trainPerformance = perform(net,trainTargets,y)  % training data performance 
valPerformance = perform(net,valTargets,y)      % validation data performance 
testPerformance = perform(net,testTargets,y)    %test data performance 
Ynew=net(xnew); %Test the net with new data to calculate the performance and make predictions
Newperformance=mse(tnew,Ynew); %MSE for new data
table( tnew( 1: 10)',Ynew( 1: 10)', 'VariableNames',... 
{'Actual_data_tnew',' Predicted_data_Ynew'}) % Prediction of tnew and Ynew for first 10th data




%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of Regression 2===========')
disp('>> ')
disp('>> ')
clear;
clc;
% load x.mat   %Regression2.xlsx should be imported %
% load t.mat
Filename='Regression1.xlsx'; %regression1.xlsx should be used %
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
hiddenLayerSize = 10;
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
view(net);
figure, plotperform(tr);
figure, plottrainstate(tr);
figure, plotregression(t,y);
trainTargets = t .* tr.trainMask{1}; % Apply a mask (0's and 1's to select the proper targets)
valTargets = t .* tr.valMask{1}; %Select validation data
testTargets = t .* tr.testMask{1}; %select test data
trainPerformance = perform(net,trainTargets,y) % Compute performance for the training data
valPerformance = perform(net,valTargets,y) % Compute performance for validation data
testPerformance = perform(net,testTargets,y) % compute performance for test data 
load xnew.mat; %load xnew and tnew for further testing the net with new data.
load tnew.mat;
xnew=xnew';
tnew=tnew';
Ynew=net(xnew);
Newperformance=mse(tnew,Ynew); %MSE for new data
table( tnew( 1: 10)',Ynew( 1: 10)', 'VariableNames',... 
{'Actual_data_tnew',' Predicted_data_Ynew'})
Errorpercentage=((tnew-Ynew)./tnew)*100; % Calculate error percentage for tnew and ynew for first ten data



%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of Regression 3===========')
disp('>> ')
disp('>> ')
disp('>> ')
clear ;
clc;
x = 0:.05:2;
y = 1 ./ ((x-.3).^2 + .01) + 1 ./ ((x-.9).^2 + .04) - 6; 
P=x; T=y; 
plot(P,T,'*') 
grid on;
xlabel('time (s)');
ylabel('output');
net=fitnet(5); %Build the network with 5 neurons in the hidden layer 
net.layers{1}.transferFcn = 'logsig'; %activation function for hidden layer
net.layers{2}.transferFcn = 'purelin'; % activation function for output layer
% RandStream.setGlobalStream (RandStream ('mrg32k3a')); 
net.divideFcn = 'dividerand'; %Run several times to get the best fit 
net.divideMode = 'sample'; 
net.trainParam.epochs =1000; % Max number of iterations 
net = train(net, P, T); % Training
a= net(P); % prediction of output 
plot(P,a, P,T); grid; % Plot result and compare 
xlabel('time (s)');
ylabel('output');
