function plotGRFBar(tasks)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

i=1;
for task=tasks
   
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
     
    AvgGRFMaxTemp=table2array(readtable(['SubAvg_' task_label{task} '_MaxGRF.xls']));
    AvgGRFMax(i)=AvgGRFMaxTemp(1,3);
    
    StdGRFMaxTemp=table2array(readtable(['SubStd_' task_label{task} '_MaxGRF.xls'])); 
    StdGRFMax(i)=StdGRFMaxTemp(1,3);    
    
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgGRFBraceMaxTemp=table2array(readtable(['SubAvg_' task_label{task} '_Brace_MaxGRF.xls']));
    AvgGRFBraceMax(i)=AvgGRFBraceMaxTemp(1,3);
    
    StdGRFBraceMaxTemp=table2array(readtable(['SubStd_' task_label{task} '_Brace_MaxGRF.xls'])); 
    StdGRFBraceMax(i)=StdGRFBraceMaxTemp(1,3);   
    
    
    
    
    
%     subplot(2,1,i);
%     errorbar(AvgFlex,StdFlex, '-bo');
%     hold on;
%     errorbar(AvgFlexBrace,StdFlexBrace, ':rx');
%     title('Differences in Knee Flexion Angles with and without Brace');
%     timePoints={'Initial Contact', 'Peak GRF', 'Maximum Knee Flexion'};
%     set(gca, 'XTick', 1:3, 'XTickLabel',timePoints);
%     ylabel('Knee Flexion Angles (degrees)');
% %     hold off;
%     set(legend({'No Brace', 'Brace'}), 'Location','Northwest');
    
        
    i=i+1;
    
    
end

    barwitherr([StdGRFMax StdGRFBraceMax], [AvgGRFMax AvgGRFBraceMax], 'LineWidth',2,...
    'BarWidth',0.5)
    set(gca, 'XTickLabel', {'NO BRACE', 'BRACE'})
    ylabel('Peak GRF (B.W.)')

   
    
   
end
