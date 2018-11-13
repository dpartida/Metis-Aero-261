function [v_BE] = maxenduranceairspeed(W,S,p,K,C_D0)
%This function calculates airspeed for max endurance
%   relies on W(weight), S(wing area), p(air density), K, C_D0
v_BE = sqrt(((2*(W/S))/p)*sqrt(K/C_D0));
end

