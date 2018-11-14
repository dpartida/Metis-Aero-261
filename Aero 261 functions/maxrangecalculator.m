function [d_BR] = maxrangecalculator(v_BR,t)
%This function calculates max range distance
%   relies on v_BR(velocity best range) and t(time to destination)
d_BR = ((v_BR/(TSFC*(1/(((sqrt3)/2)*Em))))*ln(1/
end

