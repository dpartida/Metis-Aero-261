function [Re] = reynolds(rho,v,c,u)
%Reynolds number calculator
%   This function calculates the value of the reynolds number based on air
%   density, velocity, wing area, wing length, and air viscosity
Re = (rho*v*c)/u;
end

