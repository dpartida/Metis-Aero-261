function [Total] = Drag_Build_Up(Re)

Cf = 1.328/Re;

SRefWing = 576;
SWetWing = 576*2;


fWing = 10/((4/pi)*576)^(1/2);

% length or chord length = 10m
% A = 576m^2

FFWing = (1+(60/fWing^3)+(fWing/400));

CD_Wing = (Cf*FFWing*1*SWetWing)/SRefWing;
%""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

SWetFuselage = 1;
SRefFuselage = 1;

fFuselage = 75.32/((4/pi)*6.43)^(1/2);

% length or chord length = 75.32m
% A = 6.43m^2

FFFuselage = (1+(60/fFuselage^3)+(fFuselage/400));

CD_Fuselage = (Cf*FFFuselage*1*SWetFuselage)/SRefFuselage;
%""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fEmpennage = 10/((4/pi)*576)^(1/2);

% length or chord length = 10m
% A = 576m^2

FFEmpennage = (1+(60/fEmpennage^3)+(fEmpennage/400));

CD_Empennage = (Cf*FFEmpennage*1*SWetEmpennage)/SRefEmpennage;
%""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fNacelles = 10/((4/pi)*576)^(1/2);

% length or chord length = 10m
% A = 576m^2

FFNacelles = (1+(60/fNacelles^3)+(fNacelles/400));

CD_Nacelles = (Cf*FFNacelles*1*SWetNacelles)/SRefNacelles;
%""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Total = CD_Wing + CD_Fuselage + CD_Empennage + CD_Nacelles;

end

