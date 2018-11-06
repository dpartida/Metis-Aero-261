clear,clc
%calculates velocity to achieve best range for props [V_Emax=V_(L/D)max]

W=200000; %weight of aircraft
S=1600; %wing area %aspect ratio
p=1.2; %air density
K=.05; 
C_D0=0.03;

v_BR=sqrt(((2*(W/S))/p)*sqrt(K/C_D0));

fprintf('Velocity to achieve Best Range: %.4f m/s\n',v_BR)

W1=220000; %weight at beginning of flight
W2=180000; %weight at end of flight
BSFC=0.4274; %brake specific fuel consumption, c^
eta=.92; %power efficiency

E_max=1/(2*sqrt(C_D0*K));
x_max=(E_max/BSFC)*log(W1/W2)*(eta);
fprintf('Maximum Range: %.4f\n',x_max)

