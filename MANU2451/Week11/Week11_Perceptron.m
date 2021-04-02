clear all
close all
clc

%%%%%%%%
% Data %
%%%%%%%%

% In the order of [x0 x1 x2 d]
Data = [1 0 0 0;
    1 0 1 0;
    1 1 0 0;
    1 1 1 1];

%%%%%%%%%%%%%%
% Parameters %
%%%%%%%%%%%%%%

w = [0.5, 0.5, 0.5]'; % [bias w1 w2]
eta = 0.1; % Try changing this and observe results
epochs = 4;
wrecord = w;

%%%%%%%%%%%%%
% Algorithm %
%%%%%%%%%%%%%

[ndata,mdata] = size(Data);

for i = 1:epochs
    for j = 1:ndata
        x = Data(j,1:3)';
        v = w'*x;
        if v>=0
            y=1;
        else
            y=0;
        end
        d = Data(j,4);
        w = w + eta*(d-y)*x;
        wrecord = [wrecord w];
    end
end
figure, plot(wrecord(1,:))
hold on, plot(wrecord(2,:))
hold on, plot(wrecord(3,:))
legend('bias','w1','w2')
