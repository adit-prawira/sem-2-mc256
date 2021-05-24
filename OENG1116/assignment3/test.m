close all
clear all
clc

E = 17.2e9;  %young's modulus of material
w = 0.125; %width of the structure
h = 0.042; %height of the system
a = w*h;  %Cross sectional area (m^2)
L = 4; %lenght of system
ne = 2; %no. of elements
le = L/ne;  %Length of each element
I = (w*h^3)/12;   % Moment of inertia
rho = 1200; %density (kg/m^3)
M = 1000;  %applied moment

%element stiffness matrix
ke = (E*I/le^3)*[12 6*le -12 6*le;...
                    6*le 4*le^2 -6*le 2*le^2;...
                    -12 -6*le 12 -6*le;...
                    6*le 2*le^2 -6*le 4*le^2];
          
% Global Stiffness Matrix
K_G = zeros(2*(ne+1),2*(ne+1));
for i= 1:2:(ne+1)
   K_G(i:(i+3),i:(i+3)) = ke;
   k(:,:,i) = K_G;
   K_G = zeros(2*(ne+1),2*(ne+1));
end
K_Global = sum(k(:,:,:),3);

%implementation of external loading
f_v = zeros(2*(ne+1),1);
nd_load = [2 6];
f_v(nd_load) = M;

%Boundary Condition
nd_bc = [1 5];
K_Global(nd_bc,:) = []; K_Global(:,nd_bc) = [];
f_v(nd_bc) = [];

% Static analysis
disp = K_Global\f_v;
display('Angular displacement at A in Degree')
disp(1)*180/pi