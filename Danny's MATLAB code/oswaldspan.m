function [e0] = oswaldspan(AR,sweep)
%function "oswaldspan" estimates the oswald span efficiency factor of an
%aircraft

if sweep < 0
    disp('Invalid sweep angle, must be zero or greater')
elseif sweep == 0
    e0=1.78*(1-(0.045*(AR^0.68)))-0.64; %oswald span efficiency factor for sweep = 0 degrees
elseif sweep > 30
    e0=4.61*(1-(0.045*(AR^0.68)))*((cosd(sweep))^0.015)-3.1; %oswald span efficiency factor for sweep > or = 30 degrees
else
    e0= ((4.61*(1-(0.045*(AR^0.68)))*((cosd(sweep))^0.015)-3.1) + (1.78*(1-(0.045*(AR^0.68)))-0.64)) / 2; %average value 
end
end

