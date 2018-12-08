function [atheta,vflare,rflare,Sflare,hflare,Sa] = flare(vstall,g,nmax)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

atheta=3; %approach angle (degrees)

vflare=1.25*vstall; %velocity of flare

rflare=(vflare^2)/(g*(nmax-1)); %radius of flare

Sflare=rflare*sind(atheta);
hflare=rflare*(1-cosd(atheta));
hflare=hflare*3.28; %convert to feet
Sa=(50-hflare)/tand(atheta);
Sa=Sa/3.28; %convert back to meters
end

