clear,clc
%calculates components of turning flight for aircraft in xy plane (level
%flight)

T=3500*2; %thrust provided by engines at sea level
W=14500; %weight of aircraft
K=0.056;
CD0=0.014; %coefficient of drag
S=264; %wing area
p=input('Air Density: '); %air density
Emax=1/(2*sqrt(CD0*K));
p_SL=.0023769;
T_max=p*T/p_SL; %calculates maximum thrust at user-defined altitude

nmax=Emax*(T_max/W); %maximum loading factor considering only aerodynamics
fprintf('Maximum Load Factor (n_max): %.4f\n',nmax)

n_FT=sqrt(2*nmax-1); %load factor for fastest turn
fprintf('Load Factor (n_FT) for Fastest Turn: %.4f\n',n_FT)

v_FT=sqrt((2*(W/S)/p)*sqrt(K/CD0)); %velocity to achieve fastest turn in ft/s
V_FT=v_FT/5280*3600/1.15; %velocity to achieve fastest turn in knots
fprintf('Velocity for fastest turn: %.4f (ft/s), %.4f (kt)\n',v_FT,V_FT)

Xmax=(32.2/v_FT)*sqrt((n_FT^2)-1); %maxumim yaw angle rate of change corresponding to fastest turn and load factor for fastest turn
fprintf('Maximum yaw angle rate of change: %.4f (rad/s)\n',Xmax)

r_FT=(v_FT^2)/(32.2*sqrt((n_FT^2)-1)); %turn radius corresponding to fastest turn velocity and load factor for fastest turn
fprintf('Turn radius for fastest turn: %.4f (ft)\n',r_FT)

phi_FT=acosd(1/n_FT); %bank angle for fastest turn
fprintf('Bank Angle for Fastest Turn: %.4f degrees\n',phi_FT)

TW_FT=((n_FT^2)+1)/(2*Emax); %thrust to weight ratio for fastest turn
fprintf('Thrust to Weight ratio for fastest turn: %.4f\n',TW_FT)
