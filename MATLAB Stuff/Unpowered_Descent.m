clear,clc

h1=30000; %altitude at the start of unpowered descent (ft)
h2=0; %altitude at the end of unpowered descent (ft) *usually Sea Level*
c_D0=0.014; %drag coefficient
K=0.056;
W=14500; %weight of aircraft (lb)
S=264; %wing area of aircraft (ft^2)
p_SL=0.0023769; %air density at starting altitude
p=input('Air density at starting altitude (slug/ft^3): ');
e=2.718281828;
E_max=1/(2*sqrt(c_D0*K)); %equation for maximum L/D
y=asind(1/E_max); %angle of descent for max range
E=1/tand(y); 
v_mr_SL=sqrt((2*(W/S)/p_SL)*(sqrt(K/c_D0))); %velocity for maximum range at sea level

if h1<36000
    B=30500;
else
    B=23800;
end

x=E_max*(h1-h2); %maximum flying distance for unpowered descent (make E=E_max)
fprintf('Maximum Range: %.4f (ft)\n',x)

v_mr=sqrt((2*(W/S)/p)*(sqrt(K/c_D0))); %airspeed that will maximize range for unpowered descent
fprintf('Velocity for maximum range: %.4f (ft/s)\n',v_mr)

t_mr=(E*(2*B))/(v_mr_SL)*(e^(-h2/(2*B))-e^(-h1/(2*B))); %time spent in the air for maximum range of unpowered descent
fprintf('Time spent in the air for maximum range: %.4f (s)\n',t_mr)