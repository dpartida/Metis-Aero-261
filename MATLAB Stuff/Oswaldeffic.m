clear,clc

%e_0 calculator for sweep angle > 30 degrees

AR=7; %aspect ratio of wings
sweep=25; %sweep angle of wings

if 0<=sweep && sweep<=30
    e_0=1.78*(1-0.045*AR^0.68)-0.64; %oswald span efficiency factor for sweep angles less than 30 degrees
else
    e_0=4.61*(1-0.045*AR^0.68)*((cosd(sweep))^0.15)-3.1; %oswald factor for sweep angle greater than 30 degrees
end

fprintf('Oswald Span Efficiency Factor e_0: %.4f\n',e_0)