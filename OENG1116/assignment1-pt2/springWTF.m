clc
clear
close all

N=4; m=7; k=500;
MM=eye(N+1)*m;
ke=[k -k; -k k]; 
KK=zeros(N+1,N+1); 
for ii=1:N
    KK(ii:ii+1, ii:ii+1)= KK(ii:ii+1, ii:ii+1)+ke;
end

KK(1,:)=[]; KK(:,1)=[]; MM(1,:)=[]; MM(:,1)=[]; 
[U,D]=eig(KK,MM); 
fprintf('w_1 = %7.4f [rad/s]\n',sqrt(D(1,1)))