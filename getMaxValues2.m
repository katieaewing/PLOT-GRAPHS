function [Power_max, stancePercentPower2, AngVel_max, stancePercentAngVel2] ...
    = getMaxValues2(stance, AngVel, Power)




% Magnitude of peak POWER
varsPower=Power.Properties.VariableNames;
Power_matrix=table2array(Power);
Power_max=min(Power_matrix);  %all powers are NEGATIVE...meaning eccentric??? 
Power_max2=array2table(Power_max,'VariableNames',varsPower);

% Timing of peak POWER (in terms of percent landing phase)
for aa=1:size(Power_matrix, 2)
    indStance= 1;
    while abs(abs(Power_max(aa))-abs(Power_matrix(indStance,aa))) > 0.000000015
        indStance=indStance+1;
    end
    indAllPower(aa)=indStance;
    
end
stancePercentPower=stance(indAllPower);
stancePercentPower2=array2table(stancePercentPower, 'VariableNames', varsPower);

Power_mag_time=[Power_max2; stancePercentPower2];
writetable(Power_mag_time, 'maxPower_mag_time.xls');


% Magnitude of peak ANGULAR VELOCITY
varsAngVel=AngVel.Properties.VariableNames;
AngVel_matrix=table2array(AngVel);
AngVel_max=max(abs(AngVel_matrix));  %all angular velocities are positive except knee flexion is negative. Take absolute value.
AngVel_max2=array2table(AngVel_max,'VariableNames',varsAngVel);

% Timing of peak  ANGULAR VELOCITY (in terms of percent landing phase)
for aa=1:size(AngVel_matrix, 2)
    indStance= 1;
    while abs(AngVel_max(aa)-abs(AngVel_matrix(indStance,aa))) > 0.000000015
        indStance=indStance+1;
    end
    indAllAngVel(aa)=indStance;
    
end
stancePercentAngVel=stance(indAllAngVel);
stancePercentAngVel2=array2table(stancePercentAngVel, 'VariableNames', varsAngVel);

AngVel_mag_time=[AngVel_max2; stancePercentAngVel2];
writetable(AngVel_mag_time, 'maxAngVel_mag_time.xls');


end




