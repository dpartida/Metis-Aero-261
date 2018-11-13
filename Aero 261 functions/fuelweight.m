function [f_W] = fuelweight(TSFC,T,p_r,t)
%This calculates fuel burned in cruise
%   It relies on TSFC, T(Thrust), p_r(the air density ratios), and t(time).
 f_W = (TSFC*T*p_r*(t*3600))/1000; %fuel burned during cruise in kg
end

