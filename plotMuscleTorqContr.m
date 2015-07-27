%% Created by: Katie Ewing
%Modified: July 2015

%Plots average joint torque as calculated from inverse dynamics. Then plots
%torque of each major muscle group crossing a specified joint.
%e.g. plotMuscleTorqContr([5 6], 'hip')
%NOTE: POSITIVE MEANS EXTENSION MOMENT, NEGATIVE MEANS FLEXION MOMENT.


%%
function plotMuscleTorqContr(tasks, joint)

task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

i=1;

for task=tasks
   
    DirSubAvg='C:\MyOpenSim4\SUBJECT_AVERAGES';
    cd([DirSubAvg '\' task_label{task}]);
    
    AvgID=table2array(readtable(['SubAvg_' task_label{task} '_ID_BW.xls']));
    StdID=table2array(readtable(['SubStd_' task_label{task} '_ID_BW.xls'])); 
        
     
    switch joint
        case 'hip'
             
            MeanID=-AvgID(:,8);
            AvgMT=table2array(readtable(['SubAvg_' task_label{task} '_MuscleTorqueHip.xls']));
            StdMT=table2array(readtable(['SubStd_' task_label{task} '_MuscleTorqueHip.xls']));
            
            DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE';
            cd([DirSubAvgBrace '\' task_label{task}]);
            
            AvgMTBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_MuscleTorqueHip.xls']));
            StdMTBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_MuscleTorqueHip.xls']));
            
            AvgIDBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_ID_BW.xls']));
            StdIDBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_ID_BW.xls']));
            
            MeanIDBrace=-AvgIDBrace(:,8);
            
        case 'knee'
            MeanID=AvgID(:,11);
            
            AvgMT=table2array(readtable(['SubAvg_' task_label{task} '_MuscleTorque.xls']));
            StdMT=table2array(readtable(['SubStd_' task_label{task} '_MuscleTorque.xls']));
            
            DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE';
            cd([DirSubAvgBrace '\' task_label{task}]);
            
            AvgMTBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_MuscleTorque.xls']));
            StdMTBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_MuscleTorque.xls']));
            
            AvgIDBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_ID_BW.xls']));
            StdIDBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_ID_BW.xls']));
            
            MeanIDBrace=AvgIDBrace(:,11);
                      
        case 'ankle'
            
            MeanID=-AvgID(:,12);
            AvgMT=table2array(readtable(['SubAvg_' task_label{task} '_MuscleTorqueAnkle.xls']));
            StdMT=table2array(readtable(['SubStd_' task_label{task} '_MuscleTorqueAnkle.xls']));
            
            DirSubAvgBrace='C:\MyOpenSim4\SUBJECT_AVERAGES_BRACE';
            cd([DirSubAvgBrace '\' task_label{task}]);
            
            AvgMTBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_MuscleTorqueAnkle.xls']));
            StdMTBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_MuscleTorqueAnkle.xls']));
            
            AvgIDBrace=table2array(readtable(['SubAvg_' task_label{task} '_Brace_ID_BW.xls']));
            StdIDBrace=table2array(readtable(['SubStd_' task_label{task} '_Brace_ID_BW.xls']));
            
            MeanIDBrace=-AvgIDBrace(:,12);
    end
    
    
%     inMeanID_hip=[AvgID(:,8), AvgIDBrace(:,8)];
%     inMeanID_knee=[AvgID(:,11), AvgIDBrace(:,11)];
%     inMeanID_ankle=[AvgID(:,12), AvgIDBrace(:,12)];
%     
%     
%     inStdID_hip=[StdID(:,8), StdIDBrace(:,8)];
%     inStdID_knee=[StdID(:,11), StdIDBrace(:,11)];
%     inStdID_ankle=[StdID(:,12), StdIDBrace(:,12)];

%     MeanID_hip=AvgID(:,8);
%     MeanID_knee=AvgID(:,11);
%     MeanID_ankle=AvgID(:,12);
%     
%     MeanIDBrace_hip=AvgIDBrace(:,8);
%     MeanIDBrace_knee=AvgIDBrace(:,11);
%     MeanIDBrace_ankle=AvgIDBrace(:,12);
       
    
    %Muscle group joint torques for NO BRACE
    GlutMedTorq=sum(AvgMT(:,2:4),2);
    GlutMinTorq=sum(AvgMT(:,5:7),2);
    GlutMaxTorq=sum(AvgMT(:,21:23),2);
    IlPsTorq=sum(AvgMT(:,24:25),2);
    HamsTorq=sum(AvgMT(:,8:11),2);
    SarTorq=AvgMT(:,12);
    TFLTorq=AvgMT(:,18);
    GracTorq=AvgMT(:,20);
    RFTorq=AvgMT(:,29);
    VasTorq=sum(AvgMT(:,30:32),2);
    GasTorq=sum(AvgMT(:,33:34),2);
    SolTorq=AvgMT(:,35);
    TATorq=AvgMT(:,39);
    
    
    %Muscle group joint torques for BRACE
    GlutMedTorqBrace=sum(AvgMTBrace(:,2:4),2);
    GlutMinTorqBrace=sum(AvgMTBrace(:,5:7),2);
    GlutMaxTorqBrace=sum(AvgMTBrace(:,21:23),2);
    IlPsTorqBrace=sum(AvgMTBrace(:,24:25),2);
    HamsTorqBrace=sum(AvgMTBrace(:,8:11),2);
    SarTorqBrace=AvgMTBrace(:,12);
    TFLTorqBrace=AvgMTBrace(:,18);
    GracTorqBrace=AvgMTBrace(:,20);
    RFTorqBrace=AvgMTBrace(:,29);
    VasTorqBrace=sum(AvgMTBrace(:,30:32),2);
    GasTorqBrace=sum(AvgMTBrace(:,33:34),2);
    SolTorqBrace=AvgMTBrace(:,35);
    TATorqBrace=AvgMTBrace(:,39);
    
    
    switch joint
        case 'hip'
            toPlot=[-IlPsTorq, -GlutMaxTorq,-HamsTorq, -RFTorq];
            toPlotBrace=[-IlPsTorqBrace, -GlutMaxTorqBrace,-HamsTorqBrace, -RFTorqBrace];
%             toPlotBrace=[GlutMedTorqBrace, GlutMinTorqBrace,GlutMaxTorqBrace,HamsTorqBrace, RFTorqBrace];
            plotLegend={'Total Joint Torque', 'ILPSO','GMAX', 'HAMS', 'RF'};
%             plotLegend={'Total Joint Torque','GLUT MED', 'GLUT MIN', 'GLUT MAX', 'HAMS', 'RF'};
%              plotAxis=[0 100 -1 2.5];
            plotAxis=[0 100 -0.5 3];
        case 'knee'
            toPlot=[HamsTorq, RFTorq, VasTorq,GasTorq];
            toPlotBrace=[HamsTorqBrace,RFTorqBrace, VasTorqBrace,GasTorqBrace];
            plotLegend={'Total Joint Torque','HAMS', 'RF','VAS','GAS'};
%             plotAxis=[0 100 -0.5 2];
             plotAxis=[0 100 -1 2.5];
        case 'ankle'
            toPlot=[-GasTorq, -SolTorq,-TATorq];
            toPlotBrace=[-GasTorqBrace, -SolTorqBrace,-TATorqBrace];
            plotLegend={'Total Joint Torque','GAS','SOL', 'TA'};
%             plotAxis=[0 100 -0.5 2];
            plotAxis=[0 100 0 3];
    end
    
    
   stance=linspace(0,100,200); 
    

%    subplot(2,2,i); for DL
    subplot(1,2,1);
   area(stance, MeanID, 'EdgeColor',[1 1 1], 'FaceColor',[.93 .93 .93]);
   hold on;
   
   plot(stance,toPlot);
   legend(plotLegend);
   legend('boxoff');
   legend('Location', 'northwest');
    xlabel('Percent Landing Phase');
    ylabel('Torque (N-m/kg)');
    axis(plotAxis);
	title('Muscle contribution to net joint torque','fontsize',12);
    
%     i=i+2; for DL
%      subplot(2,2,i);

 
    subplot(1,2,2);
   area(stance, MeanIDBrace, 'EdgeColor',[1 1 1], 'FaceColor',[.93 .93 .93]);
   hold on;
   plot(stance,toPlotBrace);
%    legend('Total Knee Joint Torque','HAMS', 'QUADS','GAS');
    axis(plotAxis);
    xlabel('Percent Landing Phase');
    ylabel('Torque (N-m/kg)');
    
%     i=i-1;
    
end

end


