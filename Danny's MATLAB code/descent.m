function [B,vxmaxsl,yxmaxd,vxmaxd,xbr,tbr] = descent(Em,hc,hla,W2,S,K,Cd0,rho_sl,rho_c)
%descent calculates maximum possible distance and time flown for descent
%   Detailed explanation goes here

e=2.7183; %mathmatical constant

if hc <= 10972.8 && hc >= 0
    B=9296.4;
elseif hc > 10972.8 && hc <= 76200
    B=7254.24;
else
    disp('Error: Invalid Cruise Altitude')
end

vxmaxsl=sqrt(((2 * W2 / S) / rho_sl) * sqrt(K / Cd0)); %airspeed for best range at sea level

yxmaxd = (1 / Em) * 180 / pi; %slowest descent angle for best range (degrees)

vxmaxd = sqrt(((2 * W2 / S) / rho_c) * sqrt(K  / Cd0)); %airspeed for best range descent

xbr = Em * (hc - hla); %farthest horizontal distance traveled during descent

tbr = (2 * B * Em / vxmaxsl) * (e^(-hla / (2 * B))-e^(-hc / (2 * B))); %time spent during descent
end

