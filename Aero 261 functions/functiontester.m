clear,
clc

filename = uigetfile('polardataXFLR5.txt');
[ data, mach, reynoldsNumber, nCrit ] = extractPolarData(filename); %extracts xflr5 polar data, converts into matlab data

h = input('What is your cruise altitude?')
b=70; %wingspan in meters
c=10; %average chord length
AR = 7; % aspect ratio
p_0 = 1.225; % pressure at sea level
p = .46148; %at 9.1 km
p_r = (p/p_0); 
v = 5;
S = 100; %wing area
b = 25; %
sw = 27.5; % sweep angle
u = 1.7907*(10^-5); %something with air?
W = 30000;
C_D0 = 0.02;
t = 4; %random travel time in hours
e_0=0.84; %Oswald Span Efficiency Factor constant of Boeing 747-300
K=1/(pi*e_0*AR); %Another constant
TSFC = 9.7 %thrust specific fuel consumption (g/kN/s)
T = 226.860*4 %kN, four engines
e=1.78*(1-(0.045*(AR^0.68)))-0.64; %calculates span efficiency factor for 2D airfoil lift curve slope
a0=0.115;
a=(a0*cosd(sw))/(1+(1/K)*a0*cosd(sw));%equation to convert 2D lift curve slope to 3D lift curve slope
ratio = a/a0;

v_BR = maxrangeairspeed(W,S,p,K,C_D0)

d_BR = maxrangecalculator(v_BR,t)

v_BE = maxenduranceairspeed(W,S,p,K,C_D0)

v_stall = stallspeed(W,S,p)

thrustcalculator(W,p,C_D0,K,S);

f_W = fuelweight(TSFC,T,p_r,t)

f_V = fuelvolume(f_W)

for i=1:45
    Cl(1,i)=ratio*data(i,2);
    Cd(1,i)=Cd0+K*(Cl(1,i))^2;
end

%plot of coefficient of lift vs angle of attack
figure(3)
plot(data(:,1),Cl)
title('Cl v. Alpha 3D Wing')
xlabel('Alpha')
ylabel('Cl')
%plot of coefficient of lift vs coefficient of drag

figure(4)
plot(Cd,Cl)
title('Cl v. Cd 3D Wing')
xlabel('Cd')
ylabel('Cl')

[ClStall, loc] = max(Cl) %find the coefficient of lift at stall and its location in the vector
alphaStall = data(loc,1) %find the alpha stall based on the coefficient of lift
[ClZeroLift, loc] = min(abs(Cl-0)) %finds location of closest coefficient of lift value in vector to zero 
alphaZeroLift = data(loc,1) %find the value of alpha from the zero lift curve

