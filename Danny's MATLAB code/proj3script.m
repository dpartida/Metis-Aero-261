clear,
clc


%======================================
%|  MAIN SCRIPT FOR AERO-261 PROJECT  |
%|  Estimates Aircraft Performance    |
%======================================
%
%Unit System: SI
%
%Length: meters | Time: seconds | Mass: kilograms | Force: Newtons



%===================================================================
%Aircraft Specs
%===================================================================

b = 70; %wingspan
c = 9.78; %average-chord length of wing
c_root = 12.3; %chord length at root
c_tip = 5.8; %chord lenth at tip
AR = b / c; %aspect ratio
S = b * c; %wing area
sweep = 27.5; %sweep angle of wing
L = 75; %length of fuselage
d = 7.6; %diameter of fuselage
be = 21.6; %span of horizontal-stabilizer (empennage)
he = 12.7; %height of vertical stabilizer (empennage)
ce = 5; %chord length of stabilizers
Ln = 3.8; %length of nacelles
dn = 2.5; %diameter of nacelles
Wf = 1500000; %Fuel weight
W = 3750000; %Total weight
Tsl = 907440; %Thrust available from powerplant at Sea Level
TSFC = 9.5157 * (10^(-5)); %Thrust Specific Fuel Consumption of powerplant (1/s)
hto = 300; %altitude of take-off airport
hc = 7000; %cruising altitude
hla = 500; %altitude of landing airport
xc = 3950000; %cruising distance
%NACA Airfoil
filename = uigetfile('polardataXFLR5.txt');
[data,mach,reynoldsNumber,nCrit] = extractPolarData(filename); 
%extracts xflr5 polar data, converts into usable matlab data

%====================================================================
%Atmosphere Characteristics
%====================================================================

g = 9.81; %gravitational acceleration (m/s^2)
R = 287; %universal gas constant (N*m/kg*K)
u = 1.7907 * (10^-5); %air viscosity at sea level (kg/m/s)
rho_sl = 1.225; %air density at sea level (kg/m^3)
[ Tempto,~,~,rho_to ] = atmosisa( hto ); %temperature, pressure, density at takeoff airport
[ Tempc,~,P,rho_c ] = atmosisa( hc ); %temperature, pressure, density at cruise altitude
vsound = speedofsound( R,Tempc ); %speed of sound at prescribed altitude (m/s)
mach80per = mach80percent( vsound ); % 80% speed of sound
fprintf('\n')

%=====================================================================
%Aircraft Performance Coefficients/Ratios
%=====================================================================

v = 230; %estimation of cruise airspeed for reynolds number calculatior
e0 = oswaldspan(AR,sweep); %oswald span efficiency factor
K = kvalue( e0,AR ); %K-value 
Re = reynolds( rho_c,v,c,u ); %calculates reynolds number which is used for drag buildup (Cd0)
z = Wf / W; %fuel fraction (want to be be less than 1/2, typically between .26 and .45)
W2 = W-Wf;
a0 = 0.115; %slope of airfoil lift curve
a = (a0 * cosd(sweep)) / ( 1 + (1 / K) * a0 * cosd(sweep)); %slope of wing lift curve
ratio = a / a0; %ratio of a to a0
Cd0 = Drag_Build_Up( Re,L,d,b,c,be,ce,he,Ln,dn,vsound,sweep ); %zero-lift drag coefficient
Em = Emax( K,Cd0 ); %maximum Lift to Drag ratio

%=====================================================================
%Graphs
%=====================================================================

%creates vector of 45 data points for wing lift curve and CL v CD
for i=1:45
    CL(1,i) = ratio * data(i,2);
    CD(1,i) = Cd0 + K * (CL(1,i))^2;
end
%plot of coefficient of lift vs angle of attack
figure(1)
plot(data(:,1),CL)
title('Cl v. Alpha 3D Wing')
xlabel('Alpha')
ylabel('Cl')
%plot of coefficient of lift vs coefficient of drag
figure(2)
plot(CD,CL)
title('CL v. CD 3D Wing')
xlabel('CD')
ylabel('CL')

[ClStall, loc] = max(CL); %find the coefficient of lift at stall and its location in the vector
alphaStall = data(loc,1); %find the alpha stall based on the coefficient of lift
[CLZeroLift,loc] = min(abs(CL-0)); %finds location of closest coefficient of lift value in vector to zero 
alphaZeroLift = data(loc,1); %find zero-lift angle of attack from curve

%====================================================================
%Take-off
%====================================================================

[ Tto,CLmax,vstall_to,vto,xto,tto ] = takeoff( Tsl,W,S,rho_to,sweep,g,rho_sl );

fprintf('Take-Off\n')
fprintf('--------\n')
fprintf('Airspeed for Stall: %.4f (m/s)\n',vstall_to)
fprintf('Airspeed for Take-Off: %.4f (m/s)\n',vto)
fprintf('Distance Traveled while Accelerating to Take-off Airspeed: %.4f (m)\n',xto)
fprintf('Time Spent Accelerating to Take-off Airspeed: %.4f (s)\n',tto)
fprintf('\n')

%====================================================================
%Climbing Flight
%====================================================================

[ gamma,ysteep,yfast,vysteep,vyfast,RCsteep,RCfast ] = climbing( Tto,W,K,Cd0,S,rho_to );

fprintf('Climbing Flight\n')
fprintf('---------------\n')
fprintf('Flight Angle for Steepest Climb: %.4f (degrees)\n',ysteep)
fprintf('Airspeed for Steepest Climb: %.4f (m/s)\n',vysteep)
fprintf('Flight Angle for Fastest Climb: %.4f (degrees)\n',yfast)
fprintf('Airspeed for Fastest Climb: %.4f (m/s)\n',vyfast)
fprintf('Rate of Steepest Climb: %.4f (m*degrees/s)\n',RCsteep)
fprintf('Rate of Fastest Climb: %.4f (m*degree/s)\n',RCfast)
fprintf('\n')

%====================================================================
%Steady Level Flight Performance
%====================================================================

[ CL,Treq ] = thrustcalculator( W,rho_c,Cd0,K,S ); 

[vstall_c,vEm,TreqEm,vxmax,xmax,Treqxmax,T_c,Re_root,Re_tip] = cruise(W,S,K,Cd0,rho_c,vstall_to,TSFC,z,Em,Tsl,rho_sl,u,c_tip,c_root);

fprintf('Steady, Level Flight\n')
fprintf('--------------------\n')
fprintf('Airspeed for Stall: %.4f (m/s)\n',vstall_c)
fprintf('Airspeed for Best Aerodynamic Efficiency: %.4f (m/s)\n',vEm)
fprintf('Thrust Required to maintain Aerodynamic Efficiency: %.4f (N)\n',TreqEm)
fprintf('Airspeed for farthest Range: %.4f (m/s)\n',vxmax)
fprintf('Distance of farthest Range: %.4f (m)\n',xmax)
fprintf('Thrust Required for Longest Range: %.4f (N)\n',Treqxmax)
fprintf('Thrust Available: %.4f (N)\n',T_c)
fprintf('Reynolds Number at Tip: %.4f \n',Re_tip)
fprintf('Reynolds Number at Root: %.4f \n',Re_root)
fprintf('\n')

%====================================================================
%Level Turning Flight Performance
%====================================================================

[ nmax,thetamax,vnmax,yawRate,r ] = turning( Em,T_c,W,S,Cd0,K,rho_c,g );

fprintf('Level Turning Flight\n')
fprintf('--------------------\n')
fprintf('Maximum Aerodynamic Loading Factor: %.4f\n',nmax)
fprintf('Maximum Bank Angle: %.4f (degrees)\n',thetamax)
fprintf('Airspeed during Turn: %.4f (m/s)\n',vnmax)
fprintf('Radius of Turn: %.4f (m)\n',r)
fprintf('Yaw Rate of Turn: %.4f (degrees/s)\n',yawRate)
fprintf('\n')

%====================================================================
%Unpowered Decent Performance
%====================================================================

[ B,vxmaxsl,yxmaxd,vxmaxd,xbr,tbr ] = descent( Em,hc,hla,W2,S,K,Cd0,rho_sl,rho_c );

fprintf('Descent\n')
fprintf('-------\n')
fprintf('Flight Angle for Slowest Descent (Best Range): %.4f (degrees)\n',yxmaxd)
fprintf('Airspeed for Best Range Descent: %.4f (m/s)\n',vxmaxd)
fprintf('Horizontal Distance Traveled during Descent: %.4f (m)\n',xbr)
fprintf('Time Spent Descending: %.4f (s)\n',tbr)
fprintf('\n')

%====================================================================
%Landing Approach and Flare
%====================================================================

[ atheta,vflare,rflare,Sflare,hflare,Sa ] = flare( vstall_to,g,nmax );

fprintf('Flare\n')
fprintf('------\n')
fprintf('Horizontal Distance traveled to Approach Flare: %.4f (m)\n',Sa)
fprintf('Airspeed during Flare: %.4f (m/s)\n',vflare)
fprintf('Radius of Flare: %.4f (m)\n',rflare)
fprintf('Horizontal Distance traveled during Flare: %.4f (m)\n',Sflare)
fprintf('\n')

%====================================================================
%Touchdown and Ground Roll
%====================================================================

[ tfr,ur,vtd,Jt,Ja,Sfr,Sg,Sd,a,t ] = landing( vstall_to,g,rho_sl,Cd0,W2,S,Tto );

fprintf('Touchdown & Ground-Roll\n')
fprintf('-----------------------\n')
fprintf('Airspeed during Landing: %.4f (m/s)\n',vtd)
fprintf('Distance Traveled during Free Roll: %.4f (m)\n',Sfr)
fprintf('Distance Traveled during Deceleration: %.4f (m)\n',Sd)
fprintf('Distance Traveled during total Ground Roll: %.4f (m)\n',Sg)
fprintf('Deceleration: %.4f (m/s^2)\n',a)
fprintf('Time Spent Decelerating to Zero Motion: %.4f (s)\n',t)
fprintf('\n')

