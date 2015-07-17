%% Created by: Katie Ewing 
% Modified: July 2015
%
% This function normalizes all variables to percent landing phase in 200
% increments.
%%

function [stance, GRF_all, GRF_Tor, IKfinal, IDfinal, MFfinal, MAfinal, MAfinalHip, MAfinalAnkle]= normalizeTime(task,tableIK, tableID, tableMF, tableMA, tableMAHip, tableMAAnkle, IK1, IK2, GRF1, GRF2, MF1, MF2, outGRF, outIK, outMF, outMA, outMAHip, outMAAnkle, outID, vGRF, OffIndIK, OffIndGRF, OffIndMF)

% [stance, MAfinalHip, MAfinalAnkle]= normalizeTime(tableIK,tableMAHip, tableMAAnkle, IK1, IK2, MF1, MF2, outMAHip, outMAAnkle)

%% (time)
stance=linspace(0,100,200); %define stance phase (0-100%, 200 points)
if task==7
    resamp_ts=linspace(tableIK.time(IK1), tableIK.time(OffIndIK), 200);
else
    resamp_ts=linspace(tableIK.time(IK1), tableIK.time(IK2), 200);  %size of the data
end

 %% (GRF data)
 if task ==7
     resamp_vGRF=[outGRF.data(GRF1:OffIndGRF, 1), vGRF(GRF1:OffIndGRF)]';
 else
     resamp_vGRF=[outGRF.data(GRF1:GRF2, 1), vGRF(GRF1:GRF2)]'; %must be in rows
 end
 
 vGRFfinal=resamp3(resamp_vGRF, resamp_ts); %not necessary unless just want vertical GRF

 if task ==7
     resamp_GRF=[outGRF.data(GRF1:OffIndGRF, 1), outGRF.data(GRF1:OffIndGRF, 2:13)]';
 else
    resamp_GRF=[outGRF.data(GRF1:GRF2, 1), outGRF.data(GRF1:GRF2, 2:13)]';
 end
 
for i=2:size(resamp_GRF, 1)
    hold=resamp3([resamp_GRF(1,:); resamp_GRF(i,:)], resamp_ts);
    GRF_all(:,1)=hold(1,:);
    GRF_all(:,i)=hold(2,:);
end

varGRF=[outGRF.labels(1:7) 'l_ground_force_vx' 'l_ground_force_vy'	'l_ground_force_vz'	'l_ground_force_px'	'l_ground_force_py'	'l_ground_force_pz'];

GRF_all=array2table(GRF_all, 'VariableNames', varGRF);

mkdir('..','TABLES');
cd('../TABLES');
writetable(GRF_all,'GRFfinal.xls');

%% GRF torques
if task==7
    resamp_GRF_Tor=[outGRF.data(GRF1:OffIndGRF, 1), outGRF.data(GRF1:OffIndGRF, 14:19)]';
else
    resamp_GRF_Tor=[outGRF.data(GRF1:GRF2, 1), outGRF.data(GRF1:GRF2, 14:19)]';
end

for i=2:size(resamp_GRF_Tor, 1)
    hold=resamp3([resamp_GRF_Tor(1,:); resamp_GRF_Tor(i,:)], resamp_ts);
    GRF_Tor(:,1)=hold(1,:);
    GRF_Tor(:,i)=hold(2,:);
end

varTorques={'time', 'ground_torque_x_r', 'ground_torque_y_r', 'ground_torque_z_r', 'ground_torque_x_l',...
    'ground_torque_y_l', 'ground_torque_z_l'};
GRF_Tor=array2table(GRF_Tor, 'VariableNames', varTorques);

%% (IK data)

if task ==7
    resamp_IK= tableIK(IK1:OffIndIK,:);
else
    resamp_IK= tableIK(IK1:IK2,:);
end


resamp_IK2= table2array(resamp_IK)';

for i=2:size(resamp_IK2, 1)  
        
    hold=resamp3([resamp_IK2(1,:); resamp_IK2(i,:)], resamp_ts);
    IK(:,1)=hold(1,:);
    IK(:,i)=hold(2,:);
end
IKfinal=array2table(IK, 'VariableNames', outIK.labels); %knee flexion angles are negative, extension angles are positive

writetable(IKfinal,'IKfinal.xls');

%(Angular velocity data)
% resamp_AV= tableAngVel(IK1:IK2,:);
% resamp_AV2= table2array(resamp_AV)';
% 
% for i=2:size(resamp_AV2, 1)  
%         
%     hold=resamp3([resamp_AV2(1,:); resamp_AV2(i,:)], resamp_ts);
%     AV(:,1)=hold(1,:);
%     AV(:,i)=hold(2,:);
% end
% AVfinal=array2table(AV, 'VariableNames', outIK.labels);



%% (ID data)
if task ==7
    resamp_ID= tableID(IK1:OffIndIK,:);
    else
    resamp_ID= tableID(IK1:IK2,:);
end

resamp_ID2= table2array(resamp_ID)';

for i=2:size(resamp_ID2, 1)
  
    hold=resamp3([resamp_ID2(1,:); resamp_ID2(i,:)], resamp_ts);
    ID(:,1)=hold(1,:);
    ID(:,i)=hold(2,:);
    
end
IDfinal=array2table(ID, 'VariableNames', outID.labels);

writetable(IDfinal,'IDfinal.xls');

%% (Muscle force data)

if task ==7
    resamp_MF= tableMF(MF1:OffIndMF,:);
else
    resamp_MF= tableMF(MF1:MF2,:);
end

resamp_MF2= table2array(resamp_MF)';

for i=2:size(resamp_MF2, 1)
  
    hold=resamp3([resamp_MF2(1,:); resamp_MF2(i,:)], resamp_ts);
   	MF(:,1)=hold(1,:);
    MF(:,i)=hold(2,:);
    
end
MFfinal=array2table(MF, 'VariableNames', outMF.labels);

writetable(MFfinal,'MFfinal.xls');

%% (Moment arm data KNEE)
if task==7
    resamp_MA= tableMA(MF1:OffIndMF,:);
else
    resamp_MA= tableMA(MF1:MF2,:);
end

resamp_MA2= table2array(resamp_MA)';

for i=2:size(resamp_MA2, 1)
  
    hold=resamp3([resamp_MA2(1,:); resamp_MA2(i,:)], resamp_ts);
   	MA(:,1)=hold(1,:);
    MA(:,i)=hold(2,:);
    
end
MAfinal=array2table(MA, 'VariableNames', outMA.labels);

writetable(MAfinal,'MAfinal.xls');


%% (Moment arm data HIP)

if task==7
    resamp_MAHip= tableMAHip(MF1:OffIndMF,:);
else
    resamp_MAHip= tableMAHip(MF1:MF2,:);
end

resamp_MAHip2= table2array(resamp_MAHip)';

for i=2:size(resamp_MAHip2, 1)
  
    hold=resamp3([resamp_MAHip2(1,:); resamp_MAHip2(i,:)], resamp_ts);
   	MAHip(:,1)=hold(1,:);
    MAHip(:,i)=hold(2,:);
    
end
MAfinalHip=array2table(MAHip, 'VariableNames', outMAHip.labels);

writetable(MAfinalHip,'MAfinalHip.xls');


%% (Moment arm data ANKLE)
if task==7
    resamp_MAAnkle= tableMAAnkle(MF1:OffIndMF,:);
else
    resamp_MAAnkle= tableMAAnkle(MF1:MF2,:);
end

resamp_MAAnkle2= table2array(resamp_MAAnkle)';

for i=2:size(resamp_MAAnkle2, 1)
  
    hold=resamp3([resamp_MAAnkle2(1,:); resamp_MAAnkle2(i,:)], resamp_ts);
   	MAAnkle(:,1)=hold(1,:);
    MAAnkle(:,i)=hold(2,:);
    
end
MAfinalAnkle=array2table(MAAnkle, 'VariableNames', outMAAnkle.labels);

writetable(MAfinalAnkle,'MAfinalAnkle.xls');

end

