function k = K_val(AR,e_0)
% Calculates k value for aircraft
% Takes in Aspect Ratio and Oswald Efficiendy Factor as inputs
k = 1/(pi*AR*e_0);

fprintf('K value is: %.4f\n',k)

end

