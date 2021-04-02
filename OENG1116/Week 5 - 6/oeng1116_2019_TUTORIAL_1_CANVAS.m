%%
clear; clc;
disp('% ===== CHECKING VERSION OF RUNNING MATLAB & AVAILABLE CONTENT =====')
ver %displays the version of matlab installed on  the system
commandwindow
%%
clc
disp('% ===== !!!VERY!!! USEFUL COMMAND: "PWD" =====')
pwd %displays the current working directory
commandwindow
%%
clc
disp('% ===== USEFUL COMMANDS: "CLC" and "LS" =====')
ls
commandwindow
%%
clc;
disp('% ===== GETTING PROPERTIES OF MATRICES =====')
a=[1 2 3 4 5]; b=[10:10:70]; who
whos
class(a)
commandwindow
%%
clc;
disp('% ===== UNDERSTAND "PATH" =====')
path
commandwindow

%%
clc;
disp('% ===== "HELP" is MOST HELPFUL COMMAND =====')
help xlabel
commandwindow

%%
clc;
disp('% ===== VERSATILE HELP =====')
doc eye
commandwindow

%%
clc;
disp('% ===== CALCULATOR! =====')
1+1
commandwindow

%%
clc
disp('% ===== DISPLAYING PI =====')
pi
commandwindow

%%
clc
disp('% ===== FORMATTED PRINT =====')
sprintf('PI = %20.18f',pi)
commandwindow

%%
clc
disp('% ===== FUNCTION OF AN ARRAY =====')
sin([0:30:180]*pi/180)
commandwindow

%%
clc
disp('% ===== PSEUDO POWER =====')
sum([10:12].^2)
commandwindow

%%
clc
disp('% ===== ENTERING A VECTOR MATRIX =====')
a=[1 2 3 4]
commandwindow

%%
clc
disp('% ===== ENTERING A MATRIX & UNDERSTANDING ITS DIMENSIONS =====')
a=[1 2 3 4 5; 10 20 30 40 50; 100 200 300 400 500]
size(a)
commandwindow

%%
clc
disp('% ===== EXTRACTING SUB-SET OF THE MATRIX =====')
a
a(3,:)
a([2 3], [3 4])
commandwindow

%%
disp('% ===== SPECIAL MATRICES: zeros, ones, eye =====')

z = zeros(4,3)
E = eye(2)
I = ones(2,3)
commandwindow



%%
clc
disp('% ===== INVERSION & TRANSPOSITION OF THE MATRIX =====')
b=[1 2 3; 4 5 6; 7 8 10];
p=inv(b)
q=b'
commandwindow

%%
clc
b=[1 2 3; 4 5 6; 7 8 10];
p=inv(b);
disp('% ===== FORMAT SHORT & LONG; MATRIX INVERSION; PSEUDO MULTIPLICATION =====')
format long;
p=inv(b)
format short;
p=b.*b
commandwindow

%%
clear; close all; clc;
disp('% ===== MUST KNOW: PLOTTING CIRCLE =====')
t=0:0.1:2*pi; ff=figure; plot(t,sin(t)); grid on
commandwindow

%%
disp(' ')
disp('% ===== ADDING x and y LABLES & TITLE =====')
xlabel('t,[s]'); ylabel('sin(t)'); title('My first plot in MATLAB')
commandwindow
figure(ff)


%%
clear; close all; clc; 
ff=figure;
t=0:0.1:2*pi;
y1=sin(t);
y2=cos(t);
h1=plot(t,y1,'r');
hold on; % add plot on same graph
h2=plot(t,y2,'b--');
grid on
commandwindow

%%
disp('% ===== LINE''s HANDLER: SHOW PROPERTIES =====')
get(h1)
commandwindow

%%
disp('% ===== USING HANDLERS TO CHANGE OBJECT''s PROPERTY =====')
set(h1,'LineWidth',5)
commandwindow
figure(ff)
%%
clc;
disp('% ===== LINSPACE COMMAND =====')

x = linspace(0,2*pi);
y = sin(x);
plot(x,y);
title('x ranges from 0 to 2\pi')
grid on 
commandwindow

%%
clear; close all; clc
disp('% ===== SUBPLOTS =====')

w1=2*pi; w2=20*w1;
tmax=2; tstep=0.001;
t=0:tstep:tmax;
y1=sin(w1*t); y2=0.2*sin(w2*t);

ff=figure;
subplot(3,1,1);
plot(t,y1);
axis([0 tmax [-1 1]*1.3]);
ylabel('y_1');
grid
commandwindow

%%
disp('% ===== Adding Subplots 2 & 3 =====')
commandwindow

subplot(3,1,2);
plot(t,y2);
axis([0 tmax [-1 1]*1.3]);
ylabel('y_2');
grid on
 
subplot(3,1,3);
plot(t,y1+y2);
axis([0 tmax [-1 1]*1.3]);
ylabel('y_1 + y_2');
xlabel('Time,s')
grid on
figure(ff)


%%
clear; close all; clc

disp('% ===== PLOTTING CIRCLE using Parametric Coordinates =====')

th=[0:1:360]*pi/180;
x=1*cos(th);  y=1*sin(th);
figure; plot(x,y);
xlabel('x'); ylabel('y'); 
axis equal 
commandwindow

%%
clc; close all; figure; 
disp('% ===== PLOTTING CIRCLE in Cartesian Coordinates =====')

R=10;
x=[-1:0.001:1]*R;
y1=sqrt(R^2-x.^2);
y2=-y1;
plot(x,y1,'b',x,y2,'r','LineWidth',2); 
xlabel('x'); ylabel('y');
axis square; grid on;
title('x^2+y^2=R^2');
commandwindow

%%
clc
disp('% ===== FORMATTED PRINT of PI =====')
sprintf('PI = %4.2f',pi)
sprintf('PI = %10.2f',pi)
sprintf('PI = %20.18f',pi)
commandwindow


%%
clc
disp('% ===== STARTING NEW LINE, using CONTROL CHARACTER \n =====')
a = [1.02 3.04 5.06];
fprintf('%d\n',round(a))
commandwindow

%%
clc
disp('% ===== Create an anonymous functions: VERY IMPORTANT TOPIC!!! ===== ')
y = @(x) x^2-1
y(2)
y(4)
commandwindow

%%

clc;
disp('% ===== Basic Loops =====')
for i=1:10, disp(sprintf(' i= %2i i x PI = %g', i, i*pi)); end
commandwindow

%%
clc;
disp('% ===== "INTERP1" COMMAND: IMPORTANT FOR ASSIGNMENT-1 =====')
commandwindow

% Example-1
figure; hold on;
X=[2 6]; Y=[3 5]; plot(X,Y,'b-*'); 
Xi=4; 
Yi=interp1(X,Y,Xi); 
plot(Xi,Yi,'ro','LineWidth',3);
xlabel('x'); ylabel('y'); 

%%

clc;
disp('% ===== "INTERP1" COMMAND: IMPORTANT FOR ASSIGNMENT-1 =====')
commandwindow

figure; hold on;
X=[2 6]; Y=[3 5]; plot(X,Y,'b-*'); 
Xi=[4 5 5.5]; 
Yi=interp1(X,Y,Xi); 
plot(Xi,Yi,'ro','LineWidth',3);

%%
clc;
disp('% ===== "INTERP1" COMMAND: IMPORTANT FOR ASSIGNMENT-1 =====')
commandwindow

figure; hold on;
X=[2 6]; Y=[3 5]; plot(X,Y,'b-*'); 
Yi=[4]; 
Xi=interp1(Y,X,Yi); 
plot(Xi,Yi,'rx','LineWidth',3);
xlabel('x'); ylabel('y'); 



%%
clear; close all; clc;
disp('% ===== "INTERP1" COMMAND: IMPORTANT FOR ASSIGNMENT-1 =====')
% Example-4
commandwindow

X = 0:10; V = sin(X); 
Xq = 0:.25:10; Vq = interp1(X,V,Xq); 
plot(X,V,'o',Xq,Vq,':.')
xlabel('x'); ylabel('y'); 


%%
% Designed by Prof P.M.Trivailo %(C)2019
% Series Resistance-inductance Electrical Circuit
clc; clear; close('all');
t=[0:0.01:1]*0.1;
k=-100*log(11/30);
I=30*exp(-k*t);

figure; 
plot(t,I,'b','LineWidth',2);
grid on; 
xlabel('t [s]'); 
ylabel('I(t) [A]');

set(gcf,'Position',[214   334   834   428]);
set(gca,'FontSize',16);


%% RESISTANCE-INDUCTANCE ELECTRICAL CIRCUIT EXAMPLE
% Designed by Prof P.M.Trivailo (C) 2019
% Feature: ALL COMMANDS ARE IN ONE FILE!!!
% Useful Ref: https://www.electronics-tutorials.ws/accircuits/ac-inductance.html
% Fundamental Law:  dI/dt = -kI;        % here k-positive
%---------------------------------------%
clear; close all; clc
I0 = 30;                                % initial current
k = -100*log(11/30);                    % here k-positive, because log(11/30)<0
tmax = 0.1;                             % s           
t = [0:0.01:1]*tmax;                    % regular time array
I_xdot_anonymous = @(t, I) -k*I; % anonymous FUNCTION IS USED
[t,I] = ode45(I_xdot_anonymous,t,I0); % calling ODE

plot(t,I);
grid on; 
xlabel('t [s]'); ylabel('I(t) [A]');
title('Electrical Current: Time History k=100.33, I_0=30A');

%% FALLING MASS (NO DRAG) EXAMPLE
% Designed by Prof P.M.Trivailo (C) 2019
%----------------------------------------
clear; close all; clc
        %             ^ z 
% Initial Conditions: |
v0=10;  % m/s         |
z0=5;   % m           |
tmax=3; % s           |
g=9.81; % m/s^2       +--------------> h
t=[0:0.01:1]*tmax;
zz=z0+v0*t-g*t.^2/2; % Note: pseudo-square 
                     %operation !!!
plot(t,zz,'LineWidth',3,'Color',[0 0.5 1]);
grid on; 
xlabel('t [s]'); 
ylabel('z [m]');
title('Falling Mass (No Air Drag): Time History: Exact Solution');
set(gca, 'FontSize',12);


%% FALLING MASS (NO DRAG) EXAMPLE
% Designed by Prof P.M.Trivailo (C) 2019
% Feature: ALL COMMANDS ARE IN ONE FILE!!!
%----------------------------------------
clear; close all; clc
        %             ^ z 
% Initial Conditions: |
v0=10;  % m/s         |
z0=5;   % m           |
tmax=3; % s           +--------------> h
t=[0:0.01:1]*tmax;
f_mass_xdot_anonymous = @(t, x) ([x(2); -9.81]);
[tt,zz]=ode45(f_mass_xdot_anonymous,t,[z0; v0]);
plot(tt,zz(:,1),'LineWidth',3,'Color',[0 0 1]);
grid on; xlabel('t [s]'); 
ylabel('z[m]');
title('Falling  Mass (No Air Drag): Time History');
set(gca, 'FontSize',12);


%% PROJECTILE (NO DRAG) EXAMPLE
% Designed by Prof P.M.Trivailo (C) 2019
th=45*pi/180; % red      ^ z 
v0=10;        % m/s      |
z0=0; h0=0;    % m        +--------------> h
tmax=2; t=[0:0.01:1]*tmax;
v0h=v0*cos(th); v0z=v0*sin(th); 
pr_xdot = @(t, x) ([x(2); -9.81; x(4); 0]);
[tt,zz]=ode45(pr_xdot,t,[z0; v0z; h0; v0h]);
plot(zz(:,3), zz(:,1),'LineWidth',3,'Color',[0 0.5 1]);
grid on; axis equal;
xlabel('h [m]'); 
ylabel('z [m]');
title('\bf Projectile (No Air Drag): Time History');
set(gca, 'FontSize',18); hold on;
g=line('XData',h0,'YData',z0,'Marker','.','MarkerSize',48); 
for i=1:length(tt),
   set(g,'XData',zz(i,3),'YData',zz(i,1)); drawnow; pause(0.01); 
end




%% PROJECTILE (WITH AIR RESISTANCE) EXAMPLE
% Designed by Prof P.M.Trivailo (C) 2019
% Feature: ALL COMMANDS ARE IN ONE FILE!!!
%----------------------------------------
clear; close all; clc
m=10; coeff=0.6; % F=coeff*Vsq;
th=45*pi/180;    % rad      ^ z
v0=10;           % m/s      |
z0=0; h0=0       % m        +--------------> h
g=9.81;
t=[0:0.01:1]*1.3;
v0h=v0*cos(th); v0z=v0*sin(th); 
 
figure; grid on; hold on; axis equal; 
pr_xdot = @(t, x) ([x(2); -9.81-coeff*x(2)*sqrt(x(2)^2+x(4)^2)/m;...
    x(4); -coeff*x(4)*sqrt(x(2)^2+x(4)^2)/m]);
[tt,zz]=ode45(pr_xdot,t,[z0; v0z; h0; v0h]);
plot(zz(:,3), zz(:,1),'LineWidth',3,'Color',[0 0.5 1]);
xlabel('$h$ [m]','Interpreter','LaTeX');
ylabel('$z$ [m]','Interpreter','LaTeX');
title('\bf Projectile (With Air Drag): Time History');
set(gca, 'FontSize',18);
set(gcf,'Position', [20 80 1270  680]);
 
g=line('XData',h0,'YData',z0,'Marker','.','MarkerSize',48);
for i=1:length(tt),
    set(g,'XData',zz(i,3),'YData',zz(i,1)); drawnow;   pause(0.01);
end


%%
clear; close all; clc
disp('%========= END OF THE TUTORIAL-1 ===========')
disp('% ========= THANK YOU FOR YOUR PARTICIPATION !!! ===========')
commandwindow
