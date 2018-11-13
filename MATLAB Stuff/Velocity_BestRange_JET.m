clear,clc
%calculates velocity to achieve best range for jets (V_Emax=V_(L/D)max]
p=1.2; %air density
K=.05; 
C_D0=0.03;
W = 30,000
S = 250
t = 4


v_BR=sqrt(((2*(W/S))/p)*sqrt((3*K)/C_D0));
d_BR = v_BR*3600/1000*t
fprintf('Velocity to achieve Best Range: %.4f m/s\n',v_BR)

