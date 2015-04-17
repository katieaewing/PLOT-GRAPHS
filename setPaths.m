% Set path names
function [DirTask,IKpath, GRFpath,IDpath,MFpath]=setPaths(freq,subjectID,brace,task, trial)
% function [DirTask,IKpath,EMGpath, GRFpath,IDpath,MFpath]=setPaths(freq,subjectID,brace,task, trial)

% Inputs:   freq = frequency of kinetic filter 
%                 i.e. freq=[15 20 30 40 50 60 80 100]
% 
%           subjectID = subject ID number
%
%           brace = brace condition
%                 1: NO BRACE, 2: BRACE
%                 
%           task = task number
%                 1: SL30, 2: SL60, 3: SLND30, 4: SLND60, 5: DL30, 6: DL60, 7: SJ
%                 i.e. [1:2] [5:6] processes SL30/60 and DL30/60
% 
%           trial = trial numbers in Vicon taken for analysis 
%                 i.e. trial=[2 3 4] for SJ_2, SJ_3, SJ_3

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

%Set directories
Dir=['C:\MyOpenSim4','\Subject_',int2str(subjectID)];
DirBrace=[Dir,'\BRACE'];
DirNoBrace=[Dir,'\NO BRACE'];

switch brace
    
    case 1
        DirTask=[DirNoBrace '\' task_label{task} '_' int2str(trial)];
        cd(DirTask);
        IKpath=strcat(task_label{task},'_',int2str(trial),'_IK_',int2str(freq),'Hz','.mot');
        GRFpath=strcat(task_label{task},'_',int2str(trial),'_kinetics_',int2str(freq),'Hz','.mot');
%         EMGpath=strcat(task_label{task},'_',int2str(trial),'_myEMG.mot');
        MFpath='BraceLandingStudy_StaticOptimization_force.sto';
        IDpath='inverse_dynamics.sto';
    
    case 2
        DirTask=[DirBrace '\' task_label{task} '_Brace_' int2str(trial)];
        cd(DirTask);
        IKpath=strcat(task_label{task},'_Brace_', int2str(trial),'_IK_',int2str(freq),'Hz','.mot');
        GRFpath=strcat(task_label{task},'_Brace_', int2str(trial),'_kinetics_',int2str(freq),'Hz','.mot');      
%         EMGpath=strcat(task_label{task},'_Brace_',int2str(trial),'_myEMG.mot');
        MFpath='BraceLandingStudy_StaticOptimization_force.sto';
        IDpath='inverse_dynamics.sto';
        
end


end 
    
    