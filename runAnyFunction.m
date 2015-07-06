%% Created by: Katie Ewing 
% Modified: June 2015

% This script can be run indepently from the mainScript_new.m
% Run this script for any of the sub-functions. 
% Uses variables previously saved in AllVariables.mat
%%

for subjectID=[1:15]
    
    brace = 1; % Set brace or no brace condition
    freq=20;
    
    % Save the trial numbers used for each task
    [myTable] = setCond(brace, subjectID);
    
    for task=[5 6] % or for all tasks, 1:length(myTable)
        
        for trial=myTable(task, 2:4)
            
            % Set paths
            if trial==0 %if a trial does not exist, go on to next task
                task=task + 1;
            else
                
                [DirTask]=setPaths(freq,subjectID,brace,task, trial);                
                cd([DirTask '\TABLES']);
                
                
                load MomentArms.mat %for getting muscle torques
                load AllVariables.mat;
                
                %  [FlexAtPeakGRF, FlexAtIC] = getFlexionAngles(GRFfinal_BW, IKfinal, outIK, GRFleg);
                %  [AngVel AngImp Power  Work] = getJointEnergetics(IKfinal, IDfinal_BW,
                %  IDfinal);
                % [PercentJointWork] = getWorkContribution(Work,subjectID);
                
                % [MF_BW_groups]=MFbyGroup(task, stance, whichLeg, MFfinal_BW);
                [MuscleTorqueHip, MuscleTorqueHip_BW, MuscleTorqueAnkle, MuscleTorqueAnkle_BW] = getMuscleTorques(subjectID, MAfinalHip, MAfinalAnkle, MFfinal);
                [AllRMSTorques] = getRMStorques(task, MuscleTorque, MuscleTorqueHip, MuscleTorqueAnkle, IDfinal, whichLeg);
                
                save AllVariables.mat;
                
            end
            
        end
        
    end
    
end
