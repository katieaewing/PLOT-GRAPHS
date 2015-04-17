function plotThreeFlex(tasks)

% stance=
task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

%plot of knee flexion angle over the landing phase

i=1;
for task=tasks
   
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
     
    AvgFlex=table2array(readtable(['SubAvg_' task_label{task} '_FLEX.xls']));
    StdFlex=table2array(readtable(['SubStd_' task_label{task} '_FLEX.xls'])); 
        
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgFlexBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_FLEX.xls']));
    StdFlexBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_FLEX.xls'])); 
    
    subplot(2,1,i);
    errorbar(AvgFlex,StdFlex, '-bo');
    hold on;
    errorbar(AvgFlexBrace,StdFlexBrace, ':rx');
    title('Differences in Knee Flexion Angles with and without Brace');
    timePoints={'Initial Contact', 'Peak GRF', 'Maximum Knee Flexion'};
    set(gca, 'XTick', 1:3, 'XTickLabel',timePoints);
    ylabel('Knee Flexion Angles (degrees)');
%     hold off;
    set(legend({'No Brace', 'Brace'}), 'Location','Northwest');
    
        
    i=i+1;
    
    
end

    
   
    
   
end
