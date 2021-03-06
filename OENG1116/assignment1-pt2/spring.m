clear;
clc;
close all;

N = 50; m = 7; k = 500;
MM = m*eye(N);
KK =zeros(N, N);
ke = [k -k; -k k]; 
wall_k = [0 0; 0 k];

for i = 1:N-1
    if(i > 1)
        MM(i,i) = MM(i,i) + m;
    end
end

for i = 1: N - 1
    if(i > 1)
        KK(i:i+1,i:i+1)= KK(i:i+1,i:i+1) + ke+wall_k;
    else
        KK(i:i+1,i:i+1)= KK(i:i+1,i:i+1) + wall_k;
    end   
end

%constraining wall
 
[U, D] = eig(KK, MM);
fprintf("omega_3 = %7.4f [rad/s]\n", sqrt(D(3,3)));