clear,
clc

AR = 7
p_0 = 1.225;
p = .46148
v = 5;
S = 100; %wing area
b = 25; %
u = 1.7907*(10^-5); %something with air?
W = 30000;
C_D0 = 0.02;
t = 4; %random travel time in hours
e_0=0.84; %Oswald Span Efficiency Factor constant of Boeing 747-300
K=1/(pi*e_0*AR); %Another constant


v_BR = maxrangeairspeed(W,S,p,K,C_D0)

d_BR = maxrangecalculator(v_BR,t)

v_BE = maxenduranceairspeed(W,S,p,K,C_D0)

v_stall = stallspeed(W,S,p)

thrustcalculator(W,p,C_D0,K,S)
