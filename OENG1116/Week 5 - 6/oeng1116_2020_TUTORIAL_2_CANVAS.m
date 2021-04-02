%%
% --- Tutorial-2 Greeting
clear; close all; clc
fprintf('>> ========= WELCOME TO THE OENG1116 TUTORIAL-2 Wk-5 ===========')
commandwindow

%%
% --- A1, Q1: Testing Choice-1 answer
clear; clc;
fprintf(' ===== A1-Pt1 MOCK-UP Q1: Entering Example ===== \n')
A = ones(3,4) + eye(3,4)
fprintf(' ===== Q1: Testing First Choice Answer: Is this equal to 1? ===== \n')
A(:,3)

%%
clear; clc; close all
% --- A1, Q1: Choice-1: Associated exercises
fprintf('OENG1116-A1-Pt1 MOCK-UP: Q1, associated exercises \n')
A = ones(3,4) + eye(3,4)
size(A)
A(:,1)
[A(2,:), A(3,:)]
A([1 3],[2 3])

%%
% --- A1, Q1: Testing Choice-2 answer
clear; clc;
fprintf(' ===== A1-Pt1 MOCK-UP Q1: Entering Example ===== \n')
A = ones(3,4) + eye(3,4)
fprintf(' ===== Q1: Testing Second Choice Answer: Is A(6) equal to 1? ===== \n')
A(6)

%%
clear; clc; close all
% --- A1, Q1: Choice-2: Associated exercises
fprintf('OENG1116-A1-Pt1 MOCK-UP: Q1, associated exercises \n')
A = ones(3,4) + eye(3,4)

[A(1) A(2) A(3) A(4) A(5) A(6) A(7) A(8) A(9) A(10) A(11) A(12)]

A(:)

%%
clear; clc; close all
% --- A1, Q1: Choice-3: Testing option answer
fprintf(' ===== Q1: Testing Third Choice Answer: Error Message? ===== \n')
A = ones(3,4) + eye(3,4)
A + 1116*i

%%
clear; clc; close all
% --- A1, Q1: Choice-4: Testing option answer
fprintf(' ===== Q1: Testing Fourth Choice Answer: A=A'' ? ===== \n')
A = ones(3,4) + eye(3,4)
A'
transpose(A)
size(A)
size(transpose(A))

%%
clear; clc; close all
% --- A1, Q1: Choice-5: Testing option answer
fprintf(' ===== Q1: Testing Fifth Choice Answer: size(A,2)=2 ? ===== \n')
A = ones(3,4) + eye(3,4)
size(A,2)
size(A)

%%
% --- A1, Q2: Testing Choice-1 answer1
clear; clc;
fprintf(' ===== A1-Pt1 MOCK-UP Q2: Entering Example ===== \n\n')

t=[0:0.01:5]; y = exp(-0.3*t).*sin(4*t);

%% MOCK-UP Q2: Programmed by Prof P.M.Trivailo © 2020
% Graphically Illustrated Solution
clc; clear; close all
t=[0:0.01:5]; y=exp(-0.3*t).*sin(4*t);
plot(t,y,'LineWidth',2); grid on; 
set(gcf,'Position',[90 438 1407 420]);
ti=title('$y(t) = e^{-0.3 \, t}\, \sin(4t)$');
xl=xlabel('$t$'); yl=ylabel('$y$');
set([ti,xl,yl],'Interpreter','LaTeX');
 Threshold=0.50;
hold on; axis tight; ax=axis;
line('XData',ax(1:2),'YData',[1 1]*Threshold,'Color','r');
idx=find(y > Threshold); NN=length(idx);
fprintf('length(find(y > %6.2f)) = %i \n',Threshold,NN)
plot(t(idx),y(idx),'kx');
% --- ANSWER ---
%length(find(y >   0.50)) = 71
% --- ANSWER ---
commandwindow


%% MOCK-UP Q3: Programmed by Prof P.M.Trivailo © 2020
% OPTION-1: SHORTEST VERSION
% 
clc; close all; clear
disp('>> %============= Q3: OPTION-1 =============')

t=[0:0.01:1]; y=cos(2*pi*t); plot(t,y,'r'); 
grid on; hold on; xlabel('t'); ylabel('y');
t2=[0:0.25:1]; y2=interp(t,y,t2); plot(t2,y2,'k-o','LineWidth',2);

%%
clear; close all; clc;
DX=560; DY=370; X0=200; Y0=500;

clc
disp('>> %============= Q3: OPTION-2 =============')
figure;
t=[0:0.01:1]; y=cos(2*pi*t); plot(t,y,'r'); grid on; hold on; xlabel('t'); ylabel('y');
title('Mock-Up, Q3, Option-2: WRONG ANSWER')
hold on;
t2=[0:0.25:1]; y2=interp1(t,y,t2); plot(t2,y2,'k-o','LineWidth',2); %WRONG
set(gcf,'Position',[X0, Y0, DX, DY]);


%%
%---------
%clc
disp('>> %============= Q3: OPTION-3 =============')

figure;
t=[0:0.01:1]; y=cos(2*pi*t); plot(t,y,'r'); grid on; hold on; xlabel('t'); ylabel('y');
title('Mock-Up, Q3, Option-3: WRONG ANSWER')
hold on;
t2=[0:0.05:1]; y2=interp1(t,y,t2); plot(t2,y2,'b-o','LineWidth',2); %WRONG

set(gcf,'Position',[X0+DX+2, Y0, DX, DY]);

%%
disp('>> %============= Q3: OPTION-4 =============')

figure;
t=[0:0.01:1]; y=cos(2*pi*t); plot(t,y,'r'); grid on; hold on; xlabel('t'); ylabel('y');
title('Mock-Up, Q3, Option-4: CORRECT ANSWER')
hold on;
t2=[0:0.1:1]; y2=interp1(t,y,t2); plot(t2,y2,'k-o','LineWidth',2); % CORRECT
set(gcf,'Position',[X0, Y0-DY-84, DX, DY]);

%---------
disp('>> %============= Q3: OPTION-5 =============')

figure;
t=[0:0.01:1]; y=cos(2*pi*t); plot(t,y,'r'); grid on; hold on; xlabel('t'); ylabel('y');
title('Mock-Up, Q3, Option-5: WRONG ANSWER')
hold on;
t2=[0:0.5:1]; y2=interp1(t,y,t2); plot(t2,y2,'k-o','LineWidth',2); % WRONG
set(gcf,'Position',[X0+DX+2, Y0-DY-84, DX, DY]);

%% MOCK-UP Q4: Programmed by Prof P.M.Trivailo © 2020

clc; close all; clear
disp('>> fprintf(''max temp is %.2f degree \n'',100.2345) ')
fprintf('max temp is %.2f degree \n',100.2345)

%

%% MOCK-UP Q5: Programmed by Prof P.M.Trivailo © 2020

clc;
disp('>> %============= Q5: OPTION-1: SYNTAX ERROR!  =============')
t=0,10; g=-9.81; y(t)=0.5*g*t^2; disp([t,y']);

%%
clc;
disp('>> ')
disp('>> %============= Q5: OPTION-2 =============')
t=0:10; g=-9.81; y=0.5*g*t.^2; disp([y',t']);

%%
clc;
disp('>> %============= Q5: OPTION-3: SYNTAX ERROR! =============')
t=[0,10]; g=-9.81; y(t)=-0.5*g*t^2; disp([t,y]');

%%
clc;
disp('>> ')
disp('>> %============= Q5: OPTION-4 =============')
t=0:10; g=-9.81; y(t)=-0.5*g*t^2; disp([t',y']);

%%
clc
disp('>> ')
disp('>> %============= Q5: OPTION-5: CORRECT ANSWER =============')
t=0:10; g=-9.81; y=0.5*g*t.^2; disp([t',y']);

%%
clc;
disp('>> ')
disp('>> %============= Q5: OPTION-6 =============')
t=0:10; g=-9.81; y=0.5*g*t.^2; disp([t;y]);

%% MOCK-UP Q6: Programmed by Prof P.M.Trivailo © 2020
clc; close all; clear
disp('>> %============= Q6: ENTERING SPECIFIED COMMANDS =============')
f1=figure; t=[0:.001:1]*2*pi; plot(abs(cos(t)),abs(sin(t))); axis equal; grid on; figure(f1);

disp('>> %============= Q6: OPTION-1 =============')
disp('>> % A straight line')
disp('>> ')
disp('>> %============= Q6: OPTION-2 =============')
disp('>> % A plot of the "sin" function (sinusoid). ')
disp('>> ')
disp('>> %============= Q6: OPTION-3: CORRECT ANSWER! =============')
disp('>> % A quater of a unit circle ')
disp('>> ')
disp('>> %============= Q6: OPTION-4 =============')
disp('>> % A unit circle (complete) ')
disp('>> ')
disp('>> %============= Q6: OPTION-5 =============')
disp('>> % A half of the unit circle ')
disp('>> ')
disp('>> %============= Q6: OPTION-6 =============')
disp('>> % None of the above. ')

%% MOCK-UP Q7: Programmed by Prof P.M.Trivailo © 2020
clear; close all; clc
disp('>> %============= Q7: ENTERING SPECIFIED COMMANDS =============')

DX=460; DY=370; X0=20; Y0=500;
%---
f1=figure; x=[-1:0.01:1]; y=-abs(1-x.^2-1.3*x.^3-0.2*x.^4); plot(x,y,'r','LineWidth',3); grid on; axis equal; figure(f1);
title('Mock-Up, Q7, Option-1: WRONG ANSWER')
set(f1,'Position',[X0, Y0, DX, DY]);
%---
%
f1=figure; xx=[-1:0.01:1]; x=[xx, xx(end:-1:1)]; y = [abs(1-abs(xx)) -abs(1-abs(xx))]; plot(x,y,'r','LineWidth',3); grid on; axis equal; figure(f1);
title('Mock-Up, Q7, Option-2: CORRECT ANSWER')
set(gcf,'Position',[X0+DX+2, Y0, DX, DY]);
%---
f1=figure; t=[0:0.001:1]*10*pi; v=0.1; w=1; x=v*t.*(cos(w*t)); y=v*t.*(sin(w*t)); plot(x, y,'r','LineWidth',3); grid on; axis equal; figure(f1);
title('Mock-Up, Q7, Option-3: WRONG ANSWER')
set(gcf,'Position',[X0+2*DX+2*2, Y0, DX, DY]);
%---
f1=figure; t=[0:0.001:1]*2.1*pi; x=0.5*sign(cos(t)); y=0.5*sign(sin(t)); plot(x, y,'r','LineWidth',3); grid on; axis equal; figure(f1);
title('Mock-Up, Q7, Option-4: CORRECT ANSWER')
set(gcf,'Position',[X0, Y0-DY-84, DX, DY]);

% ---
f1=figure; fimplicit(@(x,y) abs(x + y) + abs(x - y) -2 , [-1.1 1.1 -1.1 1.1],'r','LineWidth',3); axis equal; grid on; title('$|x+y| + |x-y| = 2$','Interpreter','LaTeX'); figure(f1);
title('Mock-Up, Q7, Option-5: CORRECT ANSWER')
set(gcf,'Position',[X0+DX+2, Y0-DY-84, DX, DY]);
% ---
f1=figure; 
title('Mock-Up, Q7, Option-6: WRONG ANSWER')
set(gcf,'Position',[X0+2*DX+2*2, Y0-DY-84, DX, DY]);
text('String','Option-6 Answer: NONE OF THE ABOVE','Position',[1 1]*0.5,...
     'HorizontalAlignment','center');
axis tight

%% MOCK-UP Q8: Programmed by Prof P.M.Trivailo © 2020
clear; close all; clc
disp('>> %============= Q8: SOLUTION FOR CAR-#1 ONLY =============')
%-------
dd=[190 90]; tt=[0 1]; figure; hold on; grid on;
ti=interp1(dd,tt, 0,'linear','extrap');
plot([0 1 ti], [dd, 0],'LineWidth',2,'Marker','x','MarkerSize',12,'LineStyle','-');
legend('Car #1'); xlabel('t [relative units]'); ylabel('d [kms]');
disp(sprintf('ARRIVAL TIME for CAR-#1: %6.2f [abstract relative units]',ti))


%% MOCK-UP Q9: Programmed by Prof P.M.Trivailo © 2020
clear; close all; clc;
c=2020;
h = waitbar(0,'Please wait...');
for a=1:c
    waitbar(a/c, h)
    for b=a:c
        if a^2+b^2+1116^2-c^2==0,
            fprintf('a=%i; b=%i; c=%i \n',a,b,c)
        end
    end
end
delete(h);
fprintf('========PROGRAM FINISHED!!!==========\n')

%% MOCK-UP Q10: Programmed by Prof P.M.Trivailo © 2020
clc; 
disp('Solution for MOCK-UP Q10')

12^2/(9.81*cosd(30))

%%
clear; close all; clc;
disp('>> ========= THANK YOU FOR ATTENDING THE OENG1116 TUTORIAL-2 Wk-5 ! ===========')
