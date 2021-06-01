clear
close all
clc

%% Training data
fileName = "Datachemical.xlsx";
trainingSheetName = "Training";
trainingInputRange = "A2:C73";
trainingOutputRange = "D2:D73";

trainingInput = xlsread(fileName, trainingSheetName, trainingInputRange);
trainingOutput = xlsread(fileName, trainingSheetName, trainingOutputRange);

x = trainingInput; % do not transpose data
y = trainingOutput; % do not transpose data

%% New data set
newDataSheetName = "Newdata";
inputNewDataRange = "A2:C4";
outputNewDataRange = "D2:D4";

newDataInput = xlsread(fileName, newDataSheetName, inputNewDataRange);
newDataOutput = xlsread(fileName, newDataSheetName, outputNewDataRange);

xNew = newDataInput; % do not transpose data
yNew = newDataOutput; % do not transpose data

%% Regression SVM
model = fitrsvm(x, y, 'KernelFunction', 'gaussian', 'Standardize', true);

% return 1 if program reach an answer, 0 otherwise
converge = model.ConvergenceInfo.Converged; 

nIterations = model.NumIterations; 

%% Predict training data
yPredicted = predict(model, x);


msePerformance = sum((yPredicted - y).^2)/numel(y);

rmsePerformance = sqrt(msePerformance);
fprintf("MSE Performance = %f\n", msePerformance);
fprintf("RMSE Performance = %f\n", rmsePerformance);

table(y(1:10), yPredicted(1:10), 'VariableNames', ...
    {'Actual Chemical Output',  'Predicted Chemical Output'})

%% Predict new data
yPredictedNew = predict(model, xNew);


newMsePerformance = sum((yPredictedNew - yNew).^2)/numel(yNew);
newRmsePerformance = sqrt(newMsePerformance);
errorPercentagePrediction = ((yPredictedNew - yNew)./yNew)*100;

fprintf("New MSE Performance = %f\n", newMsePerformance);
fprintf("New RMSE Performance = %f\n", newRmsePerformance);
fprintf("Error Percentage = %f percent\n", errorPercentagePrediction);
table(yNew(:), yPredictedNew(:), 'VariableNames', ...
    {'Actual Chemical Output From Newdata Sheet', ...
    'Predicted Chemical Output From Newdata Sheet'})