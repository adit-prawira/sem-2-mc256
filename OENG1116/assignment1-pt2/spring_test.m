%% s3859061
clear;
clc;
close all;

N = 20;
m = 5;
k = 400;
ke = [k -k; -k k]; % stiffness matrix

MM = m*eye(N);
KK =zeros(N, N);

for i = 1: N-1
    KK(i:i+1,i:i+1)= KK(i:i+1,i:i+1) + 2*ke;
end

[U, D] = eig(KK/2, MM);
fprintf("omega_1 = %7.4f [rad/s], omega_2 = %7.4f [rad/s]\n", ...
    sqrt(D(1,1)), sqrt(D(2,2)));