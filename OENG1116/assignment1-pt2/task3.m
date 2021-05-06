%% s3859061
clear;
clc;
close all;

n = 40;
m = 7;
k = 7000;

N = 2*n + 1;

ke = [k -k; -k k]; % stiffness matrix
ko = [k 0; 0 0];

MM = m*eye(N+1 );
KK =zeros(N+1, N+1);

for i = 1: N
   KK(i:i+1, i:i+1)= KK(i:i+1, i:i+1)+ke;
end

%constraining wall
KK(1,:)=[]; 
KK(:,1)=[];
MM(1,:)=[]; 
MM(:,1)=[]; 

newN = length(KK);
for i = 1: newN - 1
    
   if(mod(i, 2) ~= 0)
       if(i > 1)
           KK(i,i) = KK(i,i) + 2*k;
           
       else
           KK(i,i) = KK(i,i) + k;
       end  
       
       KK(i, i+2) = -k;
       KK(i+2, i) = -k;
   end   
end

KK(newN, newN) = KK(newN, newN) + k;

[U, D] = eig(KK, MM);
fprintf("size of KK = %d, size of MM = %d\n",length(KK), length(MM));
fprintf("omega_8 = %7.4f [rad/s]\n", sqrt(D(8,8)));