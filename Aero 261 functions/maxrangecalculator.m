function [d_BR] = maxrangecalculator(v_BR,t)
%This function calculates max range distance
%   relies on v_BR(velocity best range) and t(time to destination)
d_BR = v_BR*(3600/1000)*t; %converts v_BR into km/h and calculates distance in km
end

