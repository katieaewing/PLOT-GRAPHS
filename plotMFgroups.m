%Katie Ewing
%June 2015

%Plots mean and standard error over stance phase of vertical GRF and joint
%moments at 30 cm and 60 cm with and without brace.
%Uses Adrian and Guan Shan's plotting function.
%e.g. plotmeanGRF_IDprofile([5 6])
function plotMFgroups(tasks)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

i=1;
for task=tasks
   
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
     
    AvgMF=table2array(readtable(['SubAvg_' task_label{task} '_MFGroup.xls']));
    StdMF=table2array(readtable(['SubStd_' task_label{task} '_MFGroup.xls'])); 
    
%     AvgMF=table2array(readtable(['SubAvg_' task_label{task} '_MF_BW.xls']));
%     StdMF=table2array(readtable(['SubStd_' task_label{task} '_MF_BW.xls'])); 
%             
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgMFBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_MFGroup.xls']));
    StdMFBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_MFGroup.xls'])); 
    
%     AvgMFBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_MF_BW.xls']));
%     StdMFBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_MF_BW.xls'])); 
    
    inMeanHamsMed=[AvgMF(:,1), AvgMFBrace(:,1)];
    inMeanHamsLat=[AvgMF(:,2), AvgMFBrace(:,2)];
    inMeanHams=[AvgMF(:,3), AvgMFBrace(:,3)];
    inMeanRecFem=[AvgMF(:,4), AvgMFBrace(:,4)];
    inMeanVasMed=[AvgMF(:,5), AvgMFBrace(:,5)];
    inMeanVasInt=[AvgMF(:,6), AvgMFBrace(:,6)];
    inMeanVasLat=[AvgMF(:,7), AvgMFBrace(:,7)];
    inMeanQuads=[AvgMF(:,8), AvgMFBrace(:,8)];
    inMeanGasMed=[AvgMF(:,9), AvgMFBrace(:,9)];
    inMeanGasLat=[AvgMF(:,10), AvgMFBrace(:,10)];
    inMeanGas=[AvgMF(:,11), AvgMFBrace(:,11)];
    inMeanSol=[AvgMF(:,12), AvgMFBrace(:,12)];
    
    inStdHamsMed=[StdMF(:,1), StdMFBrace(:,1)];
    inStdHamsLat=[StdMF(:,2), StdMFBrace(:,2)];
    inStdHams=[StdMF(:,3), StdMFBrace(:,3)];
    inStdRecFem=[StdMF(:,4), StdMFBrace(:,4)];
    inStdVasMed=[StdMF(:,5), StdMFBrace(:,5)];
    inStdVasInt=[StdMF(:,6), StdMFBrace(:,6)];
    inStdVasLat=[StdMF(:,7), StdMFBrace(:,7)];
    inStdQuads=[StdMF(:,8), StdMFBrace(:,8)];
    inStdGasMed=[StdMF(:,9), StdMFBrace(:,9)];
    inStdGasLat=[StdMF(:,10), StdMFBrace(:,10)];
    inStdGas=[StdMF(:,11), StdMFBrace(:,11)];
    inStdSol=[StdMF(:,12), StdMFBrace(:,12)];
    
    %calls function from Adrian and GS
    figure(1);
    %     subplot(4,2,i);
    AGF_mnsdplot(inMeanHamsMed',(inStdHamsMed./sqrt(15))','X',linspace(0,100,200));
    %     ylim([0 3]);
    ylabel('Muscle Force(B.W.)');
    
    figure(2);
    %     subplot(4,2,i);
    AGF_mnsdplot(inMeanHamsLat',(inStdHamsLat./sqrt(15))', 'X',linspace(0,100,200));
    %     ylim([0 3]);
    ylabel('Muscle Force(B.W.)');
    
    figure(3);
    %     subplot(4,2,i);
    AGF_mnsdplot(inMeanHams',(inStdHams./sqrt(15))', 'X',linspace(0,100,200));
    %     ylim([0 3]);
    ylabel('Muscle Force(B.W.)');
    
    figure(4);
    %     subplot(4,2,i);
    AGF_mnsdplot(inMeanRecFem',(inStdRecFem./sqrt(15))', 'X',linspace(0,100,200));
    %     ylim([0 3]);
    ylabel('Muscle Force(B.W.)');
    
    figure(5);
    %     subplot(4,2,i);
    AGF_mnsdplot(inMeanVasMed',(inStdVasMed./sqrt(15))', 'X',linspace(0,100,200));
    %     ylim([0 3]);
    ylabel('Muscle Force(B.W.)');
    
    figure(6);
    %     subplot(4,2,i);
    AGF_mnsdplot(inMeanVasInt',(inStdVasInt./sqrt(15))', 'X',linspace(0,100,200));
    %     ylim([0 3]);
    ylabel('Muscle Force(B.W.)');
    
    figure(7);
    %     subplot(4,2,i);
    AGF_mnsdplot(inMeanVasLat',(inStdVasLat./sqrt(15))', 'X',linspace(0,100,200));
    %     ylim([0 3]);
    ylabel('Muscle Force(B.W.)');
    
    figure(8);
    %     subplot(4,2,i);
    AGF_mnsdplot(inMeanQuads',(inStdQuads./sqrt(15))', 'X',linspace(0,100,200));
    %     ylim([0 3]);
    ylabel('Muscle Force(B.W.)');
    
    
    figure(9);
    %     subplot(4,2,i);
    AGF_mnsdplot(inMeanGasMed',(inStdGasMed./sqrt(15))', 'X',linspace(0,100,200));
    %     ylim([0 3]);
    ylabel('Muscle Force(B.W.)');
    
    figure(10);
    %     subplot(4,2,i);
    AGF_mnsdplot(inMeanGasLat',(inStdGasLat./sqrt(15))', 'X',linspace(0,100,200));
    %     ylim([0 3]);
    ylabel('Muscle Force(B.W.)');
    
    figure(11);
    %     subplot(4,2,i);
    AGF_mnsdplot(inMeanGas',(inStdGas./sqrt(15))', 'X',linspace(0,100,200));
    %     ylim([0 3]);
    ylabel('Muscle Force(B.W.)');
    
    figure(12);
    %     subplot(4,2,i);
    AGF_mnsdplot(inMeanSol',(inStdSol./sqrt(15))', 'X',linspace(0,100,200));
    %     ylim([0 3]);
    ylabel('Muscle Force(B.W.)');
    
%     i=i+2;
%     subplot(4,2,i);
%     AGF_mnsdplot(-inMeanID_hip',(-inStdID_hip./sqrt(15))','LineColor',[0.6 0.6 0.6; 0 0 0],'PatchColor',[0.6 0.6 0.6; 0 0 0], 'X',linspace(0,100,200));
%     ylim([-2 3]);
%     ylabel('Moment (N-m/kg)');
%     title('Hip');
%     
%     i=i+2;
%     subplot(4,2,i);
%     AGF_mnsdplot(inMeanID_knee',(inStdID_knee./sqrt(15))','LineColor',[0.6 0.6 0.6; 0 0 0],'PatchColor',[0.6 0.6 0.6; 0 0 0], 'X',linspace(0,100,200));
%     ylim([-1 2]);
% %     xlabel('Percent landing phase');
%     ylabel('Moment (N-m/kg)');
%     title('Knee');
%     
%     i=i+2;
%     subplot(4,2,i);
%     AGF_mnsdplot(-inMeanID_ankle',(-inStdID_ankle./sqrt(15))','LineColor',[0.6 0.6 0.6; 0 0 0],'PatchColor',[0.6 0.6 0.6; 0 0 0], 'X',linspace(0,100,200));
%     ylim([0 2]);
%     xlabel('Percent landing phase');
%     ylabel('Moment (N-m/kg)');
%     title('Ankle');
%     
%     i=i-5;
%      
%     clear AvgGRF StdGRF AvgID StdID AvgGRFBrace StdGRFBrace AvgIDBrace StdIDBrace
    
   
end

%     export_fig 'test' '-eps' '-painters' 'transparent'
end
