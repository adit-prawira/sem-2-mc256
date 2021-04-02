clear
clc
close all

t = 0.1 * [0:0.01:1];
k = log(30/11)/0.01;
I = 30*exp(-k*t);

figure;
plot(t, I, 'r', 'LineWidth', 2);
ylabel("I(A)");
xlabel("t(seconds)");
grid on;
