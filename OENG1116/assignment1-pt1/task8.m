

%clear; clc; b= [6, 9, 14]; h = [4, 7, 5]; A=cross(b,h); disp(sprintf('A1=%g; A2=%g; A3=%g;',A));

%clc; b= [6, 9, 14]; h = [4, 7, 5]; A=b*h; disp(A);

clc; b= [6, 9, 14]; h = [4, 7, 5]; A=[b(1)*h(1), b(2)*h(2), b(3)*h(3)]; disp(A);

%clc; b= [6, 9, 14]; h = [4, 7, 5]; A=[b*h(1) b*h(2) b*h(3)]; disp(A);

clc; b= [6, 9, 14]; h = [4, 7, 5]; A=b.*h; disp(sprintf('A1=%g; A2=%g; A3=%g;',A));