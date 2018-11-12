function [RE] = RNC(p,v,S,b,u)
%Reynolds number calculator
%   This function calculates the value of the reynolds number based on
RE = (p*v*(S/b))/u;
end

