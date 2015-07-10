%% Created by: Katie Ewing 
% Modified: July 2015
%
% This function takes the muscle torques about each joint (calculated in
% getMuscleTorques.m) and groups the muscles into functional groups. It
% also calculates the peak magnitude and timing of the muscle torque for the GROUP. 
% Be cautious of sign convention for flexion/extension moments. All moments
% will be positive but that does not mean that they are all extension
% moments. Need to check depending on action of muscle group.
%%

function [muscleTorqueGroupsKnee, muscleTorqueGroupsKnee_mag_time, muscleTorqueGroupsHip, muscleTorqueGroupsHip_mag_time, muscleTorqueGroupsAnkle, muscleTorqueGroupsAnkle_mag_time] ...
    = getMaxMuscleTorques(stance, task, whichLeg, MuscleTorque_BW, MuscleTorqueHip_BW, MuscleTorqueAnkle_BW)

vars={'GlutMed', 'GlutMin', 'GlutMax','IlPs','Hams', 'Sar', 'TFL', 'Grac', 'RF', 'Vas', 'Gas', 'Sol', 'TA'};

%% Magnitude of peak knee muscle torque
    
muscleTorqueGroupsKnee = getMuscleTorqueGroups(task, whichLeg, MuscleTorque_BW);  %calls the subfunction 'getMuscelTorqueGroups' which groups the muscles by group
muscleTorqueGroupsKnee_max=max(abs(muscleTorqueGroupsKnee));  %the table will contain a mix of positive and negative muscle torques. Take absolute value.
muscleTorqueGroupsKnee_max2=array2table(muscleTorqueGroupsKnee_max,'VariableNames',vars);

% Timing of peak knee muscle torque (in terms of percent landing phase)
for aa=1:size(muscleTorqueGroupsKnee, 2)
    indStance= 1;
    while abs(abs(muscleTorqueGroupsKnee_max(aa))-abs(muscleTorqueGroupsKnee(indStance,aa))) > 0.000000015
        indStance=indStance+1;
    end
    indAllmuscleTorqueGroupsKnee(aa)=indStance;
    
end
stancePercentmuscleTorqueGroupsKnee=stance(indAllmuscleTorqueGroupsKnee);
stancePercentmuscleTorqueGroupsKnee2=array2table(stancePercentmuscleTorqueGroupsKnee, 'VariableNames', vars);

muscleTorqueGroupsKnee_mag_time=[muscleTorqueGroupsKnee_max2; stancePercentmuscleTorqueGroupsKnee2];

writetable(muscleTorqueGroupsKnee_mag_time, 'maxMuscleTorqueKnee_mag_time.xls');
writetable(array2table(muscleTorqueGroupsKnee,'VariableNames',vars), 'muscleTorqueGroupsKnee.xls');



%% Magnitude of peak hip muscle torque
muscleTorqueGroupsHip = getMuscleTorqueGroups(task, whichLeg, MuscleTorqueHip_BW);
muscleTorqueGroupsHip_max=max(abs(muscleTorqueGroupsHip));
muscleTorqueGroupsHip_max2=array2table(muscleTorqueGroupsHip_max,'VariableNames',vars);

% Timing of peak hip muscle torque (in terms of percent landing phase)
for aa=1:size(muscleTorqueGroupsHip, 2)
    indStance= 1;
    while abs(abs(muscleTorqueGroupsHip_max(aa))-abs(muscleTorqueGroupsHip(indStance,aa))) > 0.000000015
        indStance=indStance+1;
    end
    indAllmuscleTorqueGroupsHip(aa)=indStance;
    
end
stancePercentmuscleTorqueGroupsHip=stance(indAllmuscleTorqueGroupsHip);
stancePercentmuscleTorqueGroupsHip2=array2table(stancePercentmuscleTorqueGroupsHip, 'VariableNames', vars);

muscleTorqueGroupsHip_mag_time=[muscleTorqueGroupsHip_max2; stancePercentmuscleTorqueGroupsHip2];

writetable(muscleTorqueGroupsHip_mag_time, 'maxMuscleTorqueHip_mag_time.xls');
writetable(array2table(muscleTorqueGroupsHip, 'VariableNames',vars), 'muscleTorqueGroupsHip.xls');

%% Magnitude of peak Ankle muscle torque
muscleTorqueGroupsAnkle = getMuscleTorqueGroups(task, whichLeg, MuscleTorqueAnkle_BW);
muscleTorqueGroupsAnkle_max=max(abs(muscleTorqueGroupsAnkle));
muscleTorqueGroupsAnkle_max2=array2table(muscleTorqueGroupsAnkle_max,'VariableNames',vars);

% Timing of peak Ankle muscle torque (in terms of percent landing phase)
for aa=1:size(muscleTorqueGroupsAnkle, 2)
    indStance= 1;
    while abs(abs(muscleTorqueGroupsAnkle_max(aa))-abs(muscleTorqueGroupsAnkle(indStance,aa))) > 0.000000015
        indStance=indStance+1;
    end
    indAllmuscleTorqueGroupsAnkle(aa)=indStance;
    
end
stancePercentmuscleTorqueGroupsAnkle=stance(indAllmuscleTorqueGroupsAnkle);
stancePercentmuscleTorqueGroupsAnkle2=array2table(stancePercentmuscleTorqueGroupsAnkle, 'VariableNames', vars);

muscleTorqueGroupsAnkle_mag_time=[muscleTorqueGroupsAnkle_max2; stancePercentmuscleTorqueGroupsAnkle2];

writetable(muscleTorqueGroupsAnkle_mag_time, 'maxMuscleTorqueAnkle_mag_time.xls');
writetable(array2table(muscleTorqueGroupsAnkle,'VariableNames',vars), 'muscleTorqueGroupsAnkle.xls');

end
