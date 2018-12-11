function [gamma,ysteep,yfast,vysteep,vyfast,RCsteep,RCfast] = climbing(Tto,W,K,Cd0,S,rho_to)
%function "climbing" estimates flight performance during climbing flight
%   Detailed explanation goes here

gamma = 1 + sqrt(1 + ((12 * K * Cd0) / ((Tto / W)^2))); %variable with the purpose of grouping

ysteep = (Tto / W) - (2 * sqrt(K * Cd0)); %flight angle for steepest climb (radians)

yfast = (Tto / W) * (1-(gamma / 6)) - ((6 * K * Cd0) / (gamma * (Tto / W))); %flight angle for fastest climb (radians)

vysteep = sqrt(((2 * (W / S)) / rho_to) * sqrt(K/Cd0)); % velocity to achieve steepest climb

vyfast = sqrt(((Tto / W) * (W / S) * gamma) / (3 * rho_to * Cd0)); %velocity to achieve fastest climb

ysteep = ysteep * 180 / pi; %converts flight angle from radians to degrees

yfast = yfast * 180 / pi; %converts flight angle from radians to degrees

RCsteep = vysteep * sind(ysteep); %rate of climb for steepest climb

RCfast = vyfast * sind(yfast); %rate of climb for fastest climb

end

