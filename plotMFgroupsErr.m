%% Created by: Katie Ewing
%Modified: June 2015

%Plots mean and standard error over stance phase of each muscle group for a
%given task with and without brace.
%Each muscle group in separate plot
%Uses Adrian and Guan Shan's plotting function.
%e.g. plotMFgroupsErr([6])
%%
function plotMFgroupsErr(task)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

switch task
    case 5
        n=15;
    case 6
        n=14;
end

i=1;
   
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
    
    
    
    %calls function from Adrian and GS
    figure(1);

    AGF_mnsdplot(inMeanHamsMed',(inStdHamsMed./sqrt(n))','X',linspace(0,100,200));
    ylabel('Muscle Force(B.W.)');
    
    figure(2);
    AGF_mnsdplot(inMeanHamsLat',(inStdHamsLat./sqrt(n))', 'X',linspace(0,100,200));
    ylabel('Muscle Force(B.W.)');
    
    figure(3);
    AGF_mnsdplot(inMeanHams',(inStdHams./sqrt(n))', 'X',linspace(0,100,200));
    ylabel('Muscle Force(B.W.)');
    
    figure(4);
    AGF_mnsdplot(inMeanRecFem',(inStdRecFem./sqrt(n))', 'X',linspace(0,100,200));
    ylabel('Muscle Force(B.W.)');
    
    figure(5);
    AGF_mnsdplot(inMeanVasMed',(inStdVasMed./sqrt(n))', 'X',linspace(0,100,200));
    ylabel('Muscle Force(B.W.)');
    
    figure(6);
    AGF_mnsdplot(inMeanVasInt',(inStdVasInt./sqrt(n))', 'X',linspace(0,100,200));
    ylabel('Muscle Force(B.W.)');
    
    figure(7);
    AGF_mnsdplot(inMeanVasLat',(inStdVasLat./sqrt(n))', 'X',linspace(0,100,200));
    ylabel('Muscle Force(B.W.)');
    
    figure(8);
    AGF_mnsdplot(inMeanQuads',(inStdQuads./sqrt(n))', 'X',linspace(0,100,200));
    ylabel('Muscle Force(B.W.)');
    
    
    figure(9);
    AGF_mnsdplot(inMeanGasMed',(inStdGasMed./sqrt(n))', 'X',linspace(0,100,200));
    ylabel('Muscle Force(B.W.)');
    
    figure(10);
    AGF_mnsdplot(inMeanGasLat',(inStdGasLat./sqrt(n))', 'X',linspace(0,100,200));
    ylabel('Muscle Force(B.W.)');
    
    figure(11);
    AGF_mnsdplot(inMeanGas',(inStdGas./sqrt(n))', 'X',linspace(0,100,200));
    ylabel('Muscle Force(B.W.)');
    
    figure(12);
    AGF_mnsdplot(inMeanSol',(inStdSol./sqrt(n))', 'X',linspace(0,100,200));
    ylabel('Muscle Force(B.W.)');    
    
    
    %put muscle group on top of each figure
    heading={'HAMS MED', 'HAMS LAT', 'HAMS', 'REC FEM', 'VAS MED', 'VAS INT','VAS LAT', 'VAS', 'GAS MED', 'GAS LAT', 'GAS','SOL'}; %for legends

    
    for i=1:12
        figure(i);
        title(heading(i));
    end
    
    
end

%     export_fig 'test' '-eps' '-painters' 'transparent'
