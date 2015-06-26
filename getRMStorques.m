%% Created by: Katie Ewing 
% Modified: June 2015

% This function calculates the RMS of the residual moments (N-m). This
% value should be between 0-50 N-m.

%%
function [RMStorques] = getRMStorques(MuscleTorque, IDfinal)

AllTorques=MuscleTorque(:,2:93); %units of N-m

SumTorques=sum(AllTorques,2);
KneeTorqueID=table2array(IDfinal(:,11));

DiffID=KneeTorqueID-SumTorques;

RMStorques=sqrt(mean(DiffID.^2));

% save('AllVariables','RMStorques');

end
