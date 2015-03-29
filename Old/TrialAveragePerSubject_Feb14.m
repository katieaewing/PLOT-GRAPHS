%Katie Ewing
%October 2013
%This function plots the AVERAGE data (from three trials) of a landing task,
%normalized to percent landing phase, for ONE subject.

function [GRF_average, max_GRF, flexion_angles, max_flexion, flexion_moments, max_moment, MF_average, max_MF_average]=TrialAveragePerSubject_Feb14(freq,subjectID,brace,task,trial,plotY)

close all
% Example: [GRF_average, max_GRF, flexion_angles, max_flexion, flexion_moments, max_moment, MF_average, max_MF_average]=TrialAveragePerSubject_Feb14(20,2,1,7,[1 4],1)
%          
% 
% Inputs:   freq = frequency of kinetic filter 
%                 i.e. freq=[15 20 30 40 50 60 80 100]
% 
%           subjectID = subject ID number
%
%           brace = brace condition
%                 1: NO BRACE, 2: BRACE
%                 
%           task = task number
%                 1: SL30, 2: SL60, 3: SLND30, 4: SLND60, 5: DL30, 6: DL60, 7: SJ
%                 i.e. [1:2] [5:6] processes SL30/60 and DL30/60
% 
%           trial = trial numbers in Vicon taken for analysis 
%                 i.e. trial=[2 3 4] for SJ_2, SJ_3, SJ_4
% 
%           plotY = 1 (plots), -1 (no plots)
% 
% 
% Ouputs:   



%TESTING
% freq=20;
% subjectID=1;
% brace=1;
% task=5;
% trial=3;
% trial=[2 3 4];
task_label = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};
% x=7; %stop jump

Vy=3; %Vy for RIGHT leg
Joint{1}=11; %knee flexion angles
joint_label={'Hip', 'Knee', 'Ankle'};
%Flexion Angle/Moment
% Joint={8 11 12; 'Hip' 'Knee' 'Ankle'}

%Initialize variables (averaging three trials)
GRF_final=zeros(200,size(trial, 2)); %
hip_flexion_angle=zeros(200,size(trial, 2));
knee_flexion_angle=zeros(200,size(trial, 2));
ankle_flexion_angle=zeros(200,size(trial, 2));
hip_flexion_moment=zeros(200,size(trial, 2));
knee_flexion_moment=zeros(200,size(trial, 2));
ankle_flexion_moment=zeros(200,size(trial, 2));
% MF_final={zeros(200,8) zeros(200,8) zeros(200,8)};

%Set directories
Dir=['C:\MyOpenSim3','\Subject_',int2str(subjectID)];
DirBrace=[Dir,'\BRACE'];
DirNoBrace=[Dir,'\NO BRACE'];

jj=1;

for x=task
    
    ii=1;
    
    for y=trial
        DirTask=[DirNoBrace '\' task_label{x} '_' int2str(y)];
        cd(DirTask);
        
        %Set path names
        IKpath=strcat(task_label{x},'_',int2str(y),'_IK_',int2str(freq),'Hz','.mot');
        GRFpath=strcat(task_label{x},'_',int2str(y),'_kinetics_',int2str(freq),'Hz','.mot');
%         MFpath='PilotStudy_StaticOptimization_force.sto';
        MFpath='BraceLandingStudy_StaticOptimization_force.sto';
        IDpath='inverse_dynamics.sto';
        
        %Extract data from .mot or .sto files
        [outIK]= extractMotFile('FILE',IKpath,'plot',-1); 
        [outGRF]= extractMotFile('FILE',GRFpath,'plot',-1);
        DirSO=[DirTask '\SO_Results_6Hz_x2_FoM'];
        cd(DirSO);
        [outMF]= extractMotFile('FILE',MFpath,'plot',-1);
        DirID=[DirTask '\ID_Results_6Hz'];
        cd(DirID);
        [outID]= extractMotFile('FILE',IDpath,'plot',-1);
        
        %Get joint angles (hip, knee and ankle flexion angle)
        angles.outIK=[outIK.data(1:end, 1) outIK.data(1:end,8) outIK.data(1:end,11:12)];
        
        %Get joint torques (hip, knee and ankle flexion moment)
        moments.outID = [outID.data(:,1) outID.data(:,8) outID.data(:,11:12)];
        
        %Get mean muscle force for major muscle groups
         F_hams=sum(outMF.data(:,[8,9,10,11]),2);  %along dimension 2 (adding rows)
         F_vas=sum(outMF.data(:,[30,31,32]),2);
         F_RF=outMF.data(:,29);
         F_gas=sum(outMF.data(:,[33,34]),2);
         F_glutmax=sum(outMF.data(:,[21,22,23]),2);
         F_ip=sum(outMF.data(:,[24,25]),2);
         F_sol=outMF.data(:,35);
         F_TA=outMF.data(:,39);
         MF=[F_hams, F_vas, F_RF, F_gas, F_glutmax, F_ip, F_sol, F_TA];
        
        %%DEFINE LANDING PHASE (DIFFERS FOR TASK NUMBER)
        
        %(Finds foot strike)
        ind=find(outGRF.data(:,Vy)>0);  %finds the indices corresponding to vGRFs greater than 0
        fstrike=outGRF.data(ind(1),1); %time at foot strike (time corresponding to first instance when vGRF>0)
        IniTime(:,ii,jj)=fstrike;
        
%         %(Finds maximum knee flexion angle and end time)
%         if task==7  %For stop jump, end time is takeoff
%             %(Finding takeoff)
%             aa=1;
%             for aa=1:size(ind,1)
%                 if ind(aa+1)- ind(aa) == 1
%                 else
%                     ind_off = ind(aa)+1; %ind_off = ind(aa);
%                     break
%                 end
%             end
%             takeoff=outGRF.data(ind_off,1); %time at takeoff
%             EndTime(:,ii,jj)=takeoff;
%                
%             %(Finding maximum knee flexion angle)
%             timeIK=outIK.data(:,1);
%             [value1,b]=min(abs(fstrike-timeIK)); %b is corresponding frame number in IK for foot strike
%             ...because frequncy for IK and GRF might be different
%             [value2,c]=min(abs(takeoff-timeIK));  %c is corresponding frame number in IK for takeoff
%             maxKF=abs(min(outIK.data(b:c,Joint{1}))); %find maximum knee flexion angle AFTER...
%             ...foot strike and BEFORE takeoff
%         
%             bb=1; %find frame number of max knee flexion angle
%             while abs(maxKF-abs(outIK.data(bb,Joint{1}))) > 0.0015
%                 bb=bb+1; %bb is frame number of max knee flexion angle
%             end
%             maxKFtime=outIK.data(bb,1); %maxKFtime is time of max knee flexion angle
%             MidTime(:,ii,jj)=maxKFtime;
%         
%         else  %for other tasks, end time is time of max knee flexion
     %END COMMENT
       
            %(Finding maximum knee flexion angle)
            timeIK=outIK.data(:,1);
            [value1,b]=min(abs(fstrike-timeIK)); %b is corresponding frame number in IK for foot strike
            ...because frequncy for IK and GRF might be different
            maxKF=abs(min(outIK.data(b:end,Joint{1}))); %find maximum knee flexion angle AFTER...
            ...foot strike and BEFORE the end 
        
            bb=1; %find frame number of max knee flexion angle
            while abs(maxKF-abs(outIK.data(bb,Joint{1}))) > 0.0015
                bb=bb+1; %bb is frame number of max knee flexion angle
            end
            maxKFtime=outIK.data(bb,1); %maxKFtime is time of max knee flexion angle
            EndTime(:,ii,jj)=maxKFtime;
            
            %(Finding frame of end time in GRF data)
            maxIndGRF=1;
            while abs((outGRF.data(maxIndGRF,1) - EndTime(:,ii,jj)))> 0.0001
                maxIndGRF=maxIndGRF+1;
            end
        
%         end             
             
        
        %Find frame of initial time in MF data
        minIndMF=1;
        while abs((outMF.data(minIndMF,1) - IniTime(:,ii,jj)))> 0.002
            minIndMF=minIndMF+1;
        end
        minIndMF;
        
        %Find frame of end time in MF data
        maxIndMF=1;
        while abs((outMF.data(maxIndMF,1) - EndTime(:,ii,jj)))> 0.0001
            maxIndMF=maxIndMF+1;
        end
        maxIndMF;            
            
              
        %NORMALIZE TIME TO 100%
        stance=linspace(0,100,200); %define stance phase (0-100%, 200 points)
        
%         if task==7 %for stop jump
%         
%             %(time)
%             resamp_ts=linspace(outIK.data(b,1), outIK.data(c,1),200);  %size of the data
% 
%             %(GRF data)
%             resamp_GRF=[outGRF.data(ind(1,1):ind_off, 1), outGRF.data(ind(1,1):ind_off, Vy)]'; %must be in rows
%             GRF=resamp3(resamp_GRF, resamp_ts);
%             GRF_final(:,ii)=GRF(2,:);
%     %         plot(stance,GRF(2,:));
% 
%             %(IK data)
%             resamp_IK={[outIK.data(b:c,1), abs(outIK.data(b:c,8))]' [outIK.data(b:c,1), abs(outIK.data(b:c,11))]' [outIK.data(b:c,1), abs(outIK.data(b:c,12))]' };
%             IK={zeros(2,200),zeros(2,200),zeros(2,200)};
%             for i=1:size(resamp_IK, 2)
%                 IK{1,i}=resamp3(resamp_IK{1,i}, resamp_ts);
%                 hip_flexion_angle(:,ii)=IK{1}(2,:);
%                 knee_flexion_angle(:,ii)=IK{2}(2,:);
%                 ankle_flexion_angle(:,ii)=IK{3}(2,:);
%     %             figure(i);
%     %             plot(stance, IK{i}(2,:))
% 
%             end
% 
%             %(ID data)
%             resamp_ID={[outID.data(b:c,1), abs(outID.data(b:c,8))]' [outID.data(b:c,1), abs(outID.data(b:c,11))]' [outID.data(b:c,1), abs(outID.data(b:c,12))]' };
%             ID={zeros(2,200),zeros(2,200),zeros(2,200)};
%             for i=1:size(resamp_ID, 2)
%                 ID{1,i}=resamp3(resamp_ID{1,i}, resamp_ts);
%     %             figure(i);
%     %             plot(stance, ID{i}(2,:))
%                 hip_flexion_moment(:,ii)=ID{1}(2,:);
%                 knee_flexion_moment(:,ii)=ID{2}(2,:);
%                 ankle_flexion_moment(:,ii)=ID{3}(2,:);
% 
%             end
% 
% 
%             %(Muscle force data)
%             resamp_MF=[outMF.data(minIndMF:maxIndMF, 1), MF(minIndMF:maxIndMF,:)]';
%             MFnew=resamp3(resamp_MF, resamp_ts);
%             MF_final{ii}=MFnew(2:end,:)'; %transpose to columns
%     %         plot(stance, MFnew(2:end,:))
%         
% 
%         else %for all other tasks
            
            %(time)
            resamp_ts=linspace(outIK.data(b,1), outIK.data(bb,1),200);  %size of the data
    %         m_size=size(outIK.data,2); %number of columns

            %(GRF data)
            resamp_GRF=[outGRF.data(ind(1,1):maxIndGRF, 1), outGRF.data(ind(1,1):maxIndGRF, Vy)]'; %must be in rows
            GRF=resamp3(resamp_GRF, resamp_ts);
            GRF_final(:,ii)=GRF(2,:);
    %         plot(stance,GRF(2,:));


            %(IK data)
            resamp_IK={[outIK.data(b:bb,1), abs(outIK.data(b:bb,8))]' [outIK.data(b:bb,1), abs(outIK.data(b:bb,11))]' [outIK.data(b:bb,1), abs(outIK.data(b:bb,12))]' };
            IK={zeros(2,200),zeros(2,200),zeros(2,200)};
            for i=1:size(resamp_IK, 2)
                IK{1,i}=resamp3(resamp_IK{1,i}, resamp_ts);
                hip_flexion_angle(:,ii)=IK{1}(2,:);
                knee_flexion_angle(:,ii)=IK{2}(2,:);
                ankle_flexion_angle(:,ii)=IK{3}(2,:);
            end

            %(ID data)
            resamp_ID={[outID.data(b:bb,1), abs(outID.data(b:bb,8))]' [outID.data(b:bb,1), abs(outID.data(b:bb,11))]' [outID.data(b:bb,1), abs(outID.data(b:bb,12))]' };
            ID={zeros(2,200),zeros(2,200),zeros(2,200)};
            for i=1:size(resamp_ID, 2)
                ID{1,i}=resamp3(resamp_ID{1,i}, resamp_ts);
                hip_flexion_moment(:,ii)=ID{1}(2,:);
                knee_flexion_moment(:,ii)=ID{2}(2,:);
                ankle_flexion_moment(:,ii)=ID{3}(2,:);

            end


            %(Muscle force data)
            resamp_MF=[outMF.data(minIndMF:maxIndMF, 1), MF(minIndMF:maxIndMF,:)]';
            MFnew=resamp3(resamp_MF, resamp_ts);
            MF_final{ii}=MFnew(2:end,:)'; %transpose to columns

        ii=ii+1;

    end
    
    
    jj=jj+1;
        
end

   
%Averages across three trials
GRF_average=mean(GRF_final, 2);
max_GRF=max(GRF_average);

hip_flexion_angle_average=mean(hip_flexion_angle, 2);
knee_flexion_angle_average=mean(knee_flexion_angle, 2);
ankle_flexion_angle_average=mean(ankle_flexion_angle, 2);

hip_flexion_angle_moment=mean(hip_flexion_moment, 2);
knee_flexion_angle_moment=mean(knee_flexion_moment, 2);
ankle_flexion_angle_moment=mean(ankle_flexion_moment, 2);

flexion_angles=[hip_flexion_angle_average knee_flexion_angle_average ankle_flexion_angle_average];
max_flexion=max(flexion_angles);
flexion_moments=[hip_flexion_angle_moment knee_flexion_angle_moment ankle_flexion_angle_moment];
max_moment=max(flexion_moments);

% MF_average=zeros(200,8);
for i=1:size(MF,2)
    if length(trial)==1
        MF_average(:,i)=mean([MF_final{1}(:,i)], 2);
        max_MF_average(:,i)=max(MF_average(:,i));
    elseif length(trial)==2
        MF_average(:,i)= mean([MF_final{1}(:,i) MF_final{2}(:,i)], 2);
        max_MF_average(:,i)=max(MF_average(:,i));
    else
        MF_average(:,i)=mean([MF_final{1}(:,i) MF_final{2}(:,i) MF_final{3}(:,i)], 2);
        max_MF_average(:,i)=max(MF_average(:,i));
    end
end

%Plotting 
% cd([DirNoBrace,'\Graphs']);
cd(DirNoBrace);
mkdir('Graphs',[task_label{task}]);
cd([DirNoBrace,'\Graphs\' task_label{task}]);

if plotY==-1
    sprintf('No Plots')
else
    fontsize=12;
    
    figure(1);
    plot(stance,GRF_average, 'LineWidth', 1.5);
%     xlabel('Percent Stance Phase','fontsize',fontsize);
    xlabel('Percent Landing Phase','fontsize',fontsize);
    ylabel('Vertical GRF (N)','fontsize',fontsize); 
    axis([0 100 0 max(GRF_average)*1.1]);
    title([task_label{task} '- Average of Three Trials'], 'fontsize', 14);
    saveas(figure(1), [task_label{task} '_average_GRF'],'fig');
    saveas(figure(1), [task_label{task} '_average_GRF'],'jpg');
    
    figure(2);
    plot(stance, flexion_angles, 'LineWidth', 1.5);
    legend(joint_label);
%     xlabel('Percent Stance Phase','fontsize',fontsize);
    xlabel('Percent Landing Phase','fontsize',fontsize);
    ylabel('Flexion Angle (Degrees)','fontsize',fontsize);
    axis([0 100 0 max(flexion_angles(:,2))*1.1]);
    title([task_label{task} ' - Average of Three Trials'], 'fontsize', 14);
    saveas(figure(2), [task_label{task} '_average_flexion'],'fig');
    saveas(figure(2), [task_label{task} '_average_flexion'],'jpg');
        
    
    figure(3);
    plot(stance, flexion_moments, 'LineWidth', 1.5);
    legend(joint_label);
%     xlabel('Percent Stance Phase','fontsize',fontsize);
    xlabel('Percent Landing Phase','fontsize',fontsize);
    ylabel('Flexion Moment (N-m)','fontsize',fontsize);
    axis([0 100 0 max(flexion_moments(:,1))*1.3]);
    title([task_label{task} ' - Average of Three Trials'], 'fontsize', 14);
    saveas(figure(3), [task_label{task} '_average_moment'],'fig');
    saveas(figure(3), [task_label{task} '_average_moment'],'jpg');
    
    figure(4);
    set(gcf,'DefaultAxesColorOrder',[0 0 1; 0 0.5 0; 1 0 0; 0 0.75 0.75; 0.75 0 0.75; 0.75 0.75 0; 0.25 0.25 0.25; 1 0.6 0.6]);
    plot(stance,MF_average, 'LineWidth', 1.5);
    legend('HAMS', 'VAS', 'RF','GAS','GMAX','ILPSO','SOL','TA');
%     xlabel('Percent Stance Phase','fontsize',fontsize);
    xlabel('Percent Landing Phase','fontsize',fontsize);
    ylabel('Muscle Forces (N)','fontsize',fontsize);
    axis([0 100 0 max(MF_average(:,2))*1.7]);
    title([task_label{task} '- Average of Three Trials'], 'fontsize', 14);
    saveas(figure(4), [task_label{task} '_average_MF'],'fig');
    saveas(figure(4), [task_label{task} '_average_MF'],'jpg');
    
    figure(5);
    set(gcf,'DefaultAxesColorOrder',[0 0 1; 0 0.5 0; 1 0 0; 0 0.75 0.75; 0.75 0 0.75; 0.75 0.75 0; 0.25 0.25 0.25; 1 0.6 0.6]);
    hold on;
    plot(stance,GRF_average, 'LineWidth', 1.5, 'Color', [0.25 0.25 0.25],'LineStyle','--');
    plot(stance,MF_average, 'LineWidth', 1.5);
    legend('GRF','HAMS', 'VAS', 'RF','GAS','GMAX','ILPSO','SOL','TA');
%     xlabel('Percent Stance Phase','fontsize',fontsize);
    xlabel('Percent Landing Phase','fontsize',fontsize);
    ylabel('Muscle Forces (N)','fontsize',fontsize);
    axis([0 100 0 max(MF_average(:,2))*1.7]);
    title([task_label{task} '- Average of Three Trials'], 'fontsize', 14);
    saveas(figure(5), [task_label{task} '_average_MF_GRF'],'fig');
    saveas(figure(5), [task_label{task} '_average_MF_GRF'],'jpg');
   
    
end

save([task_label{task} '_data.mat']);
end

    

    
    