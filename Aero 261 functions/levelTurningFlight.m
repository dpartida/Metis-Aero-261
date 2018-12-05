function [maxLoadingFactor,maxBankAngleVelocity,yawRate,turnRadius,v_turning] = levelTurningFlight(Em,Th,W,S,Cd0,K,rho,g)
maxLoadingFactor = Em * (Th / W)
maxBankAngle = acos(1/maxLoadingFactor)
v_positive = sqrt(((T / W) * (W / S) + (W / S) * sqrt((T / W)^2 - 4 * K * Cd0 * n^2)) / ( rho * Cd0 ))
v_negative = sqrt(((T / W) * (W / S) - (W / S) * sqrt((T / W)^2 - 4 * K * Cd0 * n^2)) / ( rho * Cd0 ))
if v_positive >= v_negative
    v_turning = v_positive
elseif v_negative >= v_positive
    v_turning = v_negative
else
    print("WTF?!")
    maxBankAngleVelocity = v_positive
end
yawRate = (g * sqrt(maxLoadingFactor^2 - 1) / maxBankAngleVelocity
turnRadius = maxBankAngleVelocity^2 / (g * sqrt(maxLoadingFactor^2 - 1))
end