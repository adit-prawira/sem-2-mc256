clear
close all
clc

%% Training data
fileName = "DataEngine.xlsx";
sheetTraining = "Training";
inputTrainingDataRange = "A2:B1195"; % input: fuel rate and speed
outputTrainingDataRange = "C2:C1195"; % output: torque

trainingInput= xlsread(fileName, sheetTraining, inputTrainingDataRange);
trainingOutput = xlsread(fileName, sheetTraining, outputTrainingDataRange);

x = trainingInput';
y = trainingOutput';
%% New data
sheetNewdata = "Newdata";
inputNewdataRange = "A2:B4";
outputNewdataRange = "C2:C4";

newDataInput = xlsread(fileName, sheetNewdata, inputNewdataRange);
newDataOutput = xlsread(fileName, sheetNewdata, outputNewdataRange);

xNew = newDataInput';
yNew = newDataOutput';

%% ANN Training with Training data set
trainingFunction = "trainlm"; %Levenberg-Marquardt
hiddenLayers = 10;

net = fitnet(hiddenLayers, trainingFunction);

net.input.processFcns = {'mapminmax'}; % standardize inputs
net.output.processFcns = {'mapminmax'};% standardize outputs

% Setting stream of random number
%RandStream.setGlobalStream(RandStream("mrg32k3a")); 

net.divideMode = "sample"; % divide neural netowkr by sample

% Divided neural network training, validation and test ratios
% Note: there are default values set by MATLAB for these ratios
net.divideParam.trainRatio = 0.7; % training ratio is 0.7 by default
net.divideParam.valRatio = 0.2; % validation ratio is 0.15 by default
net.divideParam.testRatio = 0.1; % test ratio is 0.15 by default

net.performFcn = "mse"; % post-processing for performance is mse by default

%train neural network by feeding training input and output data
[net,training] = train(net,x,y);

yPredicted = net(x); % output prediction from neural network

% calculate difference of y and yPredicted data
error = gsubtract(y, yPredicted); 

performance = perform(net, y, yPredicted); % Output performance

figure;plotperform(training);

figure;plottrainstate(training);

figure;plotregression(y, yPredicted);

trainingTargets = y.*training.trainMask{1}; %select training data
validationTargets = y.*training.valMask{1}; %select validation data
testTargets = y.*training.testMask{1}; % select test data

trainingPerformance = perform(net, trainingTargets, yPredicted);
validationPerformance = perform(net, validationTargets, yPredicted);
testPerformance = perform(net, testTargets, yPredicted);


%% ANN training with New data set

% test neural network with the new data to calculate and make predictions
yPredictedNew = net(xNew); 


mseTesting = sum((yNew - yPredictedNew).^2)/numel(yNew);

rmseTesting = sqrt(mseTesting);

fprintf("Training Performance = %f\n", trainingPerformance);
fprintf("Validation Performance = %f\n", validationPerformance);
fprintf("Test Performance = %f\n", testPerformance);

fprintf("MSE Performance = %f\n", mseTesting);
fprintf("RMSE Performance = %f\n", rmseTesting);
table(yNew(1:3)', yPredictedNew(1:3)', 'VariableNames', ...
    {'Actual Torque', 'Predicted Torque'})
