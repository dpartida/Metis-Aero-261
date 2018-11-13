function [] = Drag_Build_Up(Re,inputArg2)

Cf = 1.328/Re;

SRefWing = 576;
SWetWing = 576*2;
FF = 


CD_Wing = (Cf*FF*1*SWetWing)/SRefWing;

CD_Fuselage = (Cf*FF*1*SWetWing)/SRefFuselage;

CD_Empennage = (Cf*FF*1*SWetWing)/SRefEmpennage;

CD_Nacelles = (Cf*FF*1*SWetWing)/SRefNacelles;

end

