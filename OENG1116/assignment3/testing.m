clear
clc
close all
xi=0:0.01:1; h=1;
H1=1 - 3*xi.^2 + 2*xi.^3; H2= h*(xi - 2*xi.^2 + xi.^3);
H3=3*xi.^2 - 2*xi.^3; H4= h*(-xi.^2 + xi.^3);
u1=0.1; u3=0.3; u2=20; u4=-20;
str=sprintf(['Beam''s FE Boundary Conditions: ', ...
'$u_1$=%g; $u_2$=%g$^\\circ$; $u_3$=%g; $u_4$=%g$^\\circ$'],u1,u2,u3,u4);
u2=u2*(pi/180); u4=u4*(pi/180); % Convert deg -> rad
u=u1*H1 + u2*H2 + u3*H3 + u4*H4;
figure; plot(xi,u,'LineWidth',2); grid on; axis tight equal;
xl=xlabel('$x$'); yl=ylabel('$u$'); ti=title(str);
set([xl yl ti],'Interpreter','LaTeX');

set(gca,'FontSize',16); set(gcf,'Position',[120 191 949 309]);