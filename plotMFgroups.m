%% Created by: Katie Ewing
%Modified: July 2015

%Plots mean over landing phase of each muscle group at 30 cm and 60 cm with and without brace.
%Each group in separate subplot.

%e.g. plotMFgroups([5 6])
%%
function plotMFgroups(tasks)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

i=1;
for task=tasks
   
    switch task
        case 5
            n=15;
        case 6
            n=14;
    end
    
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
     
    AvgMF=table2array(readtable(['SubAvg_' task_label{task} '_MFGroup.xls']));
    StdMF=table2array(readtable(['SubStd_' task_label{task} '_MFGroup.xls'])); 
    
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgMFBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_MFGroup.xls']));
    StdMFBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_MFGroup.xls'])); 
    
    inMeanGMAX=[AvgMF(:,1), AvgMFBrace(:,1)];
    inMeanGMED=[AvgMF(:,2), AvgMFBrace(:,2)];
    inMeanGMIN=[AvgMF(:,3), AvgMFBrace(:,3)];
    inMeanILSPO=[AvgMF(:,4), AvgMFBrace(:,4)];
    inMeanHamsMed=[AvgMF(:,5), AvgMFBrace(:,5)];
    inMeanHamsLat=[AvgMF(:,6), AvgMFBrace(:,6)];
    inMeanHams=[AvgMF(:,7), AvgMFBrace(:,7)];
    inMeanRecFem=[AvgMF(:,8), AvgMFBrace(:,8)];
    inMeanVasMed=[AvgMF(:,9), AvgMFBrace(:,9)];
    inMeanVasInt=[AvgMF(:,10), AvgMFBrace(:,10)];
    inMeanVasLat=[AvgMF(:,11), AvgMFBrace(:,11)];
    inMeanVas=[AvgMF(:,12), AvgMFBrace(:,12)];
    inMeanQuads=[AvgMF(:,13), AvgMFBrace(:,13)];
    inMeanGasMed=[AvgMF(:,14), AvgMFBrace(:,14)];
    inMeanGasLat=[AvgMF(:,15), AvgMFBrace(:,15)];
    inMeanGas=[AvgMF(:,16), AvgMFBrace(:,16)];
    inMeanSol=[AvgMF(:,17), AvgMFBrace(:,17)];
    
    
    
    inStdGMAX=[StdMF(:,1), StdMFBrace(:,1)];
    inStdGMED=[StdMF(:,2), StdMFBrace(:,2)];
    inStdGMIN=[StdMF(:,3), StdMFBrace(:,3)];
    inStdILSPO=[StdMF(:,4), StdMFBrace(:,4)];
    inStdHamsMed=[StdMF(:,5), StdMFBrace(:,5)];
    inStdHamsLat=[StdMF(:,6), StdMFBrace(:,6)];
    inStdHams=[StdMF(:,7), StdMFBrace(:,7)];
    inStdRecFem=[StdMF(:,8), StdMFBrace(:,8)];
    inStdVasMed=[StdMF(:,9), StdMFBrace(:,9)];
    inStdVasInt=[StdMF(:,10), StdMFBrace(:,10)];
    inStdVasLat=[StdMF(:,11), StdMFBrace(:,11)];
    inStdVas=[StdMF(:,12), StdMFBrace(:,12)];
    inStdQuads=[StdMF(:,13), StdMFBrace(:,13)];
    inStdGasMed=[StdMF(:,14), StdMFBrace(:,14)];
    inStdGasLat=[StdMF(:,15), StdMFBrace(:,15)];
    inStdGas=[StdMF(:,16), StdMFBrace(:,16)];
    inStdSol=[StdMF(:,17), StdMFBrace(:,17)];
    
    
    stance=linspace(0,100,200);
    heading={'GMAX', 'HAMS','REC FEM', 'VAS','GAS','SOL'}; %for legends
    
%     subplot(5,2,i);
%     plot(stance, inMeanHams);
%     ylabel('Muscle Force(B.W.)');
%     legend({'NO BRACE','BRACE'});
%     title(heading(1));
% 
%     i=i+2;
%     subplot(5,2,i);
%     plot(stance,inMeanRecFem);
%     title(heading(2));
% 
%     i=i+2;
%     subplot(5,2,i);
%     plot(stance, inMeanVas);
%     title(heading(3));
% 
%     i=i+2;
%     subplot(5,2,i);
%     plot(stance, inMeanGas);
%     title(heading(4));
% 
%     i=i+2;
% 
%     subplot(5,2,i);
%     plot(stance, inMeanSol);
%     title(heading(5));
% 
%     i=i-7;

   subplot(6,2,i);
   AGF_mnsdplot(inMeanGMAX',(inStdGMAX./sqrt(n))', 'X',linspace(0,100,200));
   ax=gca;
   set(ax,'XTick',[0 50 100]);
%    set(ax,'YTick',[0 1 2]);
    axis([0 100 0 2])
     ylabel('Muscle Force(B.W.)');
   
%     legend({'NO BRACE','BRACE'});
    title(heading(1));

   i=i+2;
   
    subplot(6,2,i);
   AGF_mnsdplot(inMeanHams',(inStdHams./sqrt(n))', 'X',linspace(0,100,200));
    
   ax=gca;
   set(ax,'XTick',[0 50 100]);
%    set(ax,'YTick',[0 1 2]);
    axis([0 100 0 2])
     ylabel('Muscle Force(B.W.)');
   
%     legend({'NO BRACE','BRACE'});
    title(heading(2));

    i=i+2;
    subplot(6,2,i);
    ax=gca;
     AGF_mnsdplot(inMeanRecFem',(inStdRecFem./sqrt(n))', 'X',linspace(0,100,200));
    title(heading(3));
    set(ax,'XTick',[0 50 100]);
    axis([0 100 0 2])
%     set(ax,'YTick',[0 1 2]);

    i=i+2;
    subplot(6,2,i);
     ax=gca;
     AGF_mnsdplot(inMeanVas',(inStdVas./sqrt(n))', 'X',linspace(0,100,200));
    title(heading(4));
    set(ax,'XTick',[0 50 100]);
%     set(ax,'YTick',[0 4 8]);
    axis([0 100 0 8])

    i=i+2;
    subplot(6,2,i);
     ax=gca;
    AGF_mnsdplot(inMeanGas',(inStdGas./sqrt(n))', 'X',linspace(0,100,200));
    title(heading(5));
%     set(ax,'YTick',[0 1 2]);
    set(ax,'XTick',[0 50 100]);
    axis([0 100 0 2])

    i=i+2;

    subplot(6,2,i);
     ax=gca;
     AGF_mnsdplot(inMeanSol',(inStdSol./sqrt(n))', 'X',linspace(0,100,200));
    title(heading(6));
    axis([0 100 0 6])
    set(ax,'XTick',[0 50 100]);
%     set(ax,'YTick',[0 2 4 6]);
    axis([0 100 0 6])

    i=i-9;
     

end

    export_fig 'muscle forces' '-eps' '-painters' 'transparent'
end
