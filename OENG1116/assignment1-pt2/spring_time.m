clc
clear
close all

N=20; m=5; k=400;

M=eye(2*N)*m;

ke=[k -k;-k k];

K=zeros(2*N,2*N);

for n=1:2*N-1
    K(n,n)=k;
    K(n,2*N-n+1)=-k;
    K(2*N-n+1,n)=-k;
    K(2*N-n+1,2*N-n+1)=k;
end

for n=1:2*N-1
     K(n:n+1,n:n+1)=K(n:n+1,n:n+1)+ke;
end

[U,D]=eig(K,M);

fprintf('w_1 = %7.4f [rad/s]\n',sqrt(D(1,1)))

fprintf('w_2 = %7.4f [rad/s]\n',sqrt(D(2,2)))