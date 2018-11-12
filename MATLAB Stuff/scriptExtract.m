clear,clc
%script that calls upon function extractPolarData.m to convert xflr5 data into usable matlab data

%graphs polar data Cl v. Cd and Cl v. Alpha
filename = uigetfile('polardataXFLR5.txt');
[ data, mach, reynoldsNumber, nCrit ] = extractPolarData(filename); %extracts xflr5 polar data, converts into matlab data
%2D airfoil plots below...
figure(1)
plot(data(:,1),data(:,2))
title('Cl v. Alpha Polar')
xlabel('Alpha')
ylabel('Cl')

figure(2)
plot(data(:,3),data(:,2))
title('Cl v. Cd Polar')
xlabel('Cd')
ylabel('Cl')

%3D wing plots below...
b=70; %wingspan in meters
c=10; %average chord length
sw=25; %sweep angle of 25 degrees
AR=b/c; %equation for aspect ratio
e=1.78*(1-(0.045*(AR^0.68)))-0.64; %calculates span efficiency factor for 2D airfoil lift curve slope
K=1/(pi*e*AR);
a0=0.115;
a=(a0*cosd(sw))/(1+(1/K)*a0*cosd(sw));%equation to convert 2D lift curve slope to 3D lift curve slope
ratio = a/a0;
Cd0=0.00485;
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
