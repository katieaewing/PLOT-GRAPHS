%% Created by: Katie Ewing 
% Modified: July 2015

% This function calculates the RMS of the residual moments (N-m). This
% value should be between 0-50 N-m.

%%
function [AllRMSTorques] = getRMStorques(task, MuscleTorque, MuscleTorqueHip, MuscleTorqueAnkle, IDfinal, whichLeg);

switch whichLeg
    case 'right'
        if task == 3 || task == 4 % for NON-DOMINANT LEG
            HipID=15;
            KneeID=18;
            AnkleID=19;
        else
            HipID=8;
            KneeID=11;
            AnkleID=12;
        end
        
    case 'left'
        if task == 3 || task == 4 % for NON-DOMINANT LEG
            HipID=8;
            KneeID=11;
            AnkleID=12;
        else
            HipID=15;
            KneeID=18;
            AnkleID=19;
        end
        
        
end

AllTorquesKnee=MuscleTorque(:,2:93); 
AllTorquesHip=MuscleTorqueHip(:,2:93); 
AllTorquesAnkle=MuscleTorqueAnkle(:,2:93); %units of N-m

SumTorquesHip=sum(AllTorquesHip,2);
SumTorquesKnee=sum(AllTorquesKnee,2);
SumTorquesAnkle=sum(AllTorquesAnkle,2);

HipTorqueID=table2array(IDfinal(:,HipID));
KneeTorqueID=table2array(IDfinal(:,KneeID));
AnkleTorqueID=table2array(IDfinal(:,AnkleID));

HipDiffID=HipTorqueID-SumTorquesHip;
KneeDiffID=KneeTorqueID-SumTorquesKnee;
AnkleDiffID=AnkleTorqueID-SumTorquesAnkle;

HipRMStorques=sqrt(mean(HipDiffID.^2));
KneeRMStorques=sqrt(mean(KneeDiffID.^2));
AnkleRMStorques=sqrt(mean(AnkleDiffID.^2));

AllRMSTorques=[HipRMStorques, KneeRMStorques, AnkleRMStorques];
AllRMSTorques=array2table(AllRMSTorques, 'VariableNames', {'Hip', 'Knee','Ankle'});

% save('AllVariables','RMStorques');

end
