function [stance, GRF_all, GRF_Tor, IKfinal, IDfinal, MFfinal]= normalizeTime(tableIK, tableID, tableMF, IK1, IK2, GRF1, GRF2, MF1, MF2, outGRF, outIK, outMF, outID, vGRF)

%(time)
stance=linspace(0,100,200); %define stance phase (0-100%, 200 points)
resamp_ts=linspace(tableIK.time(IK1), tableIK.time(IK2), 200);  %size of the data

 %(GRF data)
resamp_vGRF=[outGRF.data(GRF1:GRF2, 1), vGRF(GRF1:GRF2)]'; %must be in rows
vGRFfinal=resamp3(resamp_vGRF, resamp_ts); %not necessary unless just want vertical GRF

resamp_GRF=[outGRF.data(GRF1:GRF2, 1), outGRF.data(GRF1:GRF2, 2:13)]';

for i=2:size(resamp_GRF, 1)
    hold=resamp3([resamp_GRF(1,:); resamp_GRF(i,:)], resamp_ts);
    GRF_all(:,1)=hold(1,:);
    GRF_all(:,i)=hold(2,:);
end

varGRF=[outGRF.labels(1:7) 'l_ground_force_vx' 'l_ground_force_vy'	'l_ground_force_vz'	'l_ground_force_px'	'l_ground_force_py'	'l_ground_force_pz'];

GRF_all=array2table(GRF_all, 'VariableNames', varGRF);

% xlswrite('GRFfinal.xls',GRFfinal);

resamp_GRF_Tor=[outGRF.data(GRF1:GRF2, 1), outGRF.data(GRF1:GRF2, 14:19)]';

for i=2:size(resamp_GRF_Tor, 1)
    hold=resamp3([resamp_GRF_Tor(1,:); resamp_GRF_Tor(i,:)], resamp_ts);
    GRF_Tor(:,1)=hold(1,:);
    GRF_Tor(:,i)=hold(2,:);
end

varTorques={'time', 'ground_torque_x_r', 'ground_torque_y_r', 'ground_torque_z_r', 'ground_torque_x_l',...
    'ground_torque_y_l', 'ground_torque_z_l'};
GRF_Tor=array2table(GRF_Tor, 'VariableNames', varTorques);

%(IK data)
resamp_IK= tableIK(IK1:IK2,:);
resamp_IK2= table2array(resamp_IK)';

for i=2:size(resamp_IK2, 1)  
        
    hold=resamp3([resamp_IK2(1,:); resamp_IK2(i,:)], resamp_ts);
    IK(:,1)=hold(1,:);
    IK(:,i)=hold(2,:);
end
IKfinal=array2table(IK, 'VariableNames', outIK.labels); %knee flexion angles are negative, extension angles are positive

mkdir('..','TABLES');
cd('../TABLES');
writetable(IKfinal,'IKfinal.xls');

%(ID data)
resamp_ID= tableID(IK1:IK2,:);
resamp_ID2= table2array(resamp_ID)';

for i=2:size(resamp_ID2, 1)
  
    hold=resamp3([resamp_ID2(1,:); resamp_ID2(i,:)], resamp_ts);
    ID(:,1)=hold(1,:);
    ID(:,i)=hold(2,:);
    
end
IDfinal=array2table(ID, 'VariableNames', outID.labels);

% writetable(IDfinal,'IDfinal.xls');

%(Muscle force data)
resamp_MF= tableMF(MF1:MF2,:);
resamp_MF2= table2array(resamp_MF)';

for i=2:size(resamp_MF2, 1)
  
    hold=resamp3([resamp_MF2(1,:); resamp_MF2(i,:)], resamp_ts);
   	MF(:,1)=hold(1,:);
    MF(:,i)=hold(2,:);
    
end
MFfinal=array2table(MF, 'VariableNames', outMF.labels);

% writetable(MFfinal,'MFfinal.xls');

end

