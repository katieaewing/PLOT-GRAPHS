function createStructure(inputsubjectID,inputtrial, inputtask)

        
cd ../..
cd('AVERAGES')

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

subject=['Subject' num2str(inputsubjectID)];
trial=['Trial' num2str(inputtrial)];

AllData.(subject).(trial).IK=IKfinal;
AllData.(subject).(trial).GRF=GRFfinal;
AllData.(subject).(trial).ID=IDfinal;
AllData.(subject).(trial).MF=MFfinal;
AllData.(subject).(trial).FE=FEinputs;

for i=inputtrial
    AllData.(subject).

end