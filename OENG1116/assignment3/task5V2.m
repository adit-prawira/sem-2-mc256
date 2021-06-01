%% s3540341
clear 
close all 
clc

% ROD 1
L1 = 1.2;
A1 = 0.08*0.08;
rho1 = 4540;
E1 = 110*10^9;
N1 = 24;
h1 = L1/N1;
m1 = A1*1*rho1; % mass of rod 1
ke1 = ((E1*A1)/h1)*[1 -1; -1 1];
me1 = ((m1*h1)/6)*[2 1; 1 2];

% ROD 2
L2 = 0.8;
A2 = 0.07*0.07;
rho2 = 2700;
E2 = 69*10^9;
N2 = 16;
h2 = L2/N2;
m2 = A2*1*rho2; % mass of rod 2
ke2 = ((E2*A2)/h2)*[1 -1; -1 1];
me2 = ((m2*h2)/6)*[2 1; 1 2];
V0 = 15;

M1=zeros([1,1]*(N1+1));
K1=zeros([1,1]*(N1+1));

M2=zeros([1,1]*(N2+1));
K2=zeros([1,1]*(N2+1));

%Merge M1 and M2 into M
M=zeros([1,1]*(N1+N2+1));

for ii=1:N1
    idx=[1 2]+(ii-1);
    M1(idx,idx)=M1(idx,idx)+me1;
    K1(idx,idx)=K1(idx,idx)+ke1;
end

for ii=1:N2
    idx=[1 2]+(ii-1);
    M2(idx,idx)=M2(idx,idx)+me2;
    K2(idx,idx)=K2(idx,idx)+ke2;
end


for ii=1:N1+1
    for jj=1:N1+1
       M(ii,jj)= M1(ii,jj);
    end
end

ik=1;

for ii=N1+1:N1+N2+1
    jk=1;
    for jj=N1+1:N1+N2+1
        M(ii,jj)= M2(ik,jk);
          jk=jk+1;
    end
    ik=ik+1;
end
M(N1+1,N1+1)= M1(N1+1,N1+1)+M2(1,1);

%Merge K1 and K2 into K
K=zeros([1,1]*(N1+N2+1));

for ii=1:N1+1
    for jj=1:N1+1
        K(ii,jj)= K1(ii,jj);
    end
end

ik=1;
for ii=N1+1:N1+N2+1
    jk=1;
    for jj=N1+1:N1+N2+1
        K(ii,jj)=K2(ik,jk);
          jk=jk+1;
    end
    ik=ik+1;
end

K(N1+1,N1+1)= K1(N1+1,N1+1)+K2(1,1);

%--- Solve Eignevalue problem---free free rods
[U,D]=eig(K,M);

for i=1:N1+N2+1
    w_FEM(i)=sqrt(abs(diag(D(i,i))));
end

% --Solve Eignevalue problem---Fixed-Free rods
    %introduce boundary conditions u1_dotdot=0; u1=0, u1dot=0;
Kf=K;Kf(1,1)=1;Kf(1,2)=0;Kf(2,1)=0;
Mf=M;Mf(1,1)=0;Mf(1,2)=0;Mf(2,1)=0;
[Uf,Df]=eig(Kf,Mf);

%list all natural frequencies of Fixed free rod system
for i=1:N1+N2+1
    wf_FEM(i)=sqrt(abs(diag(Df(i,i))));
end
%Determine First natural frequency
wf_first=min(wf_FEM);

% 
h=(L1+L2)/(N1+N2);
x=[0:0.01:1]*h;
H1x=1-x/h;
H2x=x/h; % Shape functions

%Constrain left boundary
Mf(:,1)=[];
Mf(1,:)=[];
Kf(:,1)=[];
Kf(1,:)=[];
invMxK=Mf\Kf;

%-----Boundary conditions and EOM
NumFe=N1+N2;
tmax=0.005;

%Calculate initial displacement at the tip of combined rod
% F DL = 1/2 m V0^2      DL1/L1=F/(A1*E1)
DL1=V0*sqrt(m2*L1/(A1*E1));     %Rod 1
DL2=V0*sqrt(m2*L2/(A2*E2));     %Rod 2 
e=DL1+DL2;      % Total initial displacement
x0_1=[e*[1:NumFe]/NumFe]; %Initial axial displacements along combined rod
x0_2=zeros(1,NumFe);    %Initial velocities at each FEM node
x0_2(N1)=-V0/2;
x0_2(N1+1:NumFe)=-V0;
x0=[x0_1,x0_2]';

FEM_xdot_anon=@(t,x) [eye(NumFe)*x(NumFe+1:2*NumFe);-invMxK*x(1:NumFe)];
[tt,xx]=ode45(FEM_xdot_anon, [0 tmax],x0);

%Axial displacement of the free tip (L1+L2) of the combined rod with time
figure;plot(tt,xx(:,NumFe),'b', 'lineWidth',2);grid on;

%Determine uq (displacement) of free tip at time 0.001s in m
tt_index=min([min(find(tt>0.001)) max(find(tt <0.001))]);

answer=xx(tt_index,NumFe);
hold on;plot(tt(tt_index),xx(tt_index,NumFe),'ro')
%3D surface plot u(x,t) of the system response 
figure;hold on;grid on;rotate3d on;

[TT,XX]=meshgrid(tt, [0 L1+L2]);
ZZ=[0*xx(:,1)';xx(:,1)'];surf(TT,XX,ZZ);
colormap jet; lighting phong; shading interp;
contour3(TT,XX,ZZ, [-1:0.2:1]*e,'k');
view([-46,36]);
fprintf("displacement at 0.001 = %.1fmm\n", answer*1000)