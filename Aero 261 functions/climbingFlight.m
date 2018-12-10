function [v_steep, v_fast, angle_steep, angle_fast, roc_steep, roc_fast] climbingFlight = [T,W,S,K,Cd0,p]
gamma = 1 + sqrt(1 + ((12 * K * Cd0)/(T / w)^2))
angle_steep = (T/W) - 2*sqrt(k * Cd0)
angle_fast = ((T/W) * (1- (gamma/6))) - (6 * K * Cd0)/(gamma * (T/W))
v_steep = sqrt(((2 * (W/S)) / p) * sqrt(K / Cd0))
v_fast = sqrt(((T / W) * (W/S) * gamma)/(3 * p * Cd0))
roc_steep = v_steep * sin(angle_steep)
roc_fast = v_fast * sin(angle_fast)
end