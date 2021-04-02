clear all;
close all;
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Import Data and Randomise Order %
% Choose 70% as training set      %
% And remaining 30% as test set   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

IrisData;

[n,m] = size(IrisAttributesAndTypes);
i = randperm(n);
IrisDataJumbled = IrisAttributesAndTypes(i,:);

SeventyPercent = round(0.7*n,0);
IrisDataTrain = IrisDataJumbled(1:SeventyPercent,:);
IrisDataTest = IrisDataJumbled(SeventyPercent+1:n,:);
 
x = IrisDataTrain(:,1:4)';
y = IrisDataTrain(:,5:7)';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% specify the structure and learning algorithm for MLP %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

net=newff(minmax(x),[5,3],{'tansig','purelin'},'trainlm');
net.trainparam.show=2000; % epochs between display
net.trainparam.lr=0.01; % learning rate
net.trainparam.epochs=10000; % maximum epochs to train
net.trainparam.goal=1e-4; % performance goal, training will stop if this is reached

%%%%%%%%%%%%%%%%%
% Train the MLP %
%%%%%%%%%%%%%%%%%

[net,tr]=train(net,x,y);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test the MLP, net_output is the output of the MLP, ytest is the desired output. % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xtest = IrisDataTest(:,1:4)';
ytest = IrisDataTest(:,5:7)';
net_output=sim(net,xtest);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot out the test results %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[p,q] = size(ytest);
for j = 1:q
    [val_Actual(j),idx_Actual(j)] = max(ytest(:,j)); % Switch back from 3 numbers to specific class
    [val_Predicted(j),idx_Predicted(j)] = max(net_output(:,j));
end

plot(idx_Actual,'b-');
hold on;
plot(idx_Predicted,'r-');
hold off
legend('actual','predicted')