%% Created by: Katie Ewing 
% Modified: May 2015
% 
% This function calls the function, prepareStatsTable2, to extract multiple
% conditions and tasks and put them into one table that can be imported
% into a statistical software package.
%
% Input: whichSubjects = which subjects to average e.g. [1:14]
%        tasks = which tasks e.g. for comparing DL30 and DL60 with and
%        without a brace
% 
% Ouput: statsTableMag = structure with the magnitudes of all fields (e.g.
%        knee flexion angles at three time points, GRF data, IK data, etc.)
%        with each subject in a different row, and repeated in the same
%        columns for all the extracted conditions
%        statsTableMag = structure with the time of the magnitudes of all
%        the fields (does not include three knee flexion angles field)
% 
% Example: [statsTableMag, statsTableTime] = finalStats([1:15], [5 6])
%          [statsTableMag, statsTableTime] = finalStats([1:15], [1:4])

%%
function [statsTableMag, statsTableTime] = finalStats(whichSubjects, tasks)

for brace=[1:2]
    
    for task=tasks
    
        [statsTempMag, statsTempTime, fieldNames, AllSubjects] = prepareStatsTable2(whichSubjects, brace, task);
        
        if task==5 && brace == 1  %CHANGE!!  for the first condition (DL30), create empty table.
                statsTableMag=[];
                
                statsTableMag=setfield(statsTableMag,{1}, 'ROM', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'FlexAtIC', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'FlexAtPeakGRF', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'FLEX', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'Work', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'AngImp', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'PercentJointWork', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'MaxGRF', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'MaxID', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'MaxIK', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'MaxMF', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'MaxMFGroup', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'MaxPower', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'MaxAngVel', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'MaxMuscleTorqueGroupHip', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'MaxMuscleTorqueGroupKnee', []);
%                 statsTableMag=setfield(statsTableMag,{1}, 'MaxMuscleTorqueGroupAnkle', []);
%                 
                statsTableTime=[];
%                 statsTableTime=setfield(statsTableTime,{1}, 'MaxGRF', []);
%                 statsTableTime=setfield(statsTableTime,{1}, 'MaxID', []);
%                 statsTableTime=setfield(statsTableTime,{1}, 'MaxIK', []);
%                 statsTableTime=setfield(statsTableTime,{1}, 'MaxMF', []);
%                 statsTableTime=setfield(statsTableTime,{1}, 'MaxMFGroup', []);
%                 statsTableTime=setfield(statsTableTime,{1}, 'MaxPower', []);
%                 statsTableTime=setfield(statsTableTime,{1}, 'MaxAngVel', []);
%                 statsTableTime=setfield(statsTableTime,{1}, 'MaxMuscleTorqueGroupHip', []);
%                 statsTableTime=setfield(statsTableTime,{1}, 'MaxMuscleTorqueGroupKnee', []);
%                 statsTableTime=setfield(statsTableTime,{1}, 'MaxMuscleTorqueGroupAnkle', []);
           
        end
        
        
        for a=1:length(fieldNames)
               
            statsTableMag.(char(fieldNames(a)))=[[statsTableMag.(char(fieldNames(a)))];[statsTempMag.(char(fieldNames(a)))]];             
            
            if a>6
                statsTableTime.(char(fieldNames(a)))=[[statsTableTime.(char(fieldNames(a)))];[statsTempTime.(char(fieldNames(a)))]];
            end
            
        end
    
    end

 
end

%put the column headings back in the structure and transform to tables
for a=1:length(fieldNames)
    vars=AllSubjects(4).(char(fieldNames(a))).Properties.VariableNames; 
    statsTableMag.(char(fieldNames(a)))=array2table(statsTableMag.(char(fieldNames(a))), 'VariableNames',vars);         
end

fieldNames = {'ROM'};
% fieldNames = {'ROM','MaxGRF', 'MaxID', 'MaxIK', 'MaxMF', 'MaxMFGroup', 'MaxPower','MaxAngVel', 'MaxMuscleTorqueGroupHip', 'MaxMuscleTorqueGroupKnee', 'MaxMuscleTorqueGroupAnkle'};
% 
% for a=1:length(fieldNames)
%     vars=AllSubjects(4).(char(fieldNames(a))).Properties.VariableNames;  %NOTE: MUST CHANGE THE AllSubjects(X) DEPENDING ON WHAT TASKS THE SUBJECT COMPLETED.
%     statsTableTime.(char(fieldNames(a)))=array2table(statsTableTime.(char(fieldNames(a))), 'VariableNames',vars); 
% end

clear fieldNames;

cd('C:\MyOpenSim4');
save('statsTable_ROM_DL.mat');

end


