clear,clc
% Calculates k value for aircraft

AR = 7; % Aspect Ratio of wings
e_0 = 0.8392; % Oswald efficiencty factor

k = 1/(pi*AR*e_0);

fprintf('K value is: %.4f\n',k)
