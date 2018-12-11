function [Cd0] = Drag_Build_Up(Re,L,d,b,c,be,ce,he,Ln,dn,vsound,sweep)

Cf = 1.328/sqrt(Re);

SRef = b*c;
SWetWing = 2*b*c;


%fWing = 10/sqrt((4/pi)*SRefWing);

% Chord length = c
% S = b*c

FFWing = (1+(0.6/0.3)*(0.12)+(100*(0.12^4)))*(1.34*(vsound^0.18)*((cosd(sweep))^0.28));
%0.3 is location of maximum thickness as ratio to chord
%0.12 is ratio of maximum thickness to chord

CD_Wing = (Cf*FFWing*1*SWetWing)/SRef; %1 is Q = interference factor
%""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

SWetFuselage = (2*pi*(d/2)*L)+(4*pi*((d/2)^2)); % Circumference times the length
A = (pi)*((d/2)^2); % Area of fuselage cross section
fFuselage = L/(sqrt((4/pi)*A));


FFFuselage = 1+(60/(fFuselage^3))+(fFuselage/400);

CD_Fuselage = (Cf*FFFuselage*1*SWetFuselage)/SRef; % Interference factor Q = 1
%""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

FFhorizstab = (1+(0.6/0.3)*(0.12)+100*(0.12^4))*(1.34*(vsound^0.18)*((cosd(sweep))^0.28));
SWethorizstab=2*be*ce;

CD_horizstab=(Cf*FFhorizstab*1.04*SWethorizstab)/SRef; %Q = 1.04 for conventional empennage

FFvertstab = (1+(0.6/0.3)*(0.12)+100*(0.12^4))*(1.34*(vsound^0.18)*((cosd(sweep))^0.28));
SWetvertstab=2*he*ce;

CD_vertstab=(Cf*FFvertstab*1.04*SWetvertstab)/SRef; %Q = 1.04 for conventional empennage

%""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Anacelle = 4*(pi*((dn/2)^2));
SWetNacelles = 4*2*(pi*(dn/2))*Ln; % Calculates surface are of nacelles a and accounting for 4 engines
fNacelles = 4*(Ln/sqrt(4*pi*Anacelle));

% length or chord length = Ln


FFNacelles = 4*(1+(0.35/fNacelles));

CD_Nacelles = 4*(Cf*FFNacelles*1.3*SWetNacelles)/SRef; %Q=1.3 
%""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Cd0 = CD_Wing + CD_Fuselage + CD_horizstab + CD_vertstab + CD_Nacelles+0.04; %0.4 = fudge factor


end

