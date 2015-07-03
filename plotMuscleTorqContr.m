%%Created by: Katie Ewing
%Modified: July 2015

%Plots mean and standard error over stance phase of vertical GRF and joint
%moments at 30 cm and 60 cm with and without brace.
%Uses Adrian and Guan Shan's plotting function.
%e.g. plotmeanGRF_IDprofile([5 6])

%%
function plotMuscleTorqContr(tasks)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

i=1;

for task=tasks
   
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
     
    AvgMT=table2array(readtable(['SubAvg_' task_label{task} '_MuscleTorque.xls']));
    StdMT=table2array(readtable(['SubStd_' task_label{task} '_MuscleTorque.xls'])); 
    
    AvgID=table2array(readtable(['SubAvg_' task_label{task} '_ID_BW.xls']));
    StdID=table2array(readtable(['SubStd_' task_label{task} '_ID_BW.xls'])); 
        
    DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE'; 
    cd([DirSubAvgBrace '\' task_label{task}]);
    
    AvgMTBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_MuscleTorque.xls']));
    StdMTBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_MuscleTorque.xls'])); 
    
    AvgIDBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_ID_BW.xls']));
    StdIDBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_ID_BW.xls']));
    
    
%     inMeanID_hip=[AvgID(:,8), AvgIDBrace(:,8)];
%     inMeanID_knee=[AvgID(:,11), AvgIDBrace(:,11)];
%     inMeanID_ankle=[AvgID(:,12), AvgIDBrace(:,12)];
%     
%     
%     inStdID_hip=[StdID(:,8), StdIDBrace(:,8)];
%     inStdID_knee=[StdID(:,11), StdIDBrace(:,11)];
%     inStdID_ankle=[StdID(:,12), StdIDBrace(:,12)];

    MeanID_hip=AvgID(:,8);
    MeanID_knee=AvgID(:,11);
    MeanID_ankle=AvgID(:,12);
    
    MeanIDBrace_hip=AvgIDBrace(:,8);
    MeanIDBrace_knee=AvgIDBrace(:,11);
    MeanIDBrace_ankle=AvgIDBrace(:,12);
       
    
    %Muscle group joint torques for NO BRACE
    HamsTorq=sum(AvgMT(:,8:11),2);
    SarTorq=AvgMT(:,12);
    TFLTorq=AvgMT(:,18);
    GracTorq=AvgMT(:,20);
    RFTorq=AvgMT(:,29);
    VasTorq=sum(AvgMT(:,30:32),2);
    GasTorq=sum(AvgMT(:,33:34),2);
    
    %Muscle group joint torques for BRACE
    HamsTorqBrace=sum(AvgMTBrace(:,8:11),2);
    SarTorqBrace=AvgMTBrace(:,12);
    TFLTorqBrace=AvgMTBrace(:,18);
    GracTorqBrace=AvgMTBrace(:,20);
    RFTorqBrace=AvgMTBrace(:,29);
    VasTorqBrace=sum(AvgMTBrace(:,30:32),2);
    GasTorqBrace=sum(AvgMTBrace(:,33:34),2);
    
   stance=linspace(0,100,200); 
    

   subplot(2,2,i);
   area(stance, MeanID_knee, 'EdgeColor',[1 1 1], 'FaceColor',[.93 .93 .93]);
   hold on;
   plot(stance,[HamsTorq,RFTorq, VasTorq,GasTorq]);
   legend('Total Knee Joint Torque','HAMS', 'RF','VAS','GAS');
   legend('boxoff');
   legend('Location', 'northwest');
    xlabel('Percent Landing Phase');
    ylabel('Torque (N-m/kg)');
    axis([0 100 -0.5 2]);
	title('Muscle contribution to net knee joint torque','fontsize',12);
    
    i=i+2;
     subplot(2,2,i);
   area(stance, MeanIDBrace_knee, 'EdgeColor',[1 1 1], 'FaceColor',[.93 .93 .93]);
   hold on;
   plot(stance,[HamsTorqBrace,RFTorqBrace, VasTorqBrace,GasTorqBrace]);
%    legend('Total Knee Joint Torque','HAMS', 'QUADS','GAS');
    axis([0 100 -0.5 2]);
    xlabel('Percent Landing Phase');
    ylabel('Torque (N-m/kg)');
    
    i=i-1;
    
end

end


