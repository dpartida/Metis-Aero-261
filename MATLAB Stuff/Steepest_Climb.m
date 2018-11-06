clear,clc

W=14500; %weight of aircraft as a constant
S=264; %wing area of aircraft
T1=7000; %thrust generated by engines at beginning of flight given in lbs
p_h=input('What is the air density at the current altitude?: '); %air density given in slug/ft^3
p_SL=0.0023769; %air density at sea level given in slug/ft^3
T=T1*(p_h/p_SL);
c_D0=0.014; %drag coefficient
K=0.056; 

%for calculating Steepest Climb Flight Angle
y=asind((T/W)-2*sqrt(K*c_D0));
fprintf('Steepest Climb Angle (degrees): %.4f\n',y)

%for calculating Steepest Climb Velocity
v=sqrt((2/p_h)*((W*cosd(y))/S)*sqrt(K/c_D0));
fprintf('Steepest Climb Velocity (ft/s): %.4f\n',v)

%for calculating Rate of Climb for steepest climb(RoC)
RoC=v*sind(y);
fprintf('Rate of Climb for steepest climb (ft/s): %.4f\n',RoC)

