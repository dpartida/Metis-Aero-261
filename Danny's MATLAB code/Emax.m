function [Em] = Emax(K,Cd0)
%calculates the value for the maximum lift to drag ratio during steady
%level flight
%   Relies on K and C_D0
Em = 1 / (2 * sqrt(K * Cd0));
end

