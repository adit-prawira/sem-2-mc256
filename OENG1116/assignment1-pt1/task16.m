clear
clc
close all

C = 945;
N = 200000;
sum = 0;
for i = 1:N
    sum = sum + (1/i^6);
end

fprintf("Sum = %f\n", C*sum);