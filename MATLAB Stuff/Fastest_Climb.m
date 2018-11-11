clear,clc

W=14500; %Weight of aircraft (lb) as a constant
S=264; %wing area of aircraft (ft^2)
c_D0=0.014; %drag constant
K=0.0542;
T1=7000; %thrust given by the engines of the aircraft (lb)
p_h=input('What is the air density of the current altitude (slug/ft^3)?: ');
p_SL=0.0023769; %air density at sea level (slug/ft^3)
T=T1*(p_h/p_SL);
Y=1+sqrt(1+((12*K*c_D0)/(T/W)^2));
TSFC=0.5; %thrust specific fuel consumption (lb/lb/hr)

%to calculate Fastest Climb Flight Angle (degrees)
y=asind((T/W)*(1-(Y/6))-((6*K*c_D0)/(Y*(T/W))));
fprintf('Fastest Climb Angle: %.4f degrees\n',y)

%to calculate Fastest Climb Velocity (ft/s)
v=sqrt(((T/W)*(W/S)*Y)/(3*p_h*c_D0));
vk=v*3600/5280/1.15; %converts ft/s to knot
fprintf('Fastest Climb Velocity: %.4f (ft/s) = %.4f (knot)\n',v,vk)

%to calculate Rate of Climb (RoC)
RoC=v*sind(y);
RoCm=RoC*60; %converts ft/s to ft/min
fprintf('Rate of Climb: %.4f (ft/s) = %.4f (ft/min)\n',RoC,RoCm)

%Calculate time elapsed to get from initial altitude 
t_s=10000/RoC; %time in seconds
t_m=t_s/60; %time in minutes
t_h=t_s/3600; %time in hours
fprintf('Time elapsed: %.4f (sec) = %.4f (min) = %.4f (h)\n',t_s,t_m,t_h)

%calculate amount of fuel burned (lb)
FB=TSFC*T*t_h;
fprintf('Amount of fuel burned: %.4f (lb)\n',FB)



