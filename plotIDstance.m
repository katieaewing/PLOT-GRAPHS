function plotIDstance(tasks)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};
stance=linspace(0,100,200);
i=1;
for task=tasks
   
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
     
    AvgIDTemp=table2array(readtable(['SubAvg_' task_label{task} '_ID_BW.xls']));
    AvgID=AvgIDTemp(:,8);
        
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgIDBraceTemp=table2array(readtable(['SubAvg_' task_label{task} '_Brace_ID_BW.xls']));
    AvgIDBrace=AvgIDBraceTemp(:,8);
  
    subplot(1,2,i);
    plot(stance, AvgID, 'b','LineWidth',2);
    hold on;
    plot(stance, AvgIDBrace, 'r', 'LineWidth',2);
    title('60 CM');
    xlabel('Percent Landing Phase');
    ylabel('Knee Extension Moment (N-m/kg)');
%     hold off;
    set(legend({'No Brace', 'Brace'}), 'Location','Northwest');
        
    i=i+1;
    
    
end
   
end
