clear 
clc 
close all


sum = 0;
N = 1000000;
for n = 3:N
    sum = sum + (10000/(((n+1)*sqrt(n)) + (n*sqrt(n+1))));
end

fprintf("Sum = %f\n", sum);