function [nmax,thetamax,vnmax,yawRate,r] = turning(Em,T_c,W,S,Cd0,K,rho_c,g)
%function "turning" estimates performance of level turning flight under
%conditions of maximum aerodynamic loading factor "nmax"

nmax = Em * (T_c / W); %estimates maximum aerodynamic loading factor during a turn (used maximum thrust given by engines at altitude for max T/W)

thetamax = acos(1/nmax); %estimates a maximum bank for a turn angle based on the loading factor

v_positive = sqrt(((T_c / W) * (W / S) + (W / S) * sqrt((T_c / W)^2 - 4 * K * Cd0 * nmax^2)) / ( rho_c * Cd0 )); %airspeed during turn

v_negative = sqrt(((T_c / W) * (W / S) - (W / S) * sqrt((T_c / W)^2 - 4 * K * Cd0 * nmax^2)) / ( rho_c * Cd0 ));

if v_positive >= v_negative
    vnmax = v_positive;
elseif v_negative >= v_positive
    vnmax = v_negative;
else
    print("WTF?!")
    vnmax = v_positive;
end

yawRate = (g * sqrt(nmax^2 - 1)) / vnmax; %yaw rate during turn

thetamax=thetamax * 180 / pi; %converts bank angle to degrees

yawRate = yawRate * 180 / pi; %converts yaw rate to degrees

r = (vnmax^2) / (g * sqrt(nmax^2 - 1)); %turn radius
end