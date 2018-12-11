function [Re] = reynolds(rho,v,c,u)
%function "Reynolds" estimates reynolds number at prescribed altitude and
%airspeed
%   This function calculates the value of the reynolds number based on air
%   density, velocity, wing area, wing length, and air viscosity
Re = (rho * v * c) / u;
end

