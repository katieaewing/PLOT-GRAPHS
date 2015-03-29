function createStructure(inputsubjectID,inputtrial, inputtask)

cd ../..
task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};
mkdir(task_label{inputtask})
subject=['Subject' num2str(inputsubjectID)];
trial=['Trial' num2str(inputtrial)];

AllData.(subject).(trial).IK=IKfinal;
AllData.(subject).(trial).GRF=GRFfinal;
AllData.(subject).(trial).ID=IDfinal;
AllData.(subject).(trial).MF=MFfinal;
end