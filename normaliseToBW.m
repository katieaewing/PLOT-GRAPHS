%% Created by: Katie Ewing 
% Modified: June 2015
%
% This function normalizes all force variables (i.e. GRF and muscle forces
% and joint torques) to body weight or mass.
%%

function [GRFfinal_BW, IDfinal_BW, MFfinal_BW] = normaliseToBW(subjectID, GRF_all, IDfinal, MFfinal, outGRF, outMF, outID)

mass=[66.2 73.2 55.6 66.2 71 60.7 55.9 71.1 75.6 71.4 80.2 80.6 85.2 58.4 66.8]; %total mass of each of the subjects. Need to double check

mass=mass(subjectID);

GRFfinal_BW=table2array(GRF_all(:, 2:13))./(mass*9.81);
GRFfinal_BW=[table2array(GRF_all(:,1)) GRFfinal_BW];
varGRF=[outGRF.labels(1:7) 'l_ground_force_vx' 'l_ground_force_vy'	'l_ground_force_vz'	'l_ground_force_px'	'l_ground_force_py'	'l_ground_force_pz'];
GRFfinal_BW=array2table(GRFfinal_BW, 'VariableNames',varGRF);
writetable(GRFfinal_BW, 'GRFfinal_BW.xls');

IDfinal_BW=table2array(IDfinal(:, 2:24))./(mass);
IDfinal_BW=[table2array(IDfinal(:,1)) IDfinal_BW];
IDfinal_BW=array2table(IDfinal_BW, 'VariableNames',outID.labels);
writetable(IDfinal_BW, 'IDfinal_BW.xls');

MFfinal_BW=table2array(MFfinal)./(mass*9.81);
MFfinal_BW=array2table(MFfinal_BW, 'VariableNames',outMF.labels);
writetable(MFfinal_BW,'MFfinal_BW.xls');

end

