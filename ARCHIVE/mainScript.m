%% Batch script for running everything

% test variables
inputfreq=20;
inputsubjectID=1;
inputbrace=1;
inputtask=1;
inputtrial=2;
domLeg='right';
% trials=[1 4 5];


%new test variables:
brace=1;
subjectID=1;
freq=20;

%% Set brace or no brace condition
[table] = setCond(brace, subjectID);

%% Set paths
[DirTask,IKpath,EMGpath, GRFpath,IDpath,MFpath]=setPaths(inputfreq,subjectID,brace,inputtask,inputtrial);

%% Extract data
[tableIK, tableID, tableMF, outGRF, outIK, outMF, outID, outEMG]=extractData(DirTask,IKpath, EMGpath, GRFpath, IDpath, MFpath);

%% Define the landing phase
[KneeJoint, indIniIK, indMaxIK, indGRF, IniTime, EndTime, vGRF] = getLandingPhase(subjectID, outGRF, tableIK);

%% Get the other indices for GRF and MF
[iniIndMF, EndIndMF, iniIndGRF, EndIndGRF] = getIndicesLanding(indGRF,outGRF, tableMF, IniTime, EndTime);

%% Normalize time of vectors
[stance, GRFfinal, GRF_Tor, IKfinal, IDfinal, MFfinal]...
    =normalizeTime(tableIK, tableID, tableMF, indIniIK, indMaxIK, iniIndGRF, EndIndGRF, iniIndMF, EndIndMF, outGRF, outIK, outMF, outID, vGRF);

%% Normalize data to Body Weight
[GRFfinal_BW, IDfinal_BW, MFfinal_BW] = normaliseToBW(inputsubjectID, GRFfinal, IDfinal, MFfinal, outMF, outID);

%% Get time and magnitude of peaks
[maxGRF_BW, stancePercentGRF, IKfinal_max2, stancePercentIK2, IDfinal_BW_max2, stancePercentID2, MFfinal_BW_max2, stancePercentMF2] ...
    = getMaxValues(stance, GRFfinal_BW, IKfinal, IDfinal_BW, MFfinal_BW, outIK, outMF, outID);


%% Inputs for FE knee model
[MaxVars]=keyVariables(DirTask, KneeJoint, domLeg, GRFfinal_BW, GRF_Tor, IKfinal, MFfinal_BW, maxGRF_BW, stancePercentGRF, IKfinal_max2, MFfinal_BW_max2);

%% Max values
[FE_inputs]=inputsFEmodel(DirTask, KneeJoint, domLeg, GRFfinal, GRF_Tor, IKfinal, MFfinal);

% Create structure in order to calculate averages for trials

[FECombined FEInputsAverage] = averageFE(inputsubjectID, inputtask, trials, inputbrace);
[VarsCombined VarsAverage] = averageVars(inputsubjectID, inputtask, trials, inputbrace);

%% Plots









