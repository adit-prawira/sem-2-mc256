%% s3859061
clear
close all
clc

% ROD 1
L1 = 1.2;
a1 = 0.08;
rho1 = 4540;
E1 = 110*10^9;
N1 = 24;
h1 = L1/N1;
m1 = a1*1*rho1; % mass of rod 1

ke1 = ((E1*a1)/h1)*[1 -1; -1 1];
me1 = ((m1*h1)/6)*[2 1; 1 2];

% ROD 2
L2 = 0.8;
a2 = 0.07;
rho2 = 2700;
E2 = 69*10^9;
N2 = 16;
h2 = L2/N2;
m2 = a2*1*rho2; % mass of rod 1
ke2 = ((E2*a2)/h2)*[1 -1; -1 1];
me2 = ((m2*h2)/6)*[2 1; 1 2];

M=zeros([1,1]*(N1 + N2 + 1));
K=zeros([1,1]*(N1 + N2 + 1));

for i = 1 : N1
    idx = [1 2] + (i - 1);
    M(idx, idx) = M(idx, idx) + me1;
    K(idx, idx) = K(idx, idx) + ke1;
end

for i = N1 : (N1+N2)
    idx = [1 2] + (i - 1);
    M(idx, idx) = M(idx, idx) + me2;
    K(idx, idx) = K(idx, idx) + ke2;
end

M(1,:)=[]; 
K(1,:)=[];
M(:,1)=[]; 
K(:,1)=[];

[U, D] = eig(K, M);

w_all=diag(sqrt(abs(D)));
newN = length(M);

for i  = 1: newN
    fprintf("w_%d = %4.0f rad/s \n", i, w_all(i));
end



