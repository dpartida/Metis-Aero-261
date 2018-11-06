clear,clc
%calculates velocity to achieve Maximum endurance for jets
%[V_Emax=V_(L/D)max]

W=200000; %weight of aircraft
S=1600; %wing area %aspect ratio
p=1.2; %air density
K=.05; %K constant
C_D0=0.03; %drag constant

v_Tmin=sqrt(((2*(W/S))/p)*sqrt(K/C_D0));
fprintf('Velocity to achieve Max Endurance (Tmin): %.4f m/s\n',v_Tmin)
