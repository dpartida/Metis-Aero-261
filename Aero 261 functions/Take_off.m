function [v_to,x_to] = takeOff[W,S,CD0,K,g,T,Trev,p,sweep,CLmax]
W=600000;
S=264;
CD0=0.014;
K=.056;
g=32.2;
T=3500*2;
Trev=.4*T;
p=input('Air density: ');
sweep=37.5;
CLmax=3.2*cosd(sweep);

JT=Trev/W;
JA=(p*CD0)/(2*(W/S));

v_stall=sqrt(2*(W/S)/(p*CLmax));
v_to=1.2*v_stall;
fprintf('Velocity for take-off: %.4f ft/s\n',v_to)

x_to=(v_to^2)/(2*(g*(T/W)));
fprintf('Distance traveled before take-off: %.4f ft\n',x_to)