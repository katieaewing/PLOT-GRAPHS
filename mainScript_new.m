%% Batch script for processing all trials
% Created by: Katie Ewing
% Modified: June 2015

% This script performs the following tasks by calling separate functions:
% 1) Extracts all results from inverse kinematics, inverse dynamics, and
% static optimization
% 2) Normalizes time to percent landing phase
% 3) Normalizes kinetic data to B.W. or mass
% 4) Obtains the maximum value of each variable and the time at which the
% max occurs
% 5) Generates the input data for the finite element knee model
% 6) Averages the three trials of a task per subject
% 7) Averages data across all subjects
% 8) Plots different graphs


%% 
clear all

%Input the brace condition (1: NO BRACE; 2: BRACE) and the subject ID
%number(s).

%For testing ONE subject:
brace=1;
subjectID=15;
freq=20;

%% For testing all subjects, include FOR LOOP:

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
            
% Set path names
[DirTask,IKpath, GRFpath,IDpath,MFpath, MApath, MApathHipFlex, MApathAnkleFlex]=setPaths(freq,subjectID,brace,task, trial);

% Extract data
[tableIK, tableID, tableMF, tableMA, tableMAHip, tableMAAnkle, outGRF, outIK, outMF, outID, outMA, outMAHip, outMAAnkle] = extractData(DirTask, IKpath, GRFpath, IDpath, MFpath, MApath, MApathHipFlex, MApathAnkleFlex);

% Define the landing phase
[KneeJoint, indIniIK, indMaxIK, indGRF, IniTime, EndTime, vGRF, whichLeg, GRFleg] = getLandingPhase(subjectID, outGRF, tableIK, task);

% Get the initial and final indices for GRF and MF
[iniIndMF, EndIndMF, iniIndGRF, EndIndGRF] = getIndicesLanding(indGRF,outGRF, tableMF, IniTime, EndTime);

% Normalize time of vectors to landing phase
[stance, GRF_all, GRF_Tor, IKfinal, IDfinal, MFfinal, MAfinal, MAfinalHip, MAfinalAnkle]...
    =normalizeTime(tableIK, tableID, tableMF, tableMA, tableMAHip, tableMAAnkle, indIniIK, indMaxIK, iniIndGRF, EndIndGRF, iniIndMF, EndIndMF, outGRF, outIK, outMF, outMA, outMAHip, outMAAnkle, outID, vGRF);

% Normalize data to Body Weight
[GRFfinal_BW, IDfinal_BW, MFfinal_BW] = normaliseToBW(subjectID, GRF_all, IDfinal, MFfinal, outGRF, outMF, outID);

%Calculate angular velocity and joint power (in radians)
 [AngVel, AngImp, Power, Work] = getJointEnergetics(IKfinal, IDfinal_BW, IDfinal);

 %Calculate contribution of each joint to total work
 [PercentJointWork] = getWorkContribution(Work,subjectID);
 
% Get time and magnitude of peaks
 [maxGRF_BW, stancePercentGRF, IKfinal_max2, stancePercentIK2, IDfinal_BW_max2, stancePercentID2, MFfinal_BW_max2, stancePercentMF2,Power_max, StancePercentPower2, AngVel_max, StancePercentAngVel2] ...
    = getMaxValues(stance, GRFfinal_BW, IKfinal, IDfinal_BW, MFfinal_BW, outGRF, outIK, outMF, outID, GRFleg, KneeJoint, AngVel, Power);

% Get flexion angles at peak GRF and at initial contact
[FlexAtPeakGRF, FlexAtIC] = getFlexionAngles(GRFfinal_BW, IKfinal, outIK, GRFleg);

% Get maximum values of key variables
[MaxKeyVars] = keyMaxVariables(task, KneeJoint, whichLeg, maxGRF_BW, IKfinal_max2, MFfinal_BW_max2);

% Create inputs for FE knee model
[FE_inputs]=inputsFEmodel(task, KneeJoint, whichLeg, GRF_all, GRF_Tor, IKfinal, MFfinal);

% [MuscleTorqueHip, MuscleTorqueHip_BW, MuscleTorqueAnkle, MuscleTorqueAnkle_BW] = getMuscleTorques(subjectID, MAfinalHip, MAfinalAnkle, MFfinal);

save AllVariables.mat;

% plotThisTrial2; %plot all graphs for this trial to check if everything looks okay

close all;

        end
    end
end

end

%% Averages of TRIALS for an individual subject
averageTrials(subjectID, brace, myTable)

clear all

end

%% Averages of SUBJECTS
averageSubjects(whichSubjects, brace)

%% Plots
plotThreeFlex(tasks)

plotGRFBar2(tasks)



%% For just averaging the trials without running everything above
for subjectID=[1:15]
brace = 2;
[myTable] = setCond(brace, subjectID);
averageTrials(subjectID, brace, myTable);
end

%%
