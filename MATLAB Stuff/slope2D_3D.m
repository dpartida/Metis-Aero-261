clear,clc

%calculates slope correction from a 2D airfoil lift curve to a 3D lift curve


b=70; %wingspan in meters
c=10; %average chord length
sw=25; %sweep angle of 25 degrees
AR=b/c; %equation for aspect ratio
e=1.78*(1-(0.045*(AR^0.68)))-0.64; %calculates span efficiency factor
a0=0.115; %2D airfoil lift curve slope
a=(a0*cosd(sw))/(1+(1/(pi*e*AR))*a0*cosd(sw)); %equation to convert 2D lift curve slope to 3D lift curve slope