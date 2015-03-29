%% Batch script for running everything
% Katie Ewing
% Modi

% test variables
% freq=20;
% subjectID=1;
% brace=1;
% inputtask=1;
% inputtrial=[2 3 5];
% domLeg='right';
% trials=[1 4 5];

%% 
%new test variables:
brace=1;
subjectID=8;
freq=20;

% Set brace or no brace condition
[myTable] = setCond(brace, subjectID);


for task=1:length(myTable)
    for trial=myTable(task, 2:4)
% Set paths     
        if trial==0
            task=task + 1;
        else
        [DirTask,IKpath, GRFpath,IDpath,MFpath]=setPaths(freq,subjectID,brace,task, trial); %removed EMGpath
 

% Extract data
[tableIK, tableID, tableMF, outGRF, outIK, outMF, outID]=extractData(DirTask,IKpath, GRFpath, IDpath, MFpath); %removed EMGpath


% Define the landing phase
[KneeJoint, indIniIK, indMaxIK, indGRF, IniTime, EndTime, vGRF, whichLeg] = getLandingPhase(subjectID, outGRF, tableIK, task);


% Get the other indices for GRF and MF
[iniIndMF, EndIndMF, iniIndGRF, EndIndGRF] = getIndicesLanding(indGRF,outGRF, tableMF, IniTime, EndTime);

%  Normalize time of vectors
[stance, GRF_all, GRF_Tor, IKfinal, IDfinal, MFfinal]...
    =normalizeTime(tableIK, tableID, tableMF, indIniIK, indMaxIK, iniIndGRF, EndIndGRF, iniIndMF, EndIndMF, outGRF, outIK, outMF, outID, vGRF);


% Normalize data to Body Weight
[GRFfinal_BW, IDfinal_BW, MFfinal_BW] = normaliseToBW(subjectID, GRF_all, IDfinal, MFfinal, outGRF, outMF, outID);

% Get time and magnitude of peaks
[maxGRF_BW, stancePercentGRF, IKfinal_max2, stancePercentIK2, IDfinal_BW_max2, stancePercentID2, MFfinal_BW_max2, stancePercentMF2] ...
    = getMaxValues(stance, GRFfinal_BW, IKfinal, IDfinal_BW, MFfinal_BW, outGRF, outIK, outMF, outID);


% Maximum values of key variables
[MaxKeyVars] = keyMaxVariables(task, KneeJoint, whichLeg, maxGRF_BW, IKfinal_max2, MFfinal_BW_max2);

% Inputs for FE knee model

[FE_inputs]=inputsFEmodel(task, KneeJoint, whichLeg, GRF_all, GRF_Tor, IKfinal, MFfinal);

       end
    end
end







%% Averages of TRIALS
averageTrials(subjectID, brace, myTable)

%% Averages of SUBJECTS
averageSubjects(whichSubjects, brace)

%% Plots






