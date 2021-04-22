%%
clear; close all; clc;
disp('>> ')
disp('>> ')
disp('>> ========= WELCOME TO THE OENG1116 TUTORIAL-4 (Wk7) ===========')
disp('>> ')
disp('>> ')
disp('>> ')
disp('>> ')
commandwindow
%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Load data===========')
disp('>> ')
disp('>> ')
disp('>> ')
disp('>> ')
a=rand(50,110);           % create random data 
save('output.mat','a');   % save variable in the output.mat file
clear;                     % clear the workspace
load('output.mat');       % load output.mat file
%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Read data from Excel file===========')
disp('>>========= Use load.xlsx=========== ')
disp('>> ')
disp('>> ')
disp('>> ')
Filename='load.xlsx';
Sheetread='Sheet1';
Input1='A2:B4';
output1='C2:C4';
Input=xlsread(Filename,Sheetread,Input1); %Read Microsoft Excel 
Target=xlsread(Filename,Sheetread,output1 );
x=Input;
t=Target;
%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Read data from Excel file===========')
disp('>>========= Use load2.xlsx=========== ')
disp('>> ')
disp('>> ')
disp('>> ')
Filename='load2.xlsx';
Sheetread='load';
Input1='A1:B20';
output1='C1:C20';
Input=xlsread(Filename,Sheetread,Input1); %Read Microsoft Excel 
Target=xlsread(Filename,Sheetread,output1 );
x=Input;
t=Target;
%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Read comma-separated value (CSV) file or text files===========')
disp('>>========= Use csvlist.dat =========== ')
disp('>> ')
filename ='csvlist.dat';
M = csvread(filename);
%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Read comma-separated value (CSV) file or text files===========')
disp('>>========= Use myCsvTable.dat =========== ')
disp('>> ')
disp('>> ')
disp('>> ')
filename = 'myCsvTable.dat';
T = readtable(filename);
%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Find the missing data===========')
disp('>> ')
disp('>> ')
x = [NaN 1 2 3 4];                % NaN:Not-a-Number;
T1= isnan(x);
T2= ismissing(x);                  
%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Fill the missing data===========')
disp('>> ')
disp('>> ')
x =[1 2 3 ;5 6 7;NaN NaN 2];
xFill= fillmissing(x,'previous'); 
xRemove = rmmissing(x);
%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Finding outliers===========')
disp('>> ')
disp('>> ')
x = [57 59 60 100 59 58 57 58 300]; 
A = isoutlier(x); 

%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Replacing the outliers===========')
disp('>> ')
disp('>> ')
x = [57 59 60 100 59 58 57 58 300]; 
B = filloutliers(x, 'previous'); 

%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Data standardization===========')
disp('>> ')
disp('>> ')
x = [1 2 4; 1 1 1; 3 2 2; 0 0 0];
[pn,ps] = mapminmax(x);
x_again = mapminmax('reverse', pn,ps); % To reverse

%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Data normalization===========')
disp('>> ')
disp('>> ')
X = [3 2 4; 9 1 1; 5 2 2; 0 1 0];
[Y,PS] = mapstd(X);
X_again = mapstd('reverse',Y,PS); % To reverse


%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Build an ANN network with 10 neurons in hidden layer===========')
disp('>> ')
disp('>> ')
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize);

%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Build an ANN network with 10 neurons in hidden layer and trainlm as the training function===========')
disp('>> ')
disp('>> ')
hiddenLayerSize = 10;
trainFcn = 'trainlm';
net = feedforwardnet(hiddenLayerSize, trainFcn);

%%

clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Example of using different parameter settings in ANN ============')
disp('>> ')
disp('>> ')
trainFcn = 'trainlm'; hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize,trainFcn); %fitnet for regression
net.input.processFcns = {'mapminmax'}; 
net.divideFcn = 'dividerand'; %data division
net.divideMode = 'sample';   %static network
net.divideMode = 'sample';   % Divide up every sample
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
net.plotFcns = {'plotperform','plottrainstate','ploterrhist'};
net.layers{1}.transferFcn = 'logsig';  %for hidden layer           
net.layers{2}.transferFcn = 'purelin'; %for output layer
net.trainParam.lr=0.05 ;      % learning rate 
net.trainParam.epochs=1000;   % max epochs 
net.trainParam.max_fail=6;
net.trainParam.goal=1e-5 ;    % minimum performance value
net.trainParam.time=60;       % maximum training time in seconds
net.performFcn = 'mse';       % Performance function
%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Train the ANN network============')
disp('>> ')
disp('>> ')
x = [0 1 2 3 4 5 6 7 8];
t = [0 0.84 0.91 0.14 -0.77 -0.96 -0.28 0.66 0.99];
net = feedforwardnet(10);
net = train(net,x,t);
%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Test the network(validation)============')
disp('>> ')
disp('>> ')
x = [0 1 2 3 4 5 6 7 8];
t = [0 0.84 0.91 0.14 -0.77 -0.96 -0.28 0.66 0.99];
plot(x,t,'o')               %plot data 
net = feedforwardnet(10);   %Build the network
net.divideParam.trainRatio = 60/100; % Divide the data 
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 20/100;
RandStream.setGlobalStream (RandStream ('mrg32k3a'));
net = train(net,x,t);       %Train the data 
y = net(x);                 % Validation
plot(x,t,'o',x,y, '*');    % plot t(actual output) versus y1(predicted output)
%%
clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Test the network(validation) ============')
disp('>> ')
disp('>> ')
load x.mat;              % Example1.xlsx is imported %
load t.mat;
x=x'; % Transpose Input 
t=t'; % Transpose Output 
net = feedforwardnet(10);     
%net.divideFcn = 'dividerand';    % Divide data randomly
RandStream.setGlobalStream (RandStream ('mrg32k3a'));       %  Just to reproduce the same results as slides
[net,tr] = train(net,x,t);        % train the network
figure, plotperform(tr);          % performance plot
figure, plottrainstate(tr);       % training state plot 
y=net(x);                         %Test the network 

%%

clear; clc;
disp('>> ')
disp('>> ')
disp('>> ========= Test the network(validation)and calculate the performance ============')
disp('>> ')
disp('>> ')

load x.mat;              % Example2.xlsx is imported %
load t.mat;
x=x'; % Transpose Input 
t=t'; % Transpose Output
plot(x,t,'o');
net = feedforwardnet(20); % build the network with 20 neurons 
net.performFcn
% shows that MSE is the default network performance function
RandStream.setGlobalStream (RandStream ('mrg32k3a')); 
net = train(net,x,t);                % train the network
y = net(x);                          % Validation
perf = perform(net,t,y);  % perf1 = mse(net, t, y)  % performance 
plot(x,t,'o',x,y, '*');    

