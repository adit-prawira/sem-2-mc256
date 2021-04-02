radius = 1500;
theta = 23;
g = 1.6;

v = sqrt(radius*g*cosd(theta));
fprintf("Velocity = %d m/s\n", floor(v));