%% Created by: Katie Ewing 
% Modified: June 2015
%
% This function plots the peak GRFs with error bars.
%%

function plotGRFBar2(tasks)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

i=1;
for task=tasks
   
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
    
    %Anterior-Posterior GRF
    AvgGRFMaxTemp=table2array(readtable(['SubAvg_' task_label{task} '_MaxGRF.xls']));
    AvgGRFMax(i)=AvgGRFMaxTemp(1,4);
    
    StdGRFMaxTemp=table2array(readtable(['SubStd_' task_label{task} '_MaxGRF.xls'])); 
    StdGRFMax(i)=StdGRFMaxTemp(1,4)/sqrt(14);    
    
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgGRFBraceMaxTemp=table2array(readtable(['SubAvg_' task_label{task} '_Brace_MaxGRF.xls']));
    AvgGRFBraceMax(i)=AvgGRFBraceMaxTemp(1,4);
    
    StdGRFBraceMaxTemp=table2array(readtable(['SubStd_' task_label{task} '_Brace_MaxGRF.xls'])); 
    StdGRFBraceMax(i)=StdGRFBraceMaxTemp(1,4)/sqrt(14);   
      
    
    
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

    barwitherr([StdGRFMax' StdGRFBraceMax'],[AvgGRFMax' AvgGRFBraceMax'], 'LineWidth',2,...
    'BarWidth',0.7)
    set(gca, 'XTickLabel', {'30CM', '60CM'})
    legend('NO BRACE', 'BRACE')
    ylabel('Peak GRF (B.W.)')
   
   
end
