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

x = trainingInput; 
y = trainingOutput; 
%% New data set
newDataSheetName = "Newdata";
inputNewDataRange = "A2:C4";
outputNewDataRange = "D2:D4";

newDataInput = xlsread(fileName, newDataSheetName, inputNewDataRange);
newDataOutput = xlsread(fileName, newDataSheetName, outputNewDataRange);

xNew = newDataInput; 
yNew = newDataOutput; 

%% NLR Training data set
[xn, standardizeXn] = mapminmax(x');
[yn, standardizeYn] = mapminmax(y');

xnNew = mapminmax('apply', xNew', standardizeXn);

xn = xn';
yn = yn';
xnNew = xnNew';

beta = [1 1 1 1 1 1 1 1]; % initialize coefficients

func = @(b,xn)b(1)+b(2)*xn(:,1)+b(3)*xn(:,2)+b(4)*xn(:,3)+...
    b(5 )*(xn(:,1).^2)+b(6)*((xn(:,1).*xn(:,2).*xn(:,3))+...
    b(7).*exp (b(8)*xn(:,3)));

model = fitnlm(xn, yn, func, beta); 

yPredictedNormalised = predict(model, xn);

yPredicted = mapminmax('reverse', yPredictedNormalised, standardizeYn);

msePerformance = sum((yPredicted - y).^2)/numel(y);
rmsePerformance = sqrt(msePerformance);


table(y(40:50), yPredicted(40:50), 'VariableNames', ...
    {'Actual Data Label', 'Predicted Data Label'})

fprintf("MSE Performance = %f\n", msePerformance);
fprintf("RMSE Performance = %f\n", rmsePerformance);
%% NLR Training Newdata set
yPredictedNewNormalised = predict(model, xnNew);
yPredictedNew  = mapminmax('reverse', yPredictedNewNormalised, standardizeYn);

newMsePerformance = sum((yPredictedNew  - yNew).^2)/numel(yNew);
newRmsePerformance = sqrt(msePerformance);


table(yNew(:), yPredictedNew(:), 'VariableNames',...
    {'Actual New Data Label', 'Predicted New Data Label'})
fprintf("New MSE Performance = %f\n", newMsePerformance);
fprintf("New RMSE Performance = %f\n", newRmsePerformance);