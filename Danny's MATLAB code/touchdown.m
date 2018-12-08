function [vtd,Jt,Ja,Sfr,Sg,Sd,a,t] = touchdown(tfr,vstall,g,ur,rho_sl,Cd0,W2,S,Tsl)
%touchdown calculates speed and distances for touchdown-deceleration-halt
%   Detailed explanation goes here
vtd=1.1*vstall; %velocity for touchdown
Sfr=vtd*tfr; %distance for free roll on runway (no deceleration yet)
Ja=(rho_sl*Cd0)/(2*W2/S);
Jt=(Tsl/W2)+ur;
Sg=Sfr+(1/(2*g*Ja))*log(1+(Ja/Jt)*(vtd^2)); %distance for total ground  roll
Sd=Sg-Sfr; %distance for deceleration
a=(vtd^2)/Sd; %deceleration 
t=2*Sd/vtd; %time spent decelerating
end

