function [ tfr,ur,vtd,Jt,Ja,Sfr,Sg,Sd,a,t ] = landing( vstall,g,rho_sl,Cd0,W2,S,Tsl )
%function "landing" estimates performance during the landing procedure

tfr = 0.5; %pilot's reaction time between when wheels hit ground and decelleration
ur = 0.4; %coefficient of friction between wheels and runway

vtd = 1.1 * vstall; %velocity for touchdown
Sfr = vtd * tfr; %distance for free roll on runway (no deceleration yet)
Ja = (rho_sl * Cd0) / (2 * W2 / S); %variable for grouping
Jt = (Tsl / W2) + ur; %variable for grouping
Sg = Sfr + ( 1 / (2 * g * Ja)) * log(1 + (Ja / Jt) * (vtd^2)); %distance for total ground  roll
Sd = Sg - Sfr; %distance for deceleration
a = (vtd^2) / Sd; %deceleration 
t = 2 * Sd / vtd; %time spent decelerating
end

