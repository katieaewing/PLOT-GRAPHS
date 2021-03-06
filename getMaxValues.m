%% Created by: Katie Ewing 
% Modified: June 2015
%
% This function finds the maximum values and the time (with respect to the
% landing phase) these occur for all variables.
%%

function [maxGRF_BW, stancePercentGRF, IKfinal_max2, stancePercentIK2, IDfinal_BW_max2, stancePercentID2, MFfinal_BW_max2, stancePercentMF2,Power_max, stancePercentPower2, AngVel_max, stancePercentAngVel2] ...
    = getMaxValues(stance, GRFfinal_BW, IKfinal, IDfinal_BW, MFfinal_BW, outGRF, outIK, outMF, outID, GRFleg, KneeJoint, AngVel, Power)

% Magnitude of max GRF
GRFfinal_matrix=table2array(GRFfinal_BW);
maxGRF_BW=max(abs(GRFfinal_matrix)); 
varGRF=[outGRF.labels(1:7) 'l_ground_force_vx' 'l_ground_force_vy'	'l_ground_force_vz'	'l_ground_force_px'	'l_ground_force_py'	'l_ground_force_pz'];
maxGRF_BW2=array2table(maxGRF_BW,'VariableNames',varGRF);

% Timing of max GRF (in terms of percent landing phase)
for bb=1:size(GRFfinal_matrix, 2)
indStanceGRF= 1;
    while abs(maxGRF_BW(bb)-abs(GRFfinal_matrix(indStanceGRF,bb))) > 0.0015
        indStanceGRF=indStanceGRF+1;
    end
    indAllGRF(bb)=indStanceGRF;
end

stancePercentGRF=stance(indAllGRF);
stancePercentGRF=array2table(stancePercentGRF, 'VariableNames',varGRF);
maxGRF_mag_time=[maxGRF_BW2; stancePercentGRF];
writetable(maxGRF_mag_time, 'maxGRF_BW_mag_time.xls');

% Magnitude of peak joint angles
IKfinal_matrix=table2array(IKfinal);
IKfinal_max=max(abs(IKfinal_matrix));
IKfinal_max2=array2table(IKfinal_max,'VariableNames',outIK.labels);

% Timing of peak joint angles (in terms of percent landing phase)
for aa=1:size(IKfinal_matrix, 2)
    indStanceIK= 1;
    while abs(IKfinal_max(aa)-abs(IKfinal_matrix(indStanceIK,aa))) > 0.0015
        indStanceIK=indStanceIK+1;
    end
    indAllIK(aa)=indStanceIK;
    
end
stancePercentIK=stance(indAllIK);
stancePercentIK2=array2table(stancePercentIK, 'VariableNames', outIK.labels);
maxIK_mag_time=[IKfinal_max2; stancePercentIK2];
writetable(maxIK_mag_time, 'maxIK_mag_time.xls');

% Magnitude of peak joint moments
IDfinal_matrix=table2array(IDfinal_BW);
IDfinal_BW_max=max(abs(IDfinal_matrix));  %NEED TO CHECK SIGN CONVENTIONS. ABSOLUTE VALUE SO THAT POSITIVE ...
...HIP MOMENT IS EXTENSION, POSITIVE KNEE MOMENT IS EXTENSION, AND POSITIVE ANKLE IS PLANTARFLEXION.
IDfinal_BW_max2=array2table(IDfinal_BW_max,'VariableNames',outID.labels);

% Timing of peak joint angles (in terms of percent landing phase)
for aa=1:size(IDfinal_matrix, 2)
    indStanceID= 1;
    while abs(IDfinal_BW_max(aa)-abs(IDfinal_matrix(indStanceID,aa))) > 0.0015
        indStanceID=indStanceID+1;
    end
    indAllID(aa)=indStanceID;
    
end
stancePercentID=stance(indAllID);
stancePercentID2=array2table(stancePercentID, 'VariableNames', outID.labels);

maxID_BW_mag_time=[IDfinal_BW_max2; stancePercentID2];
writetable(maxID_BW_mag_time, 'maxID_BW_mag_time.xls');

% Magnitude of peak muscle forces
MFfinal_BW_matrix=table2array(MFfinal_BW);
MFfinal_BW_max=max(abs(MFfinal_BW_matrix));
MFfinal_BW_max2=array2table(MFfinal_BW_max,'VariableNames',outMF.labels);

% Timing of peak muscle forces (in terms of percent landing phase)
for aa=1:size(MFfinal_BW_matrix, 2)
    indStance= 1;
    while abs(MFfinal_BW_max(aa)-abs(MFfinal_BW_matrix(indStance,aa))) > 0.000000015
        indStance=indStance+1;
    end
    indAllMF(aa)=indStance;
    
end
stancePercentMF=stance(indAllMF);
stancePercentMF2=array2table(stancePercentMF, 'VariableNames', outMF.labels);

maxMF_BW_mag_time=[MFfinal_BW_max2; stancePercentMF2];
writetable(maxMF_BW_mag_time, 'maxMF_BW_mag_time.xls');


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






%Finding the KNEE flexion angle at peak GRF

indPeakGRF=indAllGRF(GRFleg);
FLEX_EXT=abs(IKfinal.(KneeJoint{1}));
FlexGRF=FLEX_EXT(indPeakGRF);

%Finding the flexion angle at initial contact
FlexIC=FLEX_EXT(1);

%The maximum flexion angle 
FlexMax=FLEX_EXT(200);

FlexionAngles=[FlexIC, FlexGRF, FlexMax];
FlexionAngles=array2table(FlexionAngles,'VariableNames',{'FlexIC' 'FlexGRF' 'FlexMax'});
writetable(FlexionAngles, 'three_flexion_angles.xls');

end




