clc
clear
close all

n=50;
m=7; 
k=10000;

N = 2*n;

ke=[k -k; -k k]; 

ko = [k 0; 0 0];

MM=eye(N+1)*m; 

KK=zeros(N+1,N+1); 


for i=1:N
    KK(i:i+1, i:i+1)= KK(i:i+1, i:i+1) + ke;
end

% Contraining wall
KK(1,:)=[]; KK(:,1)=[]; MM(1,:)=[]; MM(:,1)=[]; 

for i=1:N - 1
    if(mod(i, 2) == 0)
        KK(i:i+1, i:i+1)= KK(i:i+1, i:i+1) + 2*ko;
    end 
end

[U,D]=eig(KK(1:n, 1:n),MM(1:n, 1:n)); 
fprintf("size of KK = %d, size of MM = %d\n",length(KK), length(MM));
fprintf('omega_3 = %7.4f [rad/s]\n',sqrt(D(3,3)));