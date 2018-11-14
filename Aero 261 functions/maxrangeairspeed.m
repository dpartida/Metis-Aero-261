function [v_BR] = maxrangeairspeed(W,S,p,K,C_D0)
%This function calculates the velocity for best range 
%   It does this by using the equation provided in class and relies on the
%   varibles W(weight), S(wing area), p(air density), K, t, and C_D0
%       Calculated in m/s
v_BR = sqrt(((2*(W/S))/p)*sqrt((3*K)/(C_D0))); %calculated in m/s
end

