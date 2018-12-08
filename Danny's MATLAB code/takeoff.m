function [Tto,CLmax,vstall_to,vto,xto,tto] = takeoff(Tsl,W,S,rho_to,sweep,g,rho_sl)
%function "takeoff" estimates the takeoff performance of an aircraft
% based on:
%    -takeoff weight (W)
%    -wing planform area (S)
%    -air density for the altitude of takeoff
%    -wing sweep angle (sweep)

Tto=rho_to*Tsl/rho_sl; %thrust provided at takeoff altitude

CLmax = 1.6*cosd(sweep); %value of CLmax used in equation for vstall

vstall_to = sqrt((2*W/S)/(rho_to*CLmax)); %stall velocity of takeoff

vto = 1.2*vstall_to; %estimated velocity for successful takeoff

xto = (vto^2)/(2*g*(Tto/W)); %distance traveled accelerating to "vto"

tto = xto/vto; %time spent accelerating to "vto"

end

