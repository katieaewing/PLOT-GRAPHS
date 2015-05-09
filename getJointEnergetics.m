function [AngVel AngImp Power  Work] = getJointEnergetics(IKfinal, IDfinal_BW, IDfinal)

% load AllVariables.mat;

VarNames=IKfinal.Properties.VariableNames;
IKfinal=table2array(IKfinal);  %don't take absolute value yet!
% IKfinal(:,11)=abs(IKfinal(:,11)); %opposite sign for right knee? no
% IKfinal(:,18)=abs(IKfinal(:,18)); %opposite sign for left knee? no

[Q,dQ,ddQ]=smooth_Q(IKfinal', 10); % not sure about this filter frequency but seems to best match with kinematics results from OpenSim

Q=deg2rad(Q'); %rad
dQ=deg2rad(dQ'); %rad/s
ddQ=deg2rad(ddQ'); %rad/s^2

AngVel=array2table(dQ, 'VariableNames', VarNames);

IDfinal_BW=table2array(IDfinal_BW);  %moments normalized to mass


%Joint power (W/kg)
i=1;
while i <= size(IDfinal_BW,2)
Temp=IDfinal_BW(:,i).*dQ(:,i);
Power(:,i)=Temp;
i=i+1;
end

IDfinal=table2array(IDfinal); %not sure if needed

totalTime=IKfinal(200,1)-IKfinal(1,1);
time=linspace(0,totalTime,200);
%Joint angular impulse
% figure
% plot(stance,IDfinal(:,11));
j=1;
while j <= size(IDfinal_BW,2)
Temp2=trapz(time,IDfinal_BW(:,j));  %normalized to mass or not??? 
AngImp(:,j)=Temp2;
j=j+1;
end
AngImp=array2table(AngImp,'VariableNames', VarNames);


%Joint work
j=1;
while j <= size(IDfinal_BW,2)
Temp3=trapz(time,Power(:,j));
Work(:,j)=Temp3;
j=j+1;
end

Work=array2table(Work, 'VariableNames', VarNames);
writetable(Work, 'Work.xls');
Power=array2table(Power, 'VariableNames', VarNames);
writetable(Power, 'Power.xls');

writetable(AngVel, 'AngVel.xls');
writetable(AngImp, 'AngImp.xls');

end


% 
% plot(IDfinal_BW.ankle_angle_r_moment)
% figure(2); plot(IDfinal_BW.knee_angle_r_moment)
% figure(3); plot(IDfinal_BW.hip_flexion_r_moment)
% 
% plot(Power.ankle_angle_r)
% figure(2); plot(Power.knee_angle_r)
% figure(3); plot(Power.hip_flexion_r)


