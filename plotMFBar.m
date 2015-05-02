function plotMFBar(tasks)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

i=1;
for task=tasks
   
    
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
    
    %HAMSTRINGS
%     AvgMFMaxTemp=table2array(readtable(['SubAvg_' task_label{task} '_MaxMF.xls']));
%     AvgMFMax(i)=AvgMFMaxTemp(1,8)+AvgMFMaxTemp(1,9)+AvgMFMaxTemp(1,10)+AvgMFMaxTemp(1,11);
%     
%     StdMFMaxTemp=table2array(readtable(['SubStd_' task_label{task} '_MaxMF.xls'])); 
%     StdMFMax(i)=(StdMFMaxTemp(1,8)+ StdMFMaxTemp(1,9)+ StdMFMaxTemp(1,10)+ StdMFMaxTemp(1,11))/sqrt(14);    
%     
%     DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
%     cd([DirSubAvgBrace '\' task_label{task}]);
%     
%     AvgMFBraceMaxTemp=table2array(readtable(['SubAvg_' task_label{task} '_Brace_MaxMF.xls']));
%     AvgMFBraceMax(i)=AvgMFBraceMaxTemp(1,8) + AvgMFBraceMaxTemp(1,9)+ AvgMFBraceMaxTemp(1,10) + AvgMFBraceMaxTemp(1,11);
%     
%     StdMFBraceMaxTemp=table2array(readtable(['SubStd_' task_label{task} '_Brace_MaxMF.xls'])); 
%     StdMFBraceMax(i)=(StdMFBraceMaxTemp(1,8) + StdMFBraceMaxTemp(1,9) + StdMFBraceMaxTemp(1,10) + StdMFBraceMaxTemp(1,11))/sqrt(14);   
%     
    
    %QUADRICEPS
    AvgMFMaxTemp=table2array(readtable(['SubAvg_' task_label{task} '_MaxMF.xls']));
    AvgMFMax(i)=AvgMFMaxTemp(1,29)+AvgMFMaxTemp(1,30)+AvgMFMaxTemp(1,31)+AvgMFMaxTemp(1,32);
    
    StdMFMaxTemp=table2array(readtable(['SubStd_' task_label{task} '_MaxMF.xls'])); 
    StdMFMax(i)=(StdMFMaxTemp(1,29)+ StdMFMaxTemp(1,30)+ StdMFMaxTemp(1,31)+ StdMFMaxTemp(1,32))/sqrt(14);    
    
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgMFBraceMaxTemp=table2array(readtable(['SubAvg_' task_label{task} '_Brace_MaxMF.xls']));
    AvgMFBraceMax(i)=AvgMFBraceMaxTemp(1,29) + AvgMFBraceMaxTemp(1,30)+ AvgMFBraceMaxTemp(1,31) + AvgMFBraceMaxTemp(1,32);
    
    StdMFBraceMaxTemp=table2array(readtable(['SubStd_' task_label{task} '_Brace_MaxMF.xls'])); 
    StdMFBraceMax(i)=(StdMFBraceMaxTemp(1,29) + StdMFBraceMaxTemp(1,30) + StdMFBraceMaxTemp(1,31) + StdMFBraceMaxTemp(1,32))/sqrt(14);   
    
    
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
    
  
    %VASTUS LATERALIS TIMING
%     AvgMFMaxTime(i)=AvgMFMaxTemp(2,32);
%     
%     StdMFMaxTime(i)=StdMFMaxTemp(2,32)/sqrt(14);    
%     
%     DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
%     cd([DirSubAvgBrace '\' task_label{task}]);
%     
%     AvgMFBraceMaxTime(i)=AvgMFBraceMaxTemp(2,32);
%     
%    
%     StdMFBraceMaxTime(i)=StdMFBraceMaxTemp(2,32)/sqrt(14);   

    %BICEPS FEMORIS LONG HEAD TIMING
    AvgMFMaxTime(i)=AvgMFMaxTemp(2,10);
    
    StdMFMaxTime(i)=StdMFMaxTemp(2,10)/sqrt(14);    
    
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgMFBraceMaxTime(i)=AvgMFBraceMaxTemp(2,10);
    
   
    StdMFBraceMaxTime(i)=StdMFBraceMaxTemp(2,10)/sqrt(14);   


        
    i=i+1;
    
    
end

%     barwitherr([StdMFMax' StdMFBraceMax'],[AvgMFMax' AvgMFBraceMax'], 'LineWidth',2,...
%     'BarWidth',0.7)
%     set(gca, 'XTickLabel', {'30CM', '60CM'})
%     legend('NO BRACE', 'BRACE')
%     ylabel('Peak Quadriceps Force (B.W.)')
   
    barwitherr([StdMFMaxTime' StdMFBraceMaxTime'],[AvgMFMaxTime' AvgMFBraceMaxTime'], 'LineWidth',2,...
    'BarWidth',0.7)
    set(gca, 'XTickLabel', {'30CM', '60CM'})
    legend('NO BRACE', 'BRACE')
    ylabel('Timing of Peak Biceps Femrois Long Head(Percent Landing Phase)')
   
end
