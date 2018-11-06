clear,clc
%calculates velocity to achieve best range for jets (V_Emax=V_(L/D)max]
p=1.2; %air density
K=.05; 
C_D0=0.03;

v_BR=sqrt(((2*(W/S))/p)*sqrt((3*K)/C_D0));

fprintf('Velocity to achieve Best Range: %.4f m/s\n',v_BR)

