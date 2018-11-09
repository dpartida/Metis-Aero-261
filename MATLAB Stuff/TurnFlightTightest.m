clear,clc

%calculates components of flight for tightest turning on xy plane

T=9065*2; %thrust provided by engines at sea level
W=35000; %weight of aircraft
K=0.5;
CD0=0.015; %coefficient of drag
S=506; %wing area
p=input('Air Density: '); %air density of desired altitude
Emax=1/(2*sqrt(CD0*K)); 
p_SL=.0023769; %air density at sea level
T_max=p*T/p_SL; %calculates maximum thrust at user-defined altitude

nmax=Emax*(T_max/W); %maximum loading factor considering only aerodynamics
fprintf('Maximum Load Factor (n_max): %.4f\n',nmax)

n_TT=sqrt(2-(1/nmax^2)); %load factor for tightest turn
fprintf('Load Factor for tightest turn: %.4f\n',n_TT)

TW_TT=(n_TT^2+1)/(2*Emax); %thrust to weight ratio for tightest turn
fprintf('thrust to weight ratio for tightest turn: %.4f\n',TW_TT)

v_TT=2*sqrt((K*(W/S))/(p*(TW_TT))); %velocity to achieve tightest turn (ft/s)
V_TT=v_TT/5280*3600/1.15; %velocity to achieve tightest turn (kt)
fprintf('Velocity to achieve tightest turn: %.4f (ft/s), %.4f (kt)\n',v_TT,V_TT)

X_TT=32.2*sqrt(n_TT^2-1)/v_TT; %yaw angle rate of change for tightest turn
fprintf('Yaw angle rate of change for tightest turn: %.4f (rad/s)\n',X_TT)

r_TT=(v_TT^2)/(32.2*sqrt((n_TT^2)-1)); %turn radius for tightest turn
fprintf('Minimum turn radius for tightest turn: %.4f (ft)\n',r_TT)

phi_TT=acosd(1/n_TT); %bank angle that corresponds with tightest turn
fprintf('Bank angle that corresponds with tightest turn: %.4f (degrees)\n',phi_TT)
