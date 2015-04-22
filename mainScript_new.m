%% Batch script for processing all trials
% By: Katie Ewing
% Modified: April 2015

% This script performs the following functions:
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
subjectID=1;
freq=20;

%% For testing all subjects, include FOR LOOP:

for subjectID=[1 2 3 4 5 6 7 8 9 10 11 12 13 14]

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
[DirTask,IKpath, GRFpath,IDpath,MFpath]=setPaths(freq,subjectID,brace,task, trial); %removed EMGpath
 
% Extract data
[tableIK, tableID, tableMF, outGRF, outIK, outMF, outID]=extractData(DirTask,IKpath, GRFpath, IDpath, MFpath); %removed EMGpath

% Define the landing phase
[KneeJoint, indIniIK, indMaxIK, indGRF, IniTime, EndTime, vGRF, whichLeg, GRFleg] = getLandingPhase(subjectID, outGRF, tableIK, task);

% Get the initial and final indices for GRF and MF
[iniIndMF, EndIndMF, iniIndGRF, EndIndGRF] = getIndicesLanding(indGRF,outGRF, tableMF, IniTime, EndTime);

%  Normalize time of vectors to landing phase
[stance, GRF_all, GRF_Tor, IKfinal, IDfinal, MFfinal]...
    =normalizeTime(tableIK, tableID, tableMF, indIniIK, indMaxIK, iniIndGRF, EndIndGRF, iniIndMF, EndIndMF, outGRF, outIK, outMF, outID, vGRF);

% Normalize data to Body Weight
[GRFfinal_BW, IDfinal_BW, MFfinal_BW] = normaliseToBW(subjectID, GRF_all, IDfinal, MFfinal, outGRF, outMF, outID);

% Get time and magnitude of peaks
[maxGRF_BW, stancePercentGRF, IKfinal_max2, stancePercentIK2, IDfinal_BW_max2, stancePercentID2, MFfinal_BW_max2, stancePercentMF2] ...
    = getMaxValues(stance, GRFfinal_BW, IKfinal, IDfinal_BW, MFfinal_BW, outGRF, outIK, outMF, outID, GRFleg, KneeJoint);

% Get maximum values of key variables
[MaxKeyVars] = keyMaxVariables(task, KneeJoint, whichLeg, maxGRF_BW, IKfinal_max2, MFfinal_BW_max2);

% Create inputs for FE knee model
[FE_inputs]=inputsFEmodel(task, KneeJoint, whichLeg, GRF_all, GRF_Tor, IKfinal, MFfinal);

save AllVariables.mat;
plotThisTrial; %plot all graphs for this trial to check if everything looks okay
close all;

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

plotGRFBar(tasks)



% for subjectID=[1 2 3 4 5 7 8 9 10]
% brace = 1;
% [myTable] = setCond(brace, subjectID);
% averageTrials(subjectID, brace, myTable);
% end


