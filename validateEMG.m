function [outEMG, EMGfinal, EMGNormfinal, MActvFinal, MActvNormFinal, EMGTKEfinal,EMGTKENormfinal] =validateEMG(brace,task, trial, subjectID, indIniIK, indMaxIK, iniIndGRF, EndIndGRF, iniIndMF, EndIndMF, tableIK)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

Dir=['C:\MyOpenSim4','\Subject_',int2str(subjectID)];
DirBrace=[Dir,'\BRACE'];
DirNoBrace=[Dir,'\NO BRACE'];

MActvpath='BraceLandingStudy_StaticOptimization_activation.sto';


switch brace
    
    case 1
        EMGpath=strcat(task_label{task},'_',int2str(trial),'_myEMGFiltered20-15.mot');
        EMGpathTKE=strcat(task_label{task},'_',int2str(trial),'_myEMG.mot');
        DirTask=[DirNoBrace '\' task_label{task} '_' int2str(trial)];
        cd(DirTask);
    case 2
        EMGpath=strcat(task_label{task},'_Brace_',int2str(trial),'_myEMGFiltered20-15.mot');
        EMGpathTKE=strcat(task_label{task},'_Brace_',int2str(trial),'_myEMG.mot');
        DirTask=[DirBrace '\' task_label{task} '_Brace_' int2str(trial)];
        cd(DirTask);
 end

if exist(EMGpath, 'file') ==2
    [outEMG]=extractMotFile('FILE',EMGpath,'plot',-1);
    [outEMGTKE]=extractMotFile('FILE',EMGpathTKE,'plot',-1);
end

DirSO=[DirTask '\SO_Results_6Hz_x2_FoM'];
cd(DirSO);
[outMActv]= extractMotFile('FILE',MActvpath,'plot',-1);
tableMActv=array2table(outMActv.data, 'VariableNames', outMActv.labels);


resamp_ts=linspace(tableIK.time(indIniIK), tableIK.time(indMaxIK), 200);

resamp_EMG=[outEMG.data(iniIndGRF:EndIndGRF,:)]';
for i=2:size(resamp_EMG, 1)
    hold=resamp3([resamp_EMG(1,:); resamp_EMG(i,:)], resamp_ts);
    EMGnew(:,1)=hold(1,:);
    EMGnew(:,i)=hold(2,:);
    EMGNorm(:,i)=EMGnew(:,i)/max(EMGnew(:,i));
end

EMGfinal=array2table(EMGnew, 'VariableNames', outEMG.labels);
EMGNormfinal=array2table(EMGNorm, 'VariableNames', outEMG.labels);


resamp_EMGTKE=[outEMGTKE.data(iniIndGRF:EndIndGRF,:)]';
for i=2:size(resamp_EMGTKE, 1)
    hold=resamp3([resamp_EMGTKE(1,:); resamp_EMGTKE(i,:)], resamp_ts);
    EMGTKEnew(:,1)=hold(1,:);
    EMGTKEnew(:,i)=hold(2,:);
    EMGTKENorm(:,i)=EMGTKEnew(:,i)/max(EMGTKEnew(:,i));
end

EMGTKEfinal=array2table(EMGTKEnew, 'VariableNames', outEMG.labels);
EMGTKENormfinal=array2table(EMGTKENorm, 'VariableNames', outEMG.labels);




resamp_MActv=[outMActv.data(iniIndMF:EndIndMF,:)]';
for i=2:size(resamp_MActv, 1)
    hold=resamp3([resamp_MActv(1,:); resamp_MActv(i,:)], resamp_ts);
    MActvnew(:,1)=hold(1,:);
    MActvnew(:,i)=hold(2,:);
    MActvNorm(:,i)=MActvnew(:,i)/max(MActvnew(:,i));
end

MActvFinal=array2table(MActvnew, 'VariableNames', outMActv.labels);
MActvNormFinal=array2table(MActvNorm, 'VariableNames', outMActv.labels);


% GroupsEMG=(EMGfinal.VasLat__Processed + EMGfinal.VasMed__Processed)/(max(EMGfinal.VasLat__Processed + EMGfinal.VasMed__Processed));
% GroupsMActv=(MActvFinal.vas_lat_r + MActvFinal.vas_med_r)/(max(MActvFinal.vas_lat_r + MActvFinal.vas_med_r));

end
