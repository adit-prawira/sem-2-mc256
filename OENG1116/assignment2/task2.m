%% s3859061
clear
close all 
clc
set(0,'DefaultFigureWindowStyle','docked') 

A=[0,7;-1,4;4,2;-3,4;2,-1;-1,-2;2,-4;7,-3;4,6;7,3;8,0];
[k1,av1] = convhull(A);

B=[11,9;15,12;12,6;16,8;7,14;12,15;9,12;8,9;8,9];
[k2,av2] = convhull(B);

scatter(A(:,1), A(:,2), 'MarkerEdgeColor',[0 0 1]')

% Rendering setup for scaterrin the given sets of data
hold on
plot(A(k1,1),A(k1,2),'b')
scatter(B(:,1), B(:,2), 'MarkerEdgeColor',[1 0 0]')
plot(B(k2,1),B(k2,2),'r')

xl = xlabel('$x$');
yl = ylabel('$y$');
set([xl,yl],'Interpreter','LaTeX');
grid on
hold off


%% Choosing support vector through
s1 = [4;6;1]; % NEGATIVE CLASS
s2 = [7;3;1]; % NEGATIVE CLASS
s3 = [8;9;1]; % POSITIVE CLASS

classes = [-1;-1;1];

N = numel(classes);
SUPPORT_VECTORS = [s1 s2 s3];
COEFFICIENTS = zeros(N,N);

% Rendering setup for chosen support vectors
hold on
line(SUPPORT_VECTORS(1,1:N-1),SUPPORT_VECTORS(2,1:N-1),'LineStyle','none','LineWidth',2,...
        'Marker','o','MarkerSize',22,...
        'MarkerFaceColor','y','MarkerEdgeColor','b')
line(SUPPORT_VECTORS(1,N),SUPPORT_VECTORS(2,N),'LineStyle','none','LineWidth',2,...
    'Marker','o','MarkerSize',22,...
    'MarkerFaceColor','y','MarkerEdgeColor','r')
hold off

for i = 1:N
    for j = 1:N
        COEFFICIENTS(i,j) = dot(SUPPORT_VECTORS(:,j),...
            SUPPORT_VECTORS(:,i));
    end
end

ALPHAS = COEFFICIENTS\classes;
wTilde = zeros(N,1);

for n = 1:N
    wTilde = wTilde + ALPHAS(n)*SUPPORT_VECTORS(:,n);
end

w = wTilde(1:N-1);
b = wTilde(N);


%% Margin Calculation
WN = numel(w);
sumWSquare = 0;
for k = 1:WN
    sumWSquare = sumWSquare + w(k)^2;
end
d = 1/sqrt(sumWSquare);
m = 2*d;

%% Hyperplane line generation
plotAxises = axis;
x = plotAxises(1):1:plotAxises(2);

a = -1*(w(1)/w(2));

c = -1*(b/w(2));
cHigh = (1-b)/w(2);
cLow = (-1-b)/w(2);

y = a*x + c; % Hyperplane equation
yHigh = a*x + cHigh; % Higher margin equation
yLow = a*x + cLow; % Lower margin equation

% Rendering setup for Hyperplane, higher, and lower margin equations
hold on 
plot(x, y, 'k', 'LineWidth', 3);
plot(x, yHigh, 'r', 'LineStyle', '--', 'LineWidth', 3);
plot(x, yLow, 'b', 'LineStyle', '--', 'LineWidth', 3);
titleStr=sprintf(...
    "SVM Calsulated Eq. of the Hyperplane: $y = (%g) x + (%g)$, Or (%g)x+(%g)y+(%g) = 0",a,c,...
    w(1), w(2), b);
set([xl,yl,title(titleStr)],'Interpreter','LaTeX');
hold off

fprintf("w=[%.4f;%.4f;%.4f]\n", wTilde(1), wTilde(2), wTilde(3))
fprintf("m=%.4f\n", m)