clear,
clc

p = 1.225;
v = 5;
S = 100;
b = 25;
u = 1.7907*(10^-5);
W = 30,000;
C_D0 = 0.02;
e_0=0.600; %Oswald Span Efficiency Factor constant of Boeing 747-300
K=1/(pi*e_0*7); %Another constant

%Treq=zeros(1,47); %sets up row matrix of 47 zeros to iterate 46 different Velocity values through the "for loop" to calculate Thrust required at each velocity 
%C_L=zeros(1,47); %same thing but for calculating Coefficient of Lift at each velocity value
%V=150:50:2450; %matrix of each desired velocity value to run through the Thrust and lift-coefficient equations 


thrustcalculator(W,p,C_D0,K,S);