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
    KK(i:i+1,i:i+1)= KK(i:i+1,i:i+1) + ke;
end


%constraining wall
KK(1,:)=[]; 
KK(:,1)=[];
MM(1,:)=[]; 
MM(:,1)=[]; 