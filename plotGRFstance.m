function plotGRFstance(tasks)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};
stance=linspace(0,100,200);
i=1;
for task=tasks
   
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
     
    AvgGRFTemp=table2array(readtable(['SubAvg_' task_label{task} '_GRF_BW.xls']));
    AvgGRF=AvgGRFTemp(:,3);
        
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgGRFBraceTemp=table2array(readtable(['SubAvg_' task_label{task} '_Brace_GRF_BW.xls']));
    AvgGRFBrace=AvgGRFBraceTemp(:,3);
  
    subplot(1,2,i);
    plot(stance, AvgGRF, 'b','LineWidth',2);
    hold on;
    plot(stance, AvgGRFBrace, 'r', 'LineWidth',2);
    title('60 CM');
    xlabel('Percent Landing Phase');
    ylabel('Knee Extension Moment (N-m/kg)');
%     hold off;
    set(legend({'No Brace', 'Brace'}), 'Location','Northwest');
        
    i=i+1;
    
    
end
   
end
