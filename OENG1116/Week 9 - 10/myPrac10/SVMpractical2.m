%%
clear; close all; clc;
disp('>> ')
disp('>> ')
disp('>> ========= WELCOME TO THE OENG1116 TUTORIAL-6===========')
disp('>> ')
disp('>> ')
disp('>> ')
disp('>> ')
commandwindow


%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of regression with linear kernel ===========')
disp('>> ')
disp('>> ')
disp('>> ')
disp('>> ')
rng(1);
x = 0:0.01:5 ;
t = sin(x)+rand(1, length(x)) ;
x = x' ;
t = t' ;
Mdl = fitrsvm(x,t,'Standardize',true);% develope model with linear kernel
y= predict(Mdl,x);%y is the predicted output based on model Mdl and input x
scatter(x,t); % Scatter plot                                                 
hold on                                                
plot(x,y,'r.')
%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of regression with Gaussian kernel ===========')
disp('>> ')
disp('>> ')
disp('>> ')
disp('>> ')
rng(1);
x = 0:0.01:5 ;
t = sin(x)+rand(1, length(x)) ;
x = x' ;
t = t' ;
Mdl = fitrsvm(x,t,'KernelFunction','gaussian','Standardize',true); 
%develope model with gaussian kernel
y= predict(Mdl,x);%y is the predicted output based on model Mdl and input x                                 
scatter(x,t); % Scatter plot                                                 
hold on                                                
plot(x,y,'r.')
%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of regression with polynomial kernel ===========')
disp('>> ')
disp('>> ')
disp('>> ')
disp('>> ')
rng(1);
x = 0:0.01:5 ;
t = sin(x)+rand(1, length(x)) ;
x = x' ;
t = t' ;
Mdl = fitrsvm(x,t,'KernelFunction','polynomial','polynomialorder',2,'Standardize',true);
%develope model with polynomial kernel
y= predict(Mdl,x);%y is the predicted output based on model Mdl and input x                                 
scatter(x,t); % Scatter plot                                                 
hold on                                                
plot(x,y,'r.')
%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of classification_1 with gaussian kernel ===========')
disp('>> ')
disp('>> ')
disp('>> ')
disp('>> ')
load ionosphere.mat 
rng(1);  % random number generation to reproduce results
 mdl = fitcsvm(X,Y, 'KernelFunction', 'gaussian', ...
    'KernelScale','auto',...
    'BoxConstraint', 1, ...
    'Solver','L1QP',...
    'Standardize', true);% use fitcsvm with gaussian kernel and solver L1QP
% mdl = fitcsvm(X,Y,'Standardize', true);
 y_expected=predict(mdl,X);
table( Y( 82:93 ),y_expected( 82:93 ), 'VariableNames',... 
    {' TrueLabel',' PredictedLabel'}) %Show the results of 82th to 93th data of the output and predicted output.


%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of Regression-1(With kernel)===========')% SVR1.xlsx has been used .
disp('>> ')
disp('>> ')
disp('>> ')
rng(1);
Filename='SVR1.xlsx';
Sheetread='x';
Input1='A1:M252';
Sheetread1='t';
output1='A1:A252';
Input=xlsread(Filename,Sheetread,Input1); %Read Microsoft Excel 
Target=xlsread(Filename,Sheetread1,output1 );
x=Input;
t=Target;
mdl = fitrsvm(x,t, 'KernelFunction', 'polynomial', ...
    'polynomialorder',2,'Standardize', true); %To standardize the data 
%and use polynomial function as the kernel with order 2.
yfit=predict(mdl,x); % prediction based on the developed SVR model and x as the input 
table(t(40:50,:),yfit(40:50,:),'VariableNames',{'ObservedValue',' PredictedValue'}) % show 40th to 50th data in output and predicted output
MSE_training=sum((yfit-t).^2)/numel(t); % Calculate MSE for training data 
RMSE_training=sqrt(sum((yfit-t).^2)/numel(t)); % Calculate RMSE for training data 

%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of Regression-2===========')% SVR2.xlsx has been used .
disp('>> ')
disp('>> ')
disp('>> ')
rng(1);
Filename='SVR2.xlsx';
Sheetread='x';
Input1='A1:A94';
Sheetread1='t';
output1='A1:A94';
Input=xlsread(Filename,Sheetread,Input1); %Read Microsoft Excel 
Target=xlsread(Filename,Sheetread1,output1 );
x=Input;
t=Target;
mdl = fitrsvm(x,t, 'KernelFunction', 'gaussian', ...
    'Solver','L1QP',...
    'Standardize', true); %To standardize the data 
% and use gaussian function as the kernel .
%    mdl = fitrsvm(x,t,'Standardize', true);
yfit=predict(mdl,x); % prediction based on the developed SVR model and x as the input 
table(t(20:30,:),yfit(20:30,:),'VariableNames',{'ObservedValue',' PredictedValue'}) % show 20th to 30th data in output and predicted output
MSE_training=sum((yfit-t).^2)/numel(t); % Calculate MSE for data ;numel :number of elements 
RMSE_training=sqrt(sum((yfit-t).^2)/numel(t)); % Calculate RMSE for data ;numel :number of elements 



%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of Regression-3(kernel linear and gaussian===========')% SVR3.xlsx has been used .
disp('>> ')
disp('>> ')
disp('>> ')
rng(1);
Filename='SVR3.xlsx';
Sheetread='Sheet1';
Input1='A1:B89';
output1='C1:C89';
Input=xlsread(Filename,Sheetread,Input1); %Read Microsoft Excel 
Target=xlsread(Filename,Sheetread,output1 );
Sheetread1='Sheet2';
Input2='A1:B11';
Target2 ='C1:C11';
Inputnew=xlsread(Filename,Sheetread1,Input2);
Targetnew=xlsread(Filename,Sheetread1,Target2 );
x=Input;
t=Target;
xnew=Inputnew; 
tnew=Targetnew;
x=fillmissing(x,'spline'); %fill in the missing input data
t= fillmissing(t,'spline'); %fill in the missing output data
mdl=fitrsvm(x,t,'Standardize',true,'KernelFunction','gaussian','epsilon',0.3); %standardize the data 
%and use gaussian kernel to develope and model the data
%mdl = fitrsvm(x,t,'Standardize', true);
yfit=predict(mdl,x); % prediction based on the developed model and x as the input 
RMSE_Training=sqrt(sum((yfit-t).^2)/numel(yfit)); % Calculate RMSE for training data 
table(t(60:70,:),yfit(60:70,:),'VariableNames',{'ObservedValue',' PredictedValue'}) % show 60th to 70th data in output and predicted output 
ynew=predict(mdl,xnew);% prediction based on new data 
RMSE_Testing=sqrt(sum((ynew-tnew).^2)/numel(ynew)); % Calculate RMSE for new data

%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of Regression-4 with Kernel and without kernel===========')% SVR4.xlsx has been used .
disp('>> ')
disp('>> ')
disp('>> ')
rng(1);
Filename='SVR4.xlsx';
Sheetread='Sheet1';
Input1='A1:H72';
output1='I1:I72';
Input=xlsread(Filename,Sheetread,Input1); %Read Microsoft Excel 
Target=xlsread(Filename,Sheetread,output1 );
x=Input;
t=Target;
Sheetread1='Sheet2';
Input2='A1:H3';
Target2 ='I1:I3';
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
table(t(20:30,:),yfit(20:30,:),'VariableNames',{'ObservedValue',' PredictedValue'}) % show 20th to 30th data in output and predicted output
MSE_training=sum((yfit-t).^2)/numel(t); % Calculate MSE for data 
% MSE_training1=mse(yfit,t);
RMSE_training=sqrt(sum((yfit-t).^2)/numel(t)); % Calculate RMSE for data
ynew=predict(mdl,xnew);
table(tnew(:),ynew(:),'VariableNames',{'ObservedValue_Newdata',' PredictedValue_newdata'}) % show data in output and predicted output
% MSE_testing1=mse(tnew,ynew);
MSE_testing=sum((tnew-ynew).^2)/numel(tnew); % Calculate MSE for new data
RMSE_testing=sqrt(sum((tnew-ynew).^2)/numel(tnew)); % Calculate RMSE for new data
Errorpercentage=((ynew-tnew)./tnew)*100; % Calculate error percentage for tnew and ynew
