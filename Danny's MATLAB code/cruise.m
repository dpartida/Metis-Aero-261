function [vstall_c,vEm,TreqEm,vxmax,xmax,Treqxmax,T_c,Re_root,Re_tip] = cruise(W,S,K,Cd0,rho_c,vstall_to,TSFC,z,Em,Tsl,rho_sl,u,c_tip,c_root)
%function "cruise" estimates flight performance for cruise 
%   Detailed explanation goes here

vstall_c = vstall_to; %same stall airspeed as take-off

vEm = sqrt(((2 * W / S) / rho_c) * sqrt(K  / Cd0)); %airspeed to achieve maximum aerodynamic efficiency

TreqEm = W / Em; %thrust required to maintain maximum aerodynamic efficiency

vxmax = sqrt(((2 * W / S) / rho_c) * sqrt(3*K/Cd0)); %airspeed to achieve longest range

Treqxmax = W / ((sqrt(3) / 2) * Em); %Thrust required to achieve longest range

xmax = (vxmax / (TSFC * (Treqxmax / W))) * log(1 / (1 - z)); %longest range possible

T_c = rho_c * Tsl / rho_sl ; %total thrust available at cruising altitude

Re_tip = (rho_c * vxmax * c_tip) / u;

Re_root = (rho_c * vxmax * c_root) / u;
end

