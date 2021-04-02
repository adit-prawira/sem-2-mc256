syms x1(t) x2(t) x3(t)
r=0.03*[-1 0 1; 1 -1 0; 0 1 -1];
D=[3; 0; 0]; 
X = [x1; x2; x3];
odes = diff(X) == r*X + D;
% Solve the matrix equation using "dsolve".
[x1sol(t), x2sol(t), x3sol(t)] = dsolve(odes);
% Solve the system with zero initial conditions.
X0 = X(0) == [0; 0; 0];
[x1sol(t), x2sol(t), x3sol(t)] = dsolve(odes,X0);

h1=ezplot(x1sol,[0 48 0 90]); 
set(h1,'LineStyle','-','Color','r'); 
hold on
h2=ezplot(x2sol,[0 48 0 90]); 
set(h2,'LineStyle','--','Color','b'); 
h3=ezplot(x3sol,[0 48 0 90]); 
set(h3,'LineStyle',':','Color','k'); 
set([h1, h2, h3],'LineWidth',3);
grid on
legend('x_1','x_2','x_3','Location','NorthWest');
xlabel('$t$ [hrs]','Interpreter','LaTeX');
ylabel('$x_i$ (i=1,2,3) [kg]','Interpreter','LaTeX'); 
set(gca,'FontSize',16); 
set(gcf,'Position',[488 -90 1361 852]);