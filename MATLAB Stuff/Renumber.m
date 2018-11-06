clear,clc

%main script that calls to functions that solve for Reynold's Number Re

%useful unit conversions: 
%1 ft=0.3048 m | 1 kg=0.0685218 slug | 1 N=0.224809 lb |
%1 (lb*s)/ft^2=47.88(N*s)/m^2

%print statement warning user to keep units in check
fprintf('**Make sure units match**\n-------------------------\n')

p=input('Air density(p) at the given altitude (kg/m^3)?: '); %air density -units kg/m^3 
v=input('Air speed(v) (m/s)?: '); %relative airspeed -units m/s
S=input('Planform area(S) (m^2)?: '); %wing planform area -units m^2
b=input('Wingspan(b) (m): '); %wingspan -units m
u=1.7907*(10^-5); %air viscosity -units (N*s)/m^2

Re=(p*v*(S/b))/u; %equation to calculate Reynold's Number
fprintf('Re = %f\n',Re)
