%% Created by: Katie Ewing
%Modified: July 2015

%Plots mean over stance phase of each muscle group at 30 cm and 60 cm with and without brace.
%Each group in separate subplot.

%e.g. plotMFgroups([5 6])
%%
function plotMFgroups(tasks)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

i=1;
for task=tasks
   
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
     
    AvgMF=table2array(readtable(['SubAvg_' task_label{task} '_MFGroup.xls']));
    StdMF=table2array(readtable(['SubStd_' task_label{task} '_MFGroup.xls'])); 
    
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgMFBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_MFGroup.xls']));
    StdMFBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_MFGroup.xls'])); 
    
    inMeanHamsMed=[AvgMF(:,1), AvgMFBrace(:,1)];
    inMeanHamsLat=[AvgMF(:,2), AvgMFBrace(:,2)];
    inMeanHams=[AvgMF(:,3), AvgMFBrace(:,3)];
    inMeanRecFem=[AvgMF(:,4), AvgMFBrace(:,4)];
    inMeanVasMed=[AvgMF(:,5), AvgMFBrace(:,5)];
    inMeanVasInt=[AvgMF(:,6), AvgMFBrace(:,6)];
    inMeanVasLat=[AvgMF(:,7), AvgMFBrace(:,7)];
    inMeanVas=[AvgMF(:,8), AvgMFBrace(:,8)];
    inMeanQuads=[AvgMF(:,9), AvgMFBrace(:,9)];
    inMeanGasMed=[AvgMF(:,10), AvgMFBrace(:,10)];
    inMeanGasLat=[AvgMF(:,11), AvgMFBrace(:,11)];
    inMeanGas=[AvgMF(:,12), AvgMFBrace(:,12)];
    inMeanSol=[AvgMF(:,13), AvgMFBrace(:,13)];
    
    inStdHamsMed=[StdMF(:,1), StdMFBrace(:,1)];
    inStdHamsLat=[StdMF(:,2), StdMFBrace(:,2)];
    inStdHams=[StdMF(:,3), StdMFBrace(:,3)];
    inStdRecFem=[StdMF(:,4), StdMFBrace(:,4)];
    inStdVasMed=[StdMF(:,5), StdMFBrace(:,5)];
    inStdVasInt=[StdMF(:,6), StdMFBrace(:,6)];
    inStdVasLat=[StdMF(:,7), StdMFBrace(:,7)];
    inStdVas=[StdMF(:,8), StdMFBrace(:,8)];
    inStdQuads=[StdMF(:,9), StdMFBrace(:,9)];
    inStdGasMed=[StdMF(:,10), StdMFBrace(:,10)];
    inStdGasLat=[StdMF(:,11), StdMFBrace(:,11)];
    inStdGas=[StdMF(:,12), StdMFBrace(:,12)];
    inStdSol=[StdMF(:,13), StdMFBrace(:,13)];
    
    
    stance=linspace(0,100,200);
    heading={'HAMS','REC FEM', 'VAS','GAS','SOL'}; %for legends
    
    subplot(5,2,i);
    plot(stance, inMeanHams);
    ylabel('Muscle Force(B.W.)');
    legend({'NO BRACE','BRACE'});
    title(heading(1));

    i=i+2;
    subplot(5,2,i);
    plot(stance,inMeanRecFem);
    title(heading(2));

    i=i+2;
    subplot(5,2,i);
    plot(stance, inMeanVas);
    title(heading(3));

    i=i+2;
    subplot(5,2,i);
    plot(stance, inMeanGas);
    title(heading(4));

    i=i+2;

    subplot(5,2,i);
    plot(stance, inMeanSol);
    title(heading(5));

    i=i-7;

end

%     export_fig 'test' '-eps' '-painters' 'transparent'
end
