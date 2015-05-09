for subjectID=[1:14]

brace = 2; % Set brace or no brace condition
freq=20;

% Save the trial numbers used for each task    
[myTable] = setCond(brace, subjectID);

for task=[5 6] % or for all tasks, 1:length(myTable)

for trial=myTable(task, 2:4)
        
% Set paths     
if trial==0 %if a trial does not exist, go on to next task
    task=task + 1;
else
    
 [DirTask,IKpath, GRFpath,IDpath,MFpath]=setPaths(freq,subjectID,brace,task, trial); %removed EMGpath

 cd([DirTask '\TABLES']);

 load AllVariables.mat;
 
 [AngVel AngImp Power  Work] = getJointEnergetics(IKfinal, IDfinal_BW, IDfinal);
 
  [Power_max, StancePercentPower2, AngVel_max, StancePercentAngVel2] ...
    = getMaxValues2(stance, AngVel, Power);

save AllVariables.mat;


end

end

end

end