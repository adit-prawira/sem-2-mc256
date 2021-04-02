v0 = 10;
z0 = 5;
tmax = 3;
t = [0:0.01:1]*tmax;

[dt, dz] = ode45('falling_mass_dot', t, [z0; v0]);
plot(dt, dz(:,1),'LineWidth',2, 'Color', [0 0 1]);
grid on;
xlabel('t[s]');
ylabel('z[m]');