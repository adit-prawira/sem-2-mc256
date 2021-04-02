%%
clear; close all; clc;
disp('>> ')
disp('>> ')
disp('>> ========= WELCOME TO THE OENG1116 TUTORIAL-7===========')
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
disp('>> ========= Example of fitlm_1===========')
disp('>> ')
disp('>> ')
disp('>> ')
rng(1);
load hald % built-in data set in Matlab
mdl = fitlm(ingredients,heat,'linear') ; 
heatpred = predict(mdl,ingredients);
table( heat( : ),heatpred( : ), 'VariableNames',... 
    {' Heat',' Predicted_heat'}) %Show the results of data of the output and predicted output.

%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= fitlm_2===========')% regression1.xlsx has been used .
disp('>> ')
disp('>> ')
disp('>> ')
rng(1);
Filename='regression1.xlsx';
Sheetread='Sheet1';
Input1='A1:A100';
output1='B1:B100';
Input=xlsread(Filename,Sheetread,Input1); %Read Microsoft Excel 
Target=xlsread(Filename,Sheetread,output1 );
x=Input;
t=Target;
t= fillmissing(t,'spline'); %fill in the missing output data
mdl = fitlm(x,t,'linear');
ypred = predict(mdl,x);
plot(x,t,'o',x,ypred,'x')
legend('Data','Predictions')


%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of polyfit function_1===========')
disp('>> ')
disp('>> ')
disp('>> ')

x=[0.1;0.2;0.4;0.6;0.9;1.3;1.5;1.7;1.8];
y=[0.75;1.25;1.45;1.25;0.85;0.55;0.35;0.28;0.18];
p1=polyfit(x,y,7);% returns the coefficients for a polynomial p(x) of degree 7
y_predict=polyval(p1,x);
plot(x,y,'o',x,y_predict,'-');
table( y( : ),y_predict( : ), 'VariableNames',... 
    {' Actual_y',' Predicted_y'}) %Show the results of data of the output and predicted output.

%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of polyfit function_2===========')
disp('>> ')
disp('>> ')
disp('>> ')
x = linspace(0,1,5); % input 
t = 1./(1+x);% output
p = polyfit(x,t,4); %gives the coefficients 
xnew = linspace(0,2); % new x
tnew = 1./(1+xnew); % new y
ynew = polyval(p,xnew);
figure 
plot(x,t,'o')
hold on 
plot(xnew,tnew)
plot(xnew,ynew,'r--')
legend('t','tnew','ynew')
%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of polyfit function_3===========')
disp('>> ')
disp('>> ')
disp('>> ')
data=[0 0.562
0	0.58
0	0.549
25	0.572
25	0.6
25	0.572
57	0.744
57	0.749
57	0.742
90	0.776
90	0.789
90	0.824
115	0.959
115	0.993
115	0.949
136	1.248
136	1.282
136	1.304
165	1.492
165	1.468
165	1.49
186	1.854
186	1.804
];
figure(1);
plot(data(:,1),data(:,2),'ks');grid on;% plotting with black squares
x=data(:,1);
y=data(:,2);
m1=polyfit(x,y,1); %build a first order polynomial model ,m1 are the coefficients (linear )
p1=polyval(m1,x);
m2=polyfit(x,y,2);%build a second order polynomial model ,m2 are the coefficients
p2=polyval(m2,x);
m3=polyfit(x,y,3);%build a second order polynomial model ,m3 are the coefficients
p3=polyval(m3,x);
m4=polyfit(x,log(y),1);%build a logarithmic model of order 1 ,m4 are the coefficients
p4=polyval(m4,x);
figure(2);
subplot(2,2,1),plot(x,y,'ko'),hold on,plot(x,p1,'k--');grid on,title('first order');
subplot(2,2,2),plot(x,y,'ko'),hold on,plot(x,p2,'k--');grid on,title('second order');
subplot(2,2,3),plot(x,y,'ko'),hold on,plot(x,p3,'k--');grid on,title('third order');
subplot(2,2,4),plot(x,log(y),'ko'),hold on,plot(x,p4,'k--');grid on,title('logarithmic fit');


%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of lsqcurvefit function_1===========')
disp('>> ')
disp('>> ')
disp('>> ')
rng(1); 
x = linspace(0,3);
t = exp(-1.3*x) + 0.05*randn(size(x));
fun = @(b,x)b(1)*exp(b(2)*x); % Defining the Model function
b0 = [1/2,-2]; %Coefficient initiation 
mdl = lsqcurvefit(fun,b0,x,t); % obtaining the coefficients.
ypredicted=fun(mdl,x);
plot(x,t,'ko',x,ypredicted,'b-')
legend('Data','Fitted exponential')
title('Data and Fitted Curve')
%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of lsqcurvefit function_2===========')
disp('>> ')
disp('>> ')
disp('>> ')
rng(1);
x = [-2,-1.64,-1.33,-0.7,0,0.45,1.2,1.64,2.32,2.9]; 
t = [0.699369,0.700462,0.695354,1.03905,1.97389,2.41143,1.91091,0.919576,-0.730975,-1.42001]; 
fun = @(b,x)b(1)*cos(b(2)*x)+b(2)*sin(b(1)*x); 
b = [1,0.2]; 
mdl = lsqcurvefit(fun,b,x,t);% mdl will be the coefficients
ypredicted=fun(mdl,x);%This equals to yexpected =mdl(:,1)*cos(mdl(:,2)*x)+mdl(:,2)*sin(mdl(:,1)*x)
plot(x,t,'ko',x,ypredicted,'b-')
legend('Data','Fitted exponential')
title('Data and Fitted Curve')
table( t(: ),ypredicted(:), 'VariableNames',... 
    {' Actual_y',' Predicted_y'}) 



%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of fitnlm function_1===========')% regression2.xlsx has been used .
disp('>> ')
disp('>> ')
disp('>> ')
rng(1) ;
Filename='regression2.xlsx';
Sheetread='Sheet1';
Input1='A1:B406';
output1='C1:C406';
Input=xlsread(Filename,Sheetread,Input1); %Read Microsoft Excel 
Target=xlsread(Filename,Sheetread,output1 );
x=Input;
t=Target;
x=fillmissing(x,'spline'); %fill in the missing input data
t= fillmissing(t,'spline'); %fill in the missing output data
modelfun = @(b,x)(b(1) + b(2)*x(:,1).^b(3) +...
b(4)*x(:,2).^b(5)); % nonlinear model
beta0 = [-50 500 -1 500 -1]; % coefficients initiation
mdl = fitnlm(x,t,modelfun,beta0); 
y_expected = predict(mdl,x);
table( t (10:20 ),y_expected( 10:20 ), 'VariableNames',... 
    {' TrueLabel',' PredictedLabel'}) %Show the results of 1st  to 10th data of the output and predicted output.
MSE_training= (mean((t - y_expected).^2));
RMSE_training = sqrt(mean((t - y_expected).^2));

%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of fitnlm function_2===========')% regression3.xlsx has been used .
disp('>> ')
disp('>> ')
disp('>> ')
rng(1) ;
Filename='regression3.xlsx';
Sheetread='Sheet1';
Input1='A1:C13';
output1='D1:D13';
Input=xlsread(Filename,Sheetread,Input1); %Read Microsoft Excel 
Target=xlsread(Filename,Sheetread,output1 );
x=Input;
t=Target;
beta = [1 1 1 1 1]; % coefficient initiation
fun = @(b,x)((b(1)*x(:,2)-x(:,3)/b(5))./(1+b(2)*x(:,1)+b(3)*x(:,2)+b(4)*x(:,3)));
mdl = fitnlm(x,t,fun,beta)
y_expected = predict(mdl,x);
table( t( : ),y_expected( : ), 'VariableNames',... 
    {' Actual_Y',' PredictedY'}) %Show the results of 5th  to 10th data of the output and predicted output.
MSE_training= (mean((t - y_expected).^2));
RMSE_training = sqrt(mean((t - y_expected).^2));
%%
clear;
clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of fitnlm function_3===========')% regression4.xlsx has been used .
disp('>> ')
disp('>> ')
disp('>> ')
rng(1);
Filename='regression4.xlsx';
Sheetread='Sheet1';
Input1='A1:C72';
output1='D1:D72';
Input=xlsread(Filename,Sheetread,Input1); %Read Microsoft Excel 
Target=xlsread(Filename,Sheetread,output1 );
x=Input;
t=Target;
[xn,sxn] = mapminmax(x');% Standardize x 
[tn,stn]= mapminmax(t');% Standardize t
Sheetread1='Sheet2';
Input2='A1:C3';
Target2 ='D1:D3';
Inputnew=xlsread(Filename,Sheetread1,Input2);
Targetnew=xlsread(Filename,Sheetread1,Target2 );
xnew=Inputnew; 
tnew=Targetnew;
xnewn = mapminmax('apply',xnew',sxn); % The same Process setting of 
%standardization for x should  be applied for xnew as well .%xnewn is the
%standardized xnew 
xn=xn';% standardized x
tn=tn';% standardized t
xnewn=xnewn';%standardized xnew
beta = [1 1 1 1 1 1 ]; % coefficient initiation
fun=@(b,xn)b(1)+b(2)*xn(:,1)+b(3)*xn(:,2)+b(4)*xn(:,3)+b(5)*(xn(:,1).^2)+b(6)*((xn(:,1).*xn(:,2).*xn(:,3)));% nonlinear model with standardized x
mdl = fitnlm(xn,tn,fun,beta);% find coeffcients(beta) of model(fun )using normalized x and t 
yfitn = predict(mdl,xn);% make prediction based on normalized x
yfit = mapminmax('reverse', yfitn,stn); % To reverse the prediction to original state using the same process setting of t 
table( t( 10:20 ),yfit( 10:20 ), 'VariableNames',... 
    {' TrueLabel',' PredictedLabel'}) %Show the results of 5th  to 10th data of the output and predicted output.
MSE_training=sum((yfit-t).^2)/numel(t); % Calculate MSE for data 
RMSE_training=sqrt(sum((yfit-t).^2)/numel(t)); % Calculate RMSE for data
ynewn=predict(mdl,xnewn);% make prediction based on normalized new data
ynew = mapminmax('reverse', ynewn,stn); % To reverse the normalized ynew and use the processing setting of t
table(tnew(:),ynew(:),'VariableNames',{'ObservedValue_Newdata',' PredictedValue_newdata'}) % show data in output and predicted output
MSE_testing=sum((tnew-ynew).^2)/numel(tnew); % Calculate MSE for new data
RMSE_testing=sqrt(sum((tnew-ynew).^2)/numel(tnew)); % Calculate RMSE for new data
Errorpercentage=((ynew-tnew)./tnew)*100; % Calculate error percentage for tnew and ynew
% R=corr(ynew,tnew);