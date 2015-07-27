%% Created by: Katie Ewing
%Modified: July 2015

% EMGplotspaper(1,1, 6)

%%
function EMGplotspaper(subjectID, brace, task)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

i=1;
switch brace
    case 1
        braceDir='NO BRACE';
        braceTrial='_';
    case 2
        braceDir='BRACE';
        braceTrial='_BRACE_';
end

trial=2;
Dir=['C:\MyOpenSim4\Subject_',int2str(subjectID) '\' braceDir '\' task_label{task} braceTrial int2str(trial) '\TABLES'];
cd(Dir);
        
load AllVariables.mat



figure(1)
% subplot(2,3,1)
% plot(stance, [EMGNormfinal.VasMed__Processed,EMGTKENormfinal.VasMed__Processed, MActvNormFinal.vas_med_r])

subplot(2,2,2)
% subplot(1,5,2)
plot(stance, [EMGTKENormfinal.VasLat__Processed, EMGNormfinal.VasLat__Processed,  MActvNormFinal.vas_lat_r])

subplot(2,2,3)
% subplot(1,5,3)
plot(stance, [EMGTKENormfinal.BicepsFem__Processed, EMGNormfinal.BicepsFem__Processed,MActvNormFinal.bifemlh_r])

trial=5;
Dir=['C:\MyOpenSim4\Subject_',int2str(subjectID) '\' braceDir '\' task_label{task} braceTrial int2str(trial) '\TABLES'];
cd(Dir);
        
load AllVariables.mat

subplot(2,2,1)
% subplot(1,5,1)
plot(stance, [EMGTKENormfinal.VasMed__Processed, EMGNormfinal.VasMed__Processed,MActvNormFinal.vas_med_r])

subplot(2,2,4)
% subplot(1,5,4)
plot(stance, [EMGTKENormfinal.Semitend__Processed, EMGNormfinal.Semitend__Processed,  MActvNormFinal.semiten_r])

% subplot(2,3,5)
% subplot(1,5,5)
% plot(stance, [EMGTKENormfinal.MedGastroc__Processed,EMGNormfinal.MedGastroc__Processed,  MActvNormFinal.med_gas_r])

 heading={'VAS MED', 'VAS LAT', 'BICEPS FEM', 'SEMITEND'};
   
    for i=1:4
        subplot(2,2,i)
        title(heading(i));
    end

    legend('TKE EMG', 'Filtered EMG', 'MA');
    ylabel('EMG and Model Muscle Activations (% Max)');
    xlabel('Percent landing phase');
end

