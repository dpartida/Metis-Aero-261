function [v_stall] = stallspeed(W,S,p)
%UNTITLED12 Summary of this function goes here
%   Relies on W(weight), S(wing area), and p(air density)
v_stall = sqrt((2*(W/S))/(p*1)); %1 is used because maximum coefficient of life
end

