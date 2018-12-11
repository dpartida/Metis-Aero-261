function [K] = kvalue(e0,AR)
%Function "kvalue" estimates the K value in the drag polar equation

K = 1 / (pi * e0 * AR);
end

