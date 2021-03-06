%% Created by: Katie Ewing 
% Modified: June 2015

% This script can be run indepently from the mainScript_new.m
% Run this script for any of the sub-functions. 
% Uses variables previously saved in AllVariables.mat

%%
function [MuscleTorque, MuscleTorque_BW, MuscleTorqueHip, MuscleTorqueHip_BW, MuscleTorqueAnkle, MuscleTorqueAnkle_BW] = getMuscleTorques(subjectID, MAfinal, MAfinalHip, MAfinalAnkle, MFfinal)

% [MuscleTorque, MuscleTorque_BW] = getMuscleTorques(subjectID, MAfinalHip, MAfinalAnkle, MFfinal)

mass=[66.2 73.2 55.6 66.2 71 60.7 55.9 71.1 75.6 71.4 80.2 80.6 85.2 58.4 66.8]; %total mass of each of the subjects. Need to double check

% %Moment about KNEE
VarNamesMA=MAfinal.Properties.VariableNames;
MAfinal2=table2array(MAfinal);
MFfinal2=table2array(MFfinal);

for i=1:size(MAfinal2, 2)
    MuscleTorque(:,i)=MFfinal2(:,i).*MAfinal2(:,i);

end

MuscleTorque_BW=MuscleTorque./mass(subjectID);
MuscleTorque_BW=array2table(MuscleTorque_BW, 'VariableNames',VarNamesMA);
writetable(MuscleTorque_BW,'MuscleTorque_BW.xls');


%Moment about HIP
VarNamesMAHip=MAfinalHip.Properties.VariableNames;
MAfinalHip2=table2array(MAfinalHip);
MFfinal2=table2array(MFfinal);

for i=1:size(MAfinalHip2, 2)
    MuscleTorqueHip(:,i)=MFfinal2(:,i).*MAfinalHip2(:,i);

end

MuscleTorqueHip_BW=MuscleTorqueHip./mass(subjectID);
MuscleTorqueHip_BW=array2table(MuscleTorqueHip_BW, 'VariableNames',VarNamesMAHip);
writetable(MuscleTorqueHip_BW,'MuscleTorqueHip_BW.xls');

%Moment about ANKLE
VarNamesMAAnkle=MAfinalAnkle.Properties.VariableNames;
MAfinalAnkle2=table2array(MAfinalAnkle);

for i=1:size(MAfinalAnkle2, 2)
    MuscleTorqueAnkle(:,i)=MFfinal2(:,i).*MAfinalAnkle2(:,i);

end

MuscleTorqueAnkle_BW=MuscleTorqueAnkle./mass(subjectID);
MuscleTorqueAnkle_BW=array2table(MuscleTorqueAnkle_BW, 'VariableNames',VarNamesMAAnkle);
writetable(MuscleTorqueAnkle_BW,'MuscleTorqueAnkle_BW.xls');


end

