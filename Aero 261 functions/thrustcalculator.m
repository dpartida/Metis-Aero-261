function [C_L,Treq] = thrustcalculator(W,p,C_D0,K,S)
%This equation calculates thrust required for steady level flight vs
%airspeed
%   This calculates thrust required for steady level flight using the
%   variables W(weight), p(air density), C_D0, K, S(wing area)

Treq=zeros(1,47); %sets up row matrix of 47 zeros to iterate 46 different Velocity values through the "for loop" to calculate Thrust required at each velocity 
C_L=zeros(1,47); %same thing but for calculating Coefficient of Lift at each velocity value
V=150:50:2450; %matrix of each desired velocity value to run through the Thrust and lift-coefficient equations 

for i=1:47
    C_L(i)=W/((1/2)*p*V(i)^2); %calculates lift coefficient at each velocity
    Treq(i)=((1/2)*p*V(i)^2*C_D0)+(K*W^2)/((1/2)*p*V(i)^2*S); %calculates required thrust at each velocity
end

figure(1) %graph of thrust v velocity
title('Thrust v. Velocity')
plot(V,Treq)
xlabel('Velocity (km/hr)')
ylabel('Thrust Required (N)')

figure(2)%graph of lift coefficient v velocity
title('Lift Coeff. v. Velocity')
plot(V,C_L)
xlabel('Velocity (km/hr')
ylabel('C_L')
end

