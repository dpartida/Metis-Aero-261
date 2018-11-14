function [Em] = liftdragmax(K,C_D0)
%this function calculates the value for the maximum lift to drag ratio
%   Relies on K and C_D0
Em = (1/(2*sqrt(K*C_D0)))
end

