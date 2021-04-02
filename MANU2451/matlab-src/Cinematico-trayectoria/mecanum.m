% ************************************************************************
% ************************CONTROL DE TRAYECTORIA**************************
% ************************************************************************

%Condiciones de tiempo
clc; clear all; close all;
ts=15;            %[s] Tiempo de simulación
avance=0.05;     %[s] Intervalo de tiempo
t=[0:avance:ts]; %Vector tiempo

%Variables globales
global r L l

%Posicion inicial
xp(1)=0.8;        %[m]
yp(1)=-0.7;        %[m]
wo=180*pi/180;  %[rad]

%Posición deseada
xd=2*cos(t);    %[m]
yd=1.5*sin(2*t);  %[m]
wd=0*t;      %[rad]

%Velocidad deseada (Derivada de la posición)
vxd=-2*sin(t);  %[m/s]
vyd=3*cos(2*t); %[m/s]
vwd=0*t;     %[rad/s]

%Parámetros del robot
r=0.03;      % [m] radio de las ruedas
L=0.09;      % [m] distancia vertical desde el eje inercial al centro de las ruedas
l=0.095;     % [m] distancia horizontal desde el eje inercial al centro de las ruedas

n=length(t);    %Longitud del vector tiempo

%Condiciones iniciales del sistema
hx(1)=xp(1);
hy(1)=yp(1);
hw(1)=wo;

% ************************************************************************
% ****************************CONTROLADOR*********************************
% ************************************************************************

for i=1:n
% Error de control 
error_x(i)=xd(i)-hx(i); 
error_y(i)=yd(i)-hy(i);
error_w(i)=ErrorAng(wd(i)-hw(i));

%Ganancia
kx=8; ky=8; kw=5;

%Ley de control
Vx(i)=vxd(i)+kx*tanh(error_x(i));
Vy(i)=vyd(i)+ky*tanh(error_y(i));
Ww(i)=vwd(i)+kw*tanh(error_w(i));

XYZ_p = [Vx(i), Vy(i), Ww(i)]'; 

J = [[cos(hw(i)) -sin(hw(i))  0  ];...
     [sin(hw(i))  cos(hw(i))  0  ];...
     [0             0          1  ]];

solucion = inv(J)*(XYZ_p);

%Velocidades de referencia
vl(i) = solucion(1);         %en m/s
vm(i) = solucion(2);         %en m/s
w(i) = solucion(3);         %en rad/s

%Velocidades Lineales Actuales
xp(i) = vl(i)*cos(hw(i))-vm(i)*sin(hw(i));
yp(i) = vl(i)*sin(hw(i))+vm(i)*cos(hw(i));

%Posicion actual
hx(i+1)=hx(i)+xp(i)*avance;
hy(i+1)=hy(i)+yp(i)*avance;
hw(i+1)=hw(i)+w(i)*avance;
end

% ************************************************************************
% ******************************ANIMACIÓN*********************************
% ************************************************************************

%Formato para mostrar la animación en pantalla
%animacion
scrsz=get(0,'ScreenSize');
off1=0;
off2=100;
figpos=[off1 off2 scrsz(3)-off1 scrsz(4)-off2];

f1=figure(1);
set(f1,'Color','w','Position',figpos);

paso=2; axis 'equal'

Robot_Dimension(2);
Ho = Robot_Plot_3D(hx(i),hy(i),hw(i));hold on;
H1 = plot(hx(1),hy(1),'*m'); hold on;
H2 = plot(hx(1),hy(1),'*m'); hold on;
H4 = plot(xd(1),yd(1),'b');

fps=100;

for i=1:n
    clf
    axis 'equal'
    delete(Ho)
    delete(H1)
    delete(H2)
    delete(H4)
    axis([-3 5 -3 5 0 1]);  
    view([-30.0,30.0]);
    H1=Robot_Plot_3D(hx(i),hy(i),hw(i)); hold on
    H1 = plot(hx(i),hy(i),'*m');hold on
    H2 = plot(hx(1:i),hy(1:i),'g');hold on
    H3 = plot(xd,yd,'m');hold on
    H4 = plot(xd(i),yd(i),'*b');
    grid on;

pause(avance)
end

% ***********************************************************************
% ******************************GRÁFICAS*********************************
% ***********************************************************************
%Graficas de desplazamiento
figure
subplot(3,1,1)
    plot(t,hx(1:length(t))); grid;
    title('Desplazamiento en X');
    xlabel('Tiempo[s]'); ylabel('X[m]');
    
 subplot(3,1,2)
    plot(t,hy(1:length(t)),'g'); grid;
    title('Desplazamiento en Y');
    xlabel('Tiempo[s]'); ylabel('Y[m]');
    
subplot(3,1,3)
    plot(t,hw(1:length(t)),'m'); grid;
    title('Rotación');
    xlabel('Tiempo[s]'); ylabel('\psi')

%Gráficas de error
figure
plot(t,error_x,'k',t,error_y,'r',t,error_w,'b');
  legend('Error x','Error y','Error w');
  title('Errores de Control')
  xlabel('Tiempo [s]'); ylabel('Error [m,rad]')
%Gráficas de trayectoria
figure
plot(xd,yd,'--k',hx,hy,'--r');
  legend('Trayectoria deseada','Trayectoria realizada');
  title('Trayectorias')
  xlabel('x [m]'); ylabel('y [m]')
