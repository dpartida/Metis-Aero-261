function [Total] = Drag_Build_Up(Re,L,d,b,c,be,ce,he,Ln,dn)

Cf = 1.328/Re;

SRefWing = b*c;
SWetWing = b*c*2;


fWing = 10/(sqrt((4/pi)*SRefWing));

% Chord length = c
% S = b*c

FFWing = (1+(60/fWing^3)+(fWing/400));

CD_Wing = (Cf*FFWing*1*SWetWing)/SRefWing;
%""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

SWetFuselage = (2*pi*(d/2))*L; % Circumference times the length
SRefFuselage = d*L; % Diameter of the fuselage times the length of the fuselage
A = (pi)*((d/2))^2; % Area of fuselage cross section
fFuselage = L/(sqrt((4/pi)*A));

% length of fuselage = l


FFFuselage = (1+(60/fFuselage^3)+(fFuselage/400));

CD_Fuselage = (Cf*FFFuselage*1*SWetFuselage)/SRefFuselage;
%""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Atotal = 2*(be*ce) + (he*ce);
SRefEmpennage = Atotal;
SWetEmpennage = Atotal * 2;

fEmpennage = 10/((sqrt(4/pi)*Atotal));

% length or chord length = 10m
% A = 576m^2

FFEmpennage = (1+(60/fEmpennage^3)+(fEmpennage/400));

CD_Empennage = (Cf*FFEmpennage*1*SWetEmpennage)/SRefEmpennage;
%""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Anacelle = (pi*(dn/2)^2);
SRefNacelles = (Ln*dn);
SWetNacelles = 2*(pi*(dn/2))*Ln*4; % Calculates urface are of nacelles a and accounting for 4 engines
fNacelles = 10/((4/pi)*Anacelle)^(1/2);

% length or chord length = Ln


FFNacelles = (1+(.35/fNacelles));

CD_Nacelles = (Cf*FFNacelles*1.5*SWetNacelles)/SRefNacelles;
%""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Total = CD_Wing + CD_Fuselage + CD_Empennage + CD_Nacelles;


end

