%% Created by: Katie Ewing
%Modified: June 2015

%Plots mean and standard error over stance phase of vertical GRF and joint
%moments at 30 cm and 60 cm with and without brace.
%Uses Adrian and Guan Shan's plotting function.
%e.g. plotmeanGRF_IDprofile([5 6])

%%
function plotmeanGRF_IDprofile(tasks)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

% i=1;
for task=tasks
    switch task
        case 5
            n=15;
        case 6
            n=14;
        case 7
            n=14;
    end

    
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
    
    inMeanGRF=[AvgGRF(:,3), AvgGRFBrace(:,3)];
    inMeanID_hip=[AvgID(:,8), AvgIDBrace(:,8)];
    inMeanID_knee=[AvgID(:,11), AvgIDBrace(:,11)];
    inMeanID_ankle=[AvgID(:,12), AvgIDBrace(:,12)];
    
    inStdGRF=[StdGRF(:,3), StdGRFBrace(:,3)];
    inStdID_hip=[StdID(:,8), StdIDBrace(:,8)];
    inStdID_knee=[StdID(:,11), StdIDBrace(:,11)];
    inStdID_ankle=[StdID(:,12), StdIDBrace(:,12)];
    
    %calls function from Adrian and GS
    figure(1);
%     subplot(4,2,i);  for DL
    subplot(4,1,1);
    AGF_mnsdplot(inMeanGRF',(inStdGRF./sqrt(n))','LineColor',[0.6 0.6 0.6; 0 0 0],'PatchColor',[0.6 0.6 0.6; 0 0 0], 'X',linspace(0,100,200));
%     ylim([0 3]);
    ylim([0 2]);
    ylabel('Vertical GRF (B.W.)');
    
%     i=i+2; %NOTE: FOR HIP, WE PLOT THE NEGATIVE TO ENSURE THAT POSITIVE IS EXTENSION MOMENT
    subplot(4,1,2); 
    AGF_mnsdplot(-inMeanID_hip',(-inStdID_hip./sqrt(n))','LineColor',[0.6 0.6 0.6; 0 0 0],'PatchColor',[0.6 0.6 0.6; 0 0 0], 'X',linspace(0,100,200));
%     ylim([-2 3]);
    ylim([0 4]);
    ylabel('Moment (N-m/kg)');
    title('Hip');
    
%     i=i+2;
    subplot(4,1,3);
    AGF_mnsdplot(inMeanID_knee',(inStdID_knee./sqrt(n))','LineColor',[0.6 0.6 0.6; 0 0 0],'PatchColor',[0.6 0.6 0.6; 0 0 0], 'X',linspace(0,100,200));
%     ylim([-1 2]);
    ylim([-1 3]);
%     xlabel('Percent landing phase');
    ylabel('Moment (N-m/kg)');
    title('Knee');
    
%     i=i+2;
    subplot(4,1,4);   %NOTE: FOR ANKLE, WE PLOT THE NEGATIVE TO ENSURE THAT POSITIVE IS PLANTARFLEXION MOMENT
    AGF_mnsdplot(-inMeanID_ankle',(-inStdID_ankle./sqrt(n))','LineColor',[0.6 0.6 0.6; 0 0 0],'PatchColor',[0.6 0.6 0.6; 0 0 0], 'X',linspace(0,100,200));
%     ylim([0 2]);
    ylim([0 3])
    xlabel('Percent landing phase');
    ylabel('Moment (N-m/kg)');
    title('Ankle');
    
%     i=i-5;
     
    clear AvgGRF StdGRF AvgID StdID AvgGRFBrace StdGRFBrace AvgIDBrace StdIDBrace
    
   
end

    export_fig 'test' '-eps' '-painters' 'transparent'
end
