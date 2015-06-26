function plotmeanGRF_IDprofile(tasks)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

i=1;
for task=tasks
   
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
     
    AvgGRF=table2array(readtable(['SubAvg_' task_label{task} '_GRF_BW.xls']));
    StdGRF=table2array(readtable(['SubStd_' task_label{task} '_GRF_BW.xls'])); 
    
    AvgID=table2array(readtable(['SubAvg_' task_label{task} '_ID_BW.xls']));
    StdID=table2array(readtable(['SubStd_' task_label{task} '_ID_BW.xls'])); 
        
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgGRFBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_GRF_BW.xls']));
    StdGRFBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_GRF_BW.xls'])); 
    
    AvgIDBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_ID_BW.xls']));
    StdIDBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_ID_BW.xls']));
   
%     isMeanNoBrace=[AvgGRF, AvgID];
%     isMeanBrace=[AvgGRFBrace, AvgIDBrace];
%     
%     isStdNoBrace=[StdGRF, StdID];
%     isStdBrace=[StdGRFBrace, StdIDBrace];
    
    inMeanGRF=[AvgGRF(:,3), AvgGRFBrace(:,3)];
    inMeanID=[AvgID(:,8), AvgIDBrace(:,8)];
    
    inStdGRF=[StdGRF(:,3), StdGRFBrace(:,3)];
    inStdID=[StdID(:,8), StdIDBrace(:,8)];
    
        
    subplot(2,2,i);
    AGF_mnsdplot(inMeanGRF',(inStdGRF./sqrt(15))','LineColor',[0.6 0.6 0.6; 0 0 0],'PatchColor',[0.6 0.6 0.6; 0 0 0], 'X',linspace(0,100,200));
    ylim([0 2.5]);
    i=i+2;
    subplot(2,2,i);
    AGF_mnsdplot(inMeanID',(inStdID./sqrt(15))','LineColor',[0.6 0.6 0.6; 0 0 0],'PatchColor',[0.6 0.6 0.6; 0 0 0], 'X',linspace(0,100,200));
    ylim([-3 2]);
    i=i-1;
     
    clear AvgGRF StdGRF AvgID StdID AvgGRFBrace StdGRFBrace AvgIDBrace StdIDBrace
end
   
end
