function plotIKstance(tasks)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};
stance=linspace(0,100,200);
i=1;
for task=tasks
   
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
     
    AvgIKTemp=table2array(readtable(['SubAvg_' task_label{task} '_IK.xls']));
    AvgIK=abs(AvgIKTemp(:,8));
        
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgIKBraceTemp=table2array(readtable(['SubAvg_' task_label{task} '_Brace_IK.xls']));
    AvgIKBrace=abs(AvgIKBraceTemp(:,8));
  
  


    subplot(1,2,i);
    plot(stance, AvgIK, 'b','LineWidth',2);
    title('30 CM');
    hold on;
    plot(stance, AvgIKBrace, 'r', 'LineWidth',2);
    title('60 CM');
    xlabel('Percent Landing Phase');
    ylabel('Knee Flexion Angles (degrees)');
%     hold off;
    set(legend({'No Brace', 'Brace'}), 'Location','Northwest');
        
    i=i+1;
    
    
end
   
end
