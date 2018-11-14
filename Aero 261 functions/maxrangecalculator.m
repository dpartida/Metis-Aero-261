function [d_BR] = maxrangecalculator(v_BR,TSFC,T,p_r,W_2,dW)
%This function calculates max range distance
%   relies on v_BR(velocity best range) and t(time to destination)
d_BR = ((v_BR/(TSFC*((T*p_r)/(W_2*1000))))*(log(1/1-dW)));
end