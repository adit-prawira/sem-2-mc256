%%
clear; close all; clc;
disp('>> ')
disp('>> ')
disp('>> ========= WELCOME TO THE OENG1116 Revision===========')
disp('>> ')
disp('>> ')
disp('>> ')
disp('>> ')
commandwindow

%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of ANN1(Answers may vary )===========')% DataEngine.xlsx was used .
disp('>> ')
disp('>> ')
disp('>> ')
Filename='DataEngine.xlsx';%prediction of Torque based on fuel rate and speed
Sheetread='Training';
Input1='A2:B1195';
output1='C2:C1195';
Input=xlsread(Filename,Sheetread,Input1); 
Target=xlsread(Filename,Sheetread,output1 );
x=Input;
t=Target;
Sheetread1='Newdata';
Input2='A2:B4';
Target2 ='C2:C4';
Inputnew=xlsread(Filename,Sheetread1,Input2);
Targetnew=xlsread(Filename,Sheetread1,Target2 );
xnew=Inputnew; 
tnew=Targetnew;
x=Input';
t=Target';
xnew=Inputnew'; 
tnew=Targetnew';
trainFcn = 'trainlm'; hiddenLayerSize = 10;
%net.layers{1}.transferFcn = 'logsig';  %for hidden layer 
net = fitnet(hiddenLayerSize,trainFcn);
net.input.processFcns = {'mapminmax'}; % To standardize the input
net.output.processFcns = {'mapminmax'}; % To standardize the input
%RandStream.setGlobalStream (RandStream ('mrg32k3a'));% Just to get the same results;
net.divideMode = 'sample';
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 10/100;
net.performFcn = 'mse';  
[net,tr] = train(net,x,t);
view(net);
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y);
figure;plotperform(tr)
figure;plottrainstate(tr)
trainTargets = t .* tr.trainMask{1}; % Apply a mask (0's and 1's to select the proper targets) to select train data 
valTargets = t .* tr.valMask{1};  %Select validation data
testTargets = t .* tr.testMask{1};  %select test data
trainPerformance = perform(net,trainTargets,y)  % training data performance 
valPerformance = perform(net,valTargets,y)      % validation data performance 
testPerformance = perform(net,testTargets,y)    %test data performance 
Ynew=net(xnew); %Optionally perform additional tests
table( tnew( 1: 3)',Ynew( 1: 3)', 'VariableNames',... 
{'Actual_Torque',' Predicted_Torque'}) 
MSE_testing=sum((tnew-Ynew).^2)/numel(tnew); % Calculate MSE for new data
RMSE_testing=sqrt(sum((tnew-Ynew).^2)/numel(tnew)); % Calculate RMSE for new data



%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of ANN,SVM,NLR(ANN)(Answers may vary )===========')% Datachemical.xlsx was used .
disp('>> ')
disp('>> ')
disp('>> ')
%
Filename='Datachemical.xlsx';% Prediction of outputchemical based on input chemicals

Sheetread='Training';
Input1='A2:C73';
output1='D2:D73';
Input=xlsread(Filename,Sheetread,Input1); 
Target=xlsread(Filename,Sheetread,output1 );
x=Input;
t=Target;
Sheetread1='Newdata';
Input2='A2:C4';
Target2 ='D2:D4';
Inputnew=xlsread(Filename,Sheetread1,Input2);
Targetnew=xlsread(Filename,Sheetread1,Target2 );
xnew=Inputnew; 
tnew=Targetnew;
x=Input';
t=Target';
xnew=Inputnew'; 
tnew=Targetnew';
trainFcn = 'trainlm'; hiddenLayerSize = 10;
net.layers{1}.transferFcn = 'logsig';  %for hidden layer 
net = fitnet(hiddenLayerSize,trainFcn);
net.input.processFcns = {'mapminmax'}; % To standardize the input
net.output.processFcns = {'mapminmax'}; % To standardize the input
%RandStream.setGlobalStream (RandStream ('mrg32k3a'));% Just to get the same results;
net.divideMode = 'sample';
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 10/100;
net.performFcn = 'mse';  % Choose MSE for performance
[net,tr] = train(net,x,t);
view(net);
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y);
figure;plotperform(tr)
figure;plottrainstate(tr)
% figure, plotregression(t,y)   % Regression plot 
trainTargets = t .* tr.trainMask{1}; % Apply a mask (0's and 1's to select the proper targets) to select train data 
valTargets = t .* tr.valMask{1};  %Select validation data
testTargets = t .* tr.testMask{1};  %select test data
trainPerformance = perform(net,trainTargets,y)  % training data performance 
valPerformance = perform(net,valTargets,y)      % validation data performance 
testPerformance = perform(net,testTargets,y)    %test data performance 
Ynew=net(xnew); %Optionally perform additional tests
Newperformance=mse(tnew,Ynew); %MSE for new data
table( tnew( 1: 3)',Ynew( 1: 3)', 'VariableNames',... 
{'Actual_Outputchemical',' Predicted_outputchemical'}) 
MSE_testing=sum((tnew-Ynew).^2)/numel(tnew); % Calculate MSE for new data
RMSE_testing=sqrt(sum((tnew-Ynew).^2)/numel(tnew)); % Calculate RMSE for new data
Errorpercentage=((Ynew-tnew)./tnew)*100; % Calculate error percentage for tnew and ynew


%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of Example of ANN,SVM,NLR(SVM)===========')% Datachemical.xlsx has been used .
disp('>> ')
disp('>> ')
disp('>> ')
Filename='Datachemical.xlsx';
Sheetread='Training';
Input1='A2:C73';
output1='D2:D73';
Input=xlsread(Filename,Sheetread,Input1); 
Target=xlsread(Filename,Sheetread,output1 );
x=Input;
t=Target;
Sheetread1='Newdata';
Input2='A2:C4';
Target2 ='D2:D4';
Inputnew=xlsread(Filename,Sheetread1,Input2);
Targetnew=xlsread(Filename,Sheetread1,Target2 );
xnew=Inputnew; 
tnew=Targetnew;
mdl = fitrsvm(x,t,'KernelFunction', 'gaussian', ...
     'Standardize', true); %standardize the data  %standardize the data and
 %use gaussian kernel to develope and model the data
%   mdl = fitrsvm(x,t,'Standardize', true);
conv = mdl.ConvergenceInfo.Converged; % Shows whether the program reach an answer or not .
% smetimes it cannot find a solution and doesnot converge
iter = mdl.NumIterations; % number of iteration to reach the answer
yfit=predict(mdl,x); % prediction based on the developed SVR model and x as the input 
table(t(40:50,:),yfit(40:50,:),'VariableNames',{'Observedvalue_chemical',' PredictedValue_chemical'}) 
MSE_training=sum((yfit-t).^2)/numel(t); % Calculate MSE for data 
% MSE_training1=mse(yfit,t);
RMSE_training=sqrt(sum((yfit-t).^2)/numel(t)); % Calculate RMSE for data
ynew=predict(mdl,xnew);
table(tnew(:),ynew(:),'VariableNames',{'ObservedValue_Newdata_chemical',' PredictedValue_newdata_chemical'}) % show data in output and predicted output
% MSE_testing1=mse(tnew,ynew);
MSE_testing=sum((tnew-ynew).^2)/numel(tnew); % Calculate MSE for new data
RMSE_testing=sqrt(sum((tnew-ynew).^2)/numel(tnew)); % Calculate RMSE for new data
Errorpercentage=((ynew-tnew)./tnew)*100; % Calculate error percentage for tnew and ynew


%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of ANN,SVM,NLR(NLR)(fitnlm function===========')% regression4.xlsx has been used .
disp('>> ')
disp('>> ')
disp('>> ')
%rng(1);
Filename='Datachemical.xlsx';
Sheetread='Training';
Input1='A2:C73';
output1='D2:D73';
Input=xlsread(Filename,Sheetread,Input1); 
Target=xlsread(Filename,Sheetread,output1 );
x=Input;
t=Target;
Sheetread1='Newdata';
Input2='A2:C4';
Target2 ='D2:D4';
Inputnew=xlsread(Filename,Sheetread1,Input2);
Targetnew=xlsread(Filename,Sheetread1,Target2 );
xnew=Inputnew; 
tnew=Targetnew;
[xn,sxn] = mapminmax(x');% Standardize x 
[tn,stn]= mapminmax(t');% Standardize t
xnewn = mapminmax('apply',xnew',sxn); % The same Process setting of 
%standardization for x should  be applied for xnew as well .%xnewn is the
%standardized xnew 
xn=xn';% standardized x
tn=tn';% standardized t
xnewn=xnewn';%standardized xnew
beta = [1 1 1 1 1 1 1 1 ]; % coefficient initiation
fun=@(b,xn)b(1)+b(2)*xn(:,1)+b(3)*xn(:,2)+b(4)*xn(:,3)+b(5)*(xn(:,1).^2)+b(6)*((xn(:,1).*xn(:,2).*xn(:,3))+b(7).*exp(b(8)*xn(:,3)));% nonlinear model with standardized x
mdl = fitnlm(xn,tn,fun,beta);% find coeffcients(beta) of model(fun )using normalized x and t 
yfitn = predict(mdl,xn);% make prediction based on normalized x
yfit = mapminmax('reverse', yfitn,stn); % To reverse the prediction to original state using the same process setting of t 
table( t( 40:50 ),yfit( 40:50 ), 'VariableNames',... 
    {' TrueLabel',' PredictedLabel'}) 
MSE_training=sum((yfit-t).^2)/numel(t); % Calculate MSE for data 
RMSE_training=sqrt(sum((yfit-t).^2)/numel(t)); % Calculate RMSE for data
ynewn=predict(mdl,xnewn);% make prediction based on normalized new data
ynew = mapminmax('reverse', ynewn,stn); % To reverse the normalized ynew and use the processing setting of t
table(tnew(:),ynew(:),'VariableNames',{'ObservedValue_Newdata_chemical',' PredictedValue_newdata_chemical'}) % show data in output and predicted output
MSE_testing=sum((tnew-ynew).^2)/numel(tnew); % Calculate MSE for new data
RMSE_testing=sqrt(sum((tnew-ynew).^2)/numel(tnew)); % Calculate RMSE for new data
Errorpercentage=((ynew-tnew)./tnew)*100; % Calculate error percentage for tnew and ynew

