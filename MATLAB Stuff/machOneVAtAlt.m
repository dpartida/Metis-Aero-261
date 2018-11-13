function [p, machOneV, mach80] = machOneVAtAlt(h, cruiseDist)
T0 = 288.16; % temperature at sea level
d0 = 1.225; % density of the atmosphere at sea level
p0 = 1.01325 * 10^5; % pressure of the atmosphere at sea level
g = 9.80065; % gravitational constant
R = 287; 
if h == 0
    T = T0;
    p = p0;
elseif h >= 1000 && h <= 10000
    a = -6.5 * 10^(0-3);
    T = T0 + a * h;
    p = ((T / T0)^(0 - g / (a * R))) * p0;
elseif h >= 11000 && h <= 25000
    a = -6.5 * 10^(0-3);
    T = T0 + a * 11;
    p = exp((0 - g / R * T) * h) * p0;
else
    a = 3 * 10^(0-3);
    T = T0 + a * h;
    p = ((T / T0)^(0 - g / (a * R))) * p0;
end
machOneV = sqrt(1.4*R*T)
mach80 = machOneV * 0.8