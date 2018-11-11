clear,clc
%calculates velocity to achieve maximum endurance (minimize power)

W=2450; %weight of aircraft
S=174; %wing area %aspect ratio
p=.0023; %air density
K=0.0542; 
C_D0=0.03;

v_BR=sqrt(((2*(W/S))/p)*sqrt(K/(3*C_D0)));

fprintf('Velocity to achieve best endurance: %.4f m/s\n',v_BR)

W1=2450; %weight at beginning of flight
W2=2000; %weight at end of flight
BSFC=0.4274; %brake specific fuel consumption (c^)

%For maximum endurance t(time in flight)), flying at minimum power
E_max=(sqrt(3)/2)*(1/(2*sqrt(C_D0*K)));
t_max=(E_max/BSFC)*(sqrt(2*p*S*sqrt(3*C_D0/K)))*((1/sqrt(W2))-(1/sqrt(W1)));
fprintf('Maximum Endurance: %.4f\n',t_max)