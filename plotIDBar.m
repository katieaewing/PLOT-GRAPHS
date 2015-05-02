function plotIDBar(tasks)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

i=1;
for task=tasks
   
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
    
    %Anterior-Posterior ID
    AvgIDMaxTemp=table2array(readtable(['SubAvg_' task_label{task} '_MaxID.xls']));
    AvgIDMax(i)=AvgIDMaxTemp(1,12);
    
    StdIDMaxTemp=table2array(readtable(['SubStd_' task_label{task} '_MaxID.xls'])); 
    StdIDMax(i)=StdIDMaxTemp(1,12)/sqrt(14);    
    
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgIDBraceMaxTemp=table2array(readtable(['SubAvg_' task_label{task} '_Brace_MaxID.xls']));
    AvgIDBraceMax(i)=AvgIDBraceMaxTemp(1,12);
    
    StdIDBraceMaxTemp=table2array(readtable(['SubStd_' task_label{task} '_Brace_MaxID.xls'])); 
    StdIDBraceMax(i)=StdIDBraceMaxTemp(1,12)/sqrt(14);   
      
    
    
%     subplot(2,1,i);
%     errorbar(AvgFlex,StdFlex, '-bo');
%     hold on;
%     errorbar(AvgFlexBrace,StdFlexBrace, ':rx');
%     title('Differences in Knee Flexion Angles with and without Brace');
%     timePoints={'Initial Contact', 'Peak ID', 'Maximum Knee Flexion'};
%     set(gca, 'XTick', 1:3, 'XTickLabel',timePoints);
%     ylabel('Knee Flexion Angles (degrees)');
% %     hold off;
%     set(legend({'No Brace', 'Brace'}), 'Location','Northwest');
    
        
    i=i+1;
    
    
end

    barwitherr([StdIDMax' StdIDBraceMax'],[AvgIDMax' AvgIDBraceMax'], 'LineWidth',2,...
    'BarWidth',0.7)
    set(gca, 'XTickLabel', {'30CM', '60CM'})
    legend('NO BRACE', 'BRACE')
    ylabel('Peak Ankle Plantarflexor Moment (N-m/kg)')
   
   
end
