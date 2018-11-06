clear,clc

%required thrust v velocity calculator and graph generator for Boeing
%747-300


C_D0=0.02; %CD_0 drag constant
p=0.3648; %density (kg/m^3) at 11,000 m altitude
AR=7; %aspect ratio constant of Boeing 747-300
e_0=0.600; %Oswald Span Efficiency Factor constant of Boeing 747-300
K=1/(pi*e_0*AR); %Another constant
W=378098.84; %the mass of aircraft (maximum takeoff weight (N)/9.8 (m/s))
S=511; %Area of the wings (m^s)
Treq=zeros(1,47); %sets up row matrix of 47 zeros to iterate 46 different Velocity values through the "for loop" to calculate Thrust required at each velocity 
C_L=zeros(1,47); %same thing but for calculating Coefficient of Lift at each velocity value
V=150:50:2450; %matrix of each desired velocity value to run through the Thrust and lift-coefficient equations 

for i=1:47
    C_L(i)=W/((1/2)*p*V(i)^2); %calculates lift coefficient at each velocity
    Treq(i)=((1/2)*p*V(i)^2*C_D0)+(K*W^2)/((1/2)*p*V(i)^2*S); %calculates required thrust at each velocity
end

figure(1) %graph of thrust v velocity
title('Boeing 747-300 Req. Thrust v. Vel.')
plot(V,Treq)
xlabel('Velocity (km/hr)')
ylabel('Thrust Required (N)')

figure(2)%graph of lift coefficient v velocity
title('Boeing 747-300 Lift Coeff. v. Vel.')
plot(V,C_L)
xlabel('Velocity (km/hr')
ylabel('C_L')