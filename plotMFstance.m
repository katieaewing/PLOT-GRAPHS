function plotMFstance(task)


task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};
stance=linspace(0,100,200);

DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
cd([DirSubAvg '\' task_label{task}]);

AvgMFTemp=readtable(['SubAvg_' task_label{task} '_MF_BW.xls']);

        HAMS_MED=AvgMFTemp.semimem_r + AvgMFTemp.semiten_r;
        HAMS_LAT=AvgMFTemp.bifemlh_r + AvgMFTemp.bifemsh_r;
        REC_FEM=AvgMFTemp.rect_fem_r;
        VAS_MED=AvgMFTemp.vas_med_r;
        VAS_INT= AvgMFTemp.vas_int_r;
        VAS_LAT= AvgMFTemp.vas_lat_r;
        GAS_MED=AvgMFTemp.med_gas_r;
        GAS_LAT=AvgMFTemp.lat_gas_r;
        SOL=AvgMFTemp.soleus_r;
        
        AvgMF=[HAMS_MED HAMS_LAT REC_FEM VAS_MED VAS_INT VAS_LAT GAS_MED GAS_LAT SOL];

DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
cd([DirSubAvgBrace '\' task_label{task}]);

AvgMFBRACETemp=readtable(['SubAvg_' task_label{task} '_Brace_MF_BW.xls']);

        HAMS_MED_BRACE=AvgMFBRACETemp.semimem_r + AvgMFBRACETemp.semiten_r;
        HAMS_LAT_BRACE=AvgMFBRACETemp.bifemlh_r + AvgMFBRACETemp.bifemsh_r;
        REC_FEM_BRACE=AvgMFBRACETemp.rect_fem_r;
        VAS_MED_BRACE=AvgMFBRACETemp.vas_med_r;
        VAS_INT_BRACE= AvgMFBRACETemp.vas_int_r;
        VAS_LAT_BRACE= AvgMFBRACETemp.vas_lat_r;
        GAS_MED_BRACE=AvgMFBRACETemp.med_gas_r;
        GAS_LAT_BRACE=AvgMFBRACETemp.lat_gas_r;
        SOL_BRACE=AvgMFBRACETemp.soleus_r;
        
        AvgMFBrace=[HAMS_MED_BRACE HAMS_LAT_BRACE REC_FEM_BRACE VAS_MED_BRACE VAS_INT_BRACE VAS_LAT_BRACE GAS_MED_BRACE GAS_LAT_BRACE SOL_BRACE];

set(gcf,'DefaultAxesColorOrder',[0.25 1 0.25; 0 0 1; 0 0.5 0; 1 0 0; 0 0.75 0.75; 0.75 0 0.75; 0.75 0.75 0; 0.25 0.25 0.25; 1 0.6 0.6]);
subplot(1,2,1);
hold on;
% plot(stance,GRF_average, 'LineWidth', 1.5, 'Color', [0.25 0.25 0.25],'LineStyle','--');
plot(stance,AvgMF, 'LineWidth', 1.5);
title('NO BRACE');
xlabel('Percent Landing Phase');
ylabel('Muscle Force (B.W.)');

subplot(1,2,2);
set(gcf,'DefaultAxesColorOrder',[0.25 1 0.25; 0 0 1; 0 0.5 0; 1 0 0; 0 0.75 0.75; 0.75 0 0.75; 0.75 0.75 0; 0.25 0.25 0.25; 1 0.6 0.6]);
plot(stance,AvgMFBrace, 'LineWidth', 1.5);
set(legend({'HAMS MED', 'HAMS LAT', 'REC FEM', 'VAS MED', 'VAS INT', 'VAS LAT', 'GAS MED', 'GAS LAT', 'SOL'}), 'Location','Northwest');
title('BRACE');
xlabel('Percent Landing Phase');
ylabel('Muscle Force (B.W.)');

end

