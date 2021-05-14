

TASK 4:

```matlab
M1(1,:)=[]; 
K1(1,:)=[];
M1(:,1)=[]; 
K1(:,1)=[];

for i = 1 : newN1
    w_exact1 = (i-1)*w1_exact1;
    w_FEM1 = sqrt(abs(diag(D1(i,i))));
    fprintf("w_%d = %7.2f rad/s, ", i, w_FEM1);
    fprintf("w_exact_%d = %7.2f rad/s \n", i, w_exact1);
    % plot ith exact frequency
    plot(i, w_exact1, 'ob', 'MarkerSize', 8);
    %plot ith FEM frequency
    plot(i, w_FEM1, 'xr', 'MarkerSize', 8); 
end


[U1, D1] = eig(K1, M1);

w1_exact1 = pi*sqrt(E1/(rho1 * L1^2));
newN1 = length(M1);



for i = 1 : N2 + 1
    w_exact2 = (i-1)*w1_exact2;
    w_FEM2 = sqrt(abs(diag(D2(i,i))));
    fprintf("w_%d = %7.2f rad/s, ", i, w_FEM2);
    fprintf("w_exact_%d = %7.2f rad/s \n", i, w_exact2);
    % plot ith exact frequency
    plot(i, w_exact2, 'ob', 'MarkerSize', 8);
    %plot ith FEM frequency
    plot(i, w_FEM2, 'xr', 'MarkerSize', 8); 
end

[U2, D2] = eig(K2, M2);

w1_exact2 = pi*sqrt(E2/(rho2 * L2^2));
```



Task 4 v2

```matlab
for i = 1 : N1
    idx = [1 2] + (i - 1);
    M(idx, idx) = M(idx, idx) + me1;
    K(idx, idx) = K(idx, idx) + ke1;
end

for i = N1+1 : N1+N2
    idx = [1 2] + (i - 1);
    M(idx, idx) = M(idx, idx) + me2;
    K(idx, idx) = K(idx, idx) + ke2;
end

E = E1 + E2;
rho = rho1 + rho2;
L = L1 + L2;
M(1,:)=[]; 
K(1,:)=[];
M(:,1)=[]; 
K(:,1)=[];

[U, D] = eig(K, M);

w1_exact = pi*sqrt(E/(rho * L^2));
newN1 = length(M1);

for i = 1 : newN
    w_exact = (i-1)*w1_exact1;
    w_FEM1 = sqrt(abs(diag(D1(i,i))));
    fprintf("w_%d = %7.2f rad/s, ", i, w_FEM1);
    fprintf("w_exact_%d = %7.2f rad/s \n", i, w_exact1);
    % plot ith exact frequency
    plot(i, w_exact1, 'ob', 'MarkerSize', 8);
    %plot ith FEM frequency
    plot(i, w_FEM1, 'xr', 'MarkerSize', 8); 
end

% MOTION 
v0 = 15;
```



task 4 v3

```matlab
w1_exact1 = pi*sqrt(E1/(rho1 * L1^2));
w1_exact2 = pi*sqrt(E2/(rho2 * L2^2));

w1_exact = w1_exact1 + w1_exact2;

newN = length(M);

for i = 1 : newN
    w_exact = (i-1)*w1_exact;
    w_FEM = sqrt(abs(diag(D(i,i))));
    fprintf("w_%d = %7.2f rad/s, ", i, w_FEM);
    fprintf("w_exact_%d = %7.2f rad/s \n", i, w_exact);
    % plot ith exact frequency
    plot(i, w_exact, 'ob', 'MarkerSize', 8);
    %plot ith FEM frequency
    plot(i, w_FEM, 'xr', 'MarkerSize', 8); 
end

% MOTION 
v0 = 15;
```

