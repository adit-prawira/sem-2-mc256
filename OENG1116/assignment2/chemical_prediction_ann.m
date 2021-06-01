clear 
close all
clc

%% Training data set
fileName = "Datachemical.xlsx";
trainingSheetName = "Training";
inputTrainingDataRange = "A2:C73";
outputTrainingDataRange = "D2:D73";

trainingInput = xlsread(fileName, trainingSheetName, inputTrainingDataRange);
trainingOutput = xlsread(fileName, trainingSheetName, outputTrainingDataRange);

x = trainingInput';
y= trainingOutput';

%% New data set
newDataSheetName = "Newdata";
inputNewDataRange = "A2:C4";
outputNewDataRange = "D2:D4";

newDataInput = xlsread(fileName, newDataSheetName, inputNewDataRange);
newDataOutput = xlsread(fileName, newDataSheetName, outputNewDataRange);

xNew = newDataInput';
yNew = newDataOutput';

%% ANN training with training data set
trainingFunction = "trainlm";
hiddenLayers = 10; % 15

net = fitnet(hiddenLayers, trainingFunction);

net.input.processFcns = {'mapminmax'};
net.output.processFcns = {'mapminmax'};

net.divideMode = "sample";

net.divideParam.trainRatio = 0.7;
net.divideParam.valRatio = 0.2; %0.15
net.divideParam.testRatio = 0.1; %0.15

net.performFcn = "mse";

[net, training] = train(net, x, y); % train ANN

yPredicted = net(x); % feed data to neural network

errors = gsubtract(y, yPredicted);

performance = perform(net, y, yPredicted);

figure;plotperform(training);

figure;plottrainstate(training);

figure;plotregression(y, yPredicted);

trainingTargets = y .* training.trainMask{1};
validationTargets = y.* training.valMask{1};
testTargets = y .* training.testMask{1};

trainingPerformance = perform(net, trainingTargets, yPredicted);
validationPerformance = perform(net, validationTargets, yPredicted);
testPerformance = perform(net, testTargets, yPredicted);
%% ANN training with New data set
yPredictedNew = net(xNew); % feed neural network with new data input set.

msePerformance = sum((yNew - yPredictedNew).^2)/numel(yNew);
rmsePerformance = sqrt(msePerformance);
errorPercentage = (yPredictedNew - yNew ./ yNew)*100;

fprintf("Training Performance = %f\n", trainingPerformance);
fprintf("Validation Performance = %f\n", validationPerformance);
fprintf("Test Performance = %f\n", testPerformance);
fprintf("Error Percentage = %f percent\n", errorPercentage);

fprintf("MSE Performance = %f\n", msePerformance);
fprintf("RMSE Performance = %f\n", rmsePerformance);
table(yNew(1:3)', yPredictedNew(1:3)', 'VariableNames', ...
    {'Actual Chemical Output', 'Predicted Chemical Output'})

