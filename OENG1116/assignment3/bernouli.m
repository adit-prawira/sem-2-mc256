clear
clc
close all

bb=60*10^(-3);
hh=10*10^(-3); 
m=7500*bb*hh; 
E=200*10^9;
I=bb*hh^3/12; 
EI=E*I; 

c=sqrt(EI/m);
L=2; 

dropH=2; 

v0=sqrt(2*9.81*dropH);

alphaC=0; 
betaC=0;

NN=10; h=L/NN; dof=(NN+1)*2;

mm=(m*h/420)*[156 22*h 54 -13*h; ... 
    22*h 4*h^2 13*h -3*h^2; ...
    54 13*h 156 -22*h; ... 
    -13*h -3*h^2 -22*h 4*h^2];

kk= (EI/h^3)*[12 6*h -12 6*h; ... 
    6*h 4*h^2 -6*h 2*h^2; ...
    -12 -6*h 12 -6*h;... 
    6*h 2*h^2 -6*h 4*h^2];

K=zeros(dof,dof); 
M=zeros(dof,dof); 

for ii=1:NN
    idx=[1:4]+(ii-1)*2; 
    K(idx,idx)=K(idx,idx)+kk; 
    M(idx,idx)=M(idx,idx)+mm;
end

x0=zeros(2*dof,1); 
x0(dof+1:2:2*dof)=-v0;

M(13,:)=[]; K(13,:)=[];M(:,13)=[]; K(:,13)=[];
M(1,:)=[]; K(1,:)=[];M(:,1)=[]; K(:,1)=[];

x0(dof+13)=[]; % i.e. for dof=22; x0(35)=[]; 
x0(dof+1)=[]; % i.e. for dof=22; x0(23)=[];
x0(13)=[];
x0(1)=[];

C=alphaC*M + betaC*K; 
dof=size(M,1); 

[U,D]=eig(K,M); 
w_all=diag(sqrt(abs(D)));

disp(fprintf('\n========== NUMBER OF FE: %i ======',NN))
disp(fprintf('\n========== NUMBER OF UNCONSTRAINED DOF: %i ======',dof+4)) 
disp(fprintf('\n========== NUMBER OF CONSTRAINED DOF: %i ======',dof)) 
disp(fprintf('\n========== FIRST TWO FREQUENCIES FOR THE CONSTRAINED SYSTEM: ======')) 
disp(fprintf('w_1=%8.4f [rad/s]; w_2=%8.4f [rad/s]',w_all(1),w_all(2)))

% RESPONSE:
A = [zeros(dof, dof) eye(dof, dof) ; -inv(M)*K -inv(M)*C];
B = [zeros(dof, dof) ; inv(M)]; 
C = eye(2*dof, 2*dof); 
D = zeros(2*dof, dof); 

SYS=ss(A,B,C,D); 
[Y,T,X] = initial(SYS,x0); 

figure; 
grid on; 
rotate3d; 
translations=[zeros(size(T)), X(:,2), X(:,4), X(:,6), X(:,8), X(:,10),...
    zeros(size(T)), X(:,13), X(:,15), X(:,17), X(:,19)];

% Plot displacements as 3D surface:
[XX,TT]=meshgrid(linspace(0,L,NN+1),T); 

surf(XX,TT,translations);

% Plot hinged points: 
line('XData',zeros(size(TT(:,1))),'YData',TT(:,1),'ZData',0*TT(:,1),'LineWidth',4,'Color','r'); %A 
tx1=text('String','$A$','Position',[0 0 0],'FontSize',24,'Color','w','FontWeight','bold'); 

line('XData',1.2*ones(size(TT(:,1))),'YData',TT(:,1),'ZData',0*TT(:,1),'LineWidth',4,'Color','r'); %B 
tx2=text('String','$B$','Position',[1.2 0 0],'FontSize',24,'Color','w','FontWeight','bold'); 

xl=xlabel('$x$ [m]');
yl=ylabel('$t$ [s]'); 
zl=zlabel('$y$ [m]'); 

set([xl,yl,zl,tx1,tx2],'Interpreter','LaTeX');
camlight('left'); 
lighting phong; 
shading interp; 
colormap jet;
axis tight; 
view([-47 28]); 
set(gca,'FontSize',18);
set(gcf,'Position',[100 120 1400 600]);
