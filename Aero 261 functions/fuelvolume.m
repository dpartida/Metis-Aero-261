function [f_V] = fuelvolume(f_W)
%This function calculates the volume of fuel burned
%   Relies solely on weight of fuel and conversion factor 0.81kg jetfuel = 1 L
f_V = (f_W/0.81); %calculated in liters
end

