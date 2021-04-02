%%
clear; close all; clc;
disp('>> ')
disp('>> ')
disp('>> ========= WELCOME TO THE OENG1116 TUTORIAL-5===========')
disp('>> ')
disp('>> ')
disp('>> ')
disp('>> ')
commandwindow


%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of classification-1  ===========')
disp('>> ')
disp('>> ')
load ionosphere.mat % An example of a built-in data set in Matlab
rng(1);  % random number generation to reproduce results
 mdl = fitcsvm(X,Y); %Build and train the model;X is the input;Y is the output
  y_expected=predict(mdl,X); %y_expected is the predicted output
table( Y( 10: 20),y_expected( 10: 20), 'VariableNames',... 
    {' TrueLabel',' PredictedLabel'}) %Show the results of 10th to 20th data of the output and predicted output.


%%

clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of fitcecoc function for multi-class classification===========')
disp('>> ')
disp('>> ')
disp('>> ')
clear;clc;
load fisheriris.mat;% An example of a built-in data set in Matlab
rng(1);
x = meas; 
t = species; 
Mdl = fitcecoc(x,t) ;% develope and train model for multiclass classification
y_expected=predict(Mdl,x); %y_expected is the predicted output
table( t( 70: 90),y_expected( 70: 90), 'VariableNames',... 
    {' TrueLabel',' PredictedLabel'}) %Show the results of 10th to 20th data of the output and predicted output.
%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of Regression-1===========')% SVR1.xlsx has been used .
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
mdl=fitrsvm(x,t,'Standardize',true); %standardize the data 
yfit=predict(mdl,x); % prediction based on the developed SVR model and x as the input 
table(t(40:50,:),yfit(40:50,:),'VariableNames',{'ObservedValue',' PredictedValue'}) % show 40th to 50th data in output and predicted output
RMSE_training=sqrt(sum((yfit-t).^2)/numel(t)); % Calculate RMSE for data 

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
mdl=fitrsvm(x,t,'Standardize',true); %standardize the data and use linear kernel to develope and model the data
yfit=predict(mdl,x); % prediction based on the developed SVR model and x as the input 
table(t(20:30,:),yfit(20:30,:),'VariableNames',{'ObservedValue',' PredictedValue'}) % show 20th to 30th data in output and predicted output
RMSE_training=sqrt(sum((yfit-t).^2)/numel(t)); % Calculate RMSE for data ;numel :number of elements 
%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of Regression-3===========')% SVR3.xlsx has been used .
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
mdl=fitrsvm(x,t,'Standardize',true); %standardize the data and use linear kernel to develope and model the data
yfit=predict(mdl,x); % prediction based on the developed SVR model and x as the input 
RMSE_Training=sqrt(sum((yfit-t).^2)/numel(yfit)); % Calculate RMSE for training data 
table(t(60:70,:),yfit(60:70,:),'VariableNames',{'ObservedValue',' PredictedValue'}) % show 60th to 70th data in output and predicted output 
ynew=predict(mdl,xnew);% prediction based on new data 
RMSE_Testing=sqrt(sum((ynew-tnew).^2)/numel(ynew)); % Calculate RMSE for new data 


%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of Regression-4 without Kernel===========')% SVR4.xlsx has been used .
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
mdl=fitrsvm(x,t,'Standardize',true); %standardize the data and use gaussian kernel to develope and model the data
yfit=predict(mdl,x); % prediction based on the developed SVR model and x as the input 
table(t(20:30,:),yfit(20:30,:),'VariableNames',{'ObservedValue',' PredictedValue'}) % show 20th to 30th data in output and predicted output
RMSE_training=sqrt(sum((yfit-t).^2)/numel(t)); % Calculate RMSE for data 
ynew=predict(mdl,xnew);
table(tnew(:),ynew(:),'VariableNames',{'ObservedValue_Newdata',' PredictedValue_newdata'}) % show data in output and predicted output
RMSE_testing=sqrt(sum((ynew-tnew).^2)/numel(tnew)); % Calculate RMSE for new data 
Errorpercentage=((ynew-tnew)./tnew)*100; % Calculate error percentage for tnew and ynew 


