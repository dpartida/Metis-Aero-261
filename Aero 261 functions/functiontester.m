clear,
clc

p = 1.225;
v = 5;
S = 100;
b = 25;
u = 1.7907*(10^-5);
W = 30000;
C_D0 = 0.02;
t = 4; %random travel time in hours
e_0=0.600; %Oswald Span Efficiency Factor constant of Boeing 747-300
K=1/(pi*e_0*7); %Another constant

v_BR = maxrangeairspeed(W,S,p,K,C_D0)

d_BR = maxrangecalculator(v_BR,t)
