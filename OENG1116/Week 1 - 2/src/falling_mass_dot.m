function [xdot] = falling_mass_dot(t, x)
xdot(1,1) = x(2);
xdot(2,1) = -9.81;
