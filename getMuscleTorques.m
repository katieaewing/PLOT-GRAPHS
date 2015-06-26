%% Created by: Katie Ewing 
% Modified: June 2015

% This script can be run indepently from the mainScript_new.m
% Run this script for any of the sub-functions. 
% Uses variables previously saved in AllVariables.mat

%%
function [MuscleTorque, MuscleTorque_BW] = getMuscleTorques(subjectID, MAfinal, MFfinal)

mass=[66.2 73.2 55.6 66.2 71 60.7 55.9 71.1 75.6 71.4 80.2 80.6 85.2 58.4 66.8]; %total mass of each of the subjects. Need to double check

%Moment about knee
VarNamesMA=MAfinal.Properties.VariableNames;
MAfinal2=table2array(MAfinal);
MFfinal2=table2array(MFfinal);

for i=1:size(MAfinal2, 2)
    MuscleTorque(:,i)=MFfinal2(:,i).*MAfinal2(:,i);

end

MuscleTorque_BW=MuscleTorque./mass(subjectID);
MuscleTorque_BW=array2table(MuscleTorque_BW, 'VariableNames',VarNamesMA);
writetable(MuscleTorque_BW,'MuscleTorque_BW.xls');

end
