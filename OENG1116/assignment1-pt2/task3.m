%% s3859061
clear;
clc;
close all;

N = 40;
m = 7;
k = 7000;
ke = [k -k; -k k]; % stiffness matrix

MM = m*eye(2*N + 1);
KK =zeros(2*N + 1, 2*N + 1);

for i = 1: 2*N
    if(mod(i, 2) ~= 0)
        KK(i:i+1,i:i+1)= KK(i:i+1,i:i+1) + 2*ke;
    else
        KK(i:i+1,i:i+1)= KK(i:i+1,i:i+1) + ke;
    end
end

%constraining wall
KK(1,:)=[]; 
KK(:,1)=[];
MM(1,:)=[]; 
MM(:,1)=[]; 

[U, D] = eig(KK, MM);
fprintf("omega_8 = %7.4f [rad/s]\n", sqrt(D(8,8)));