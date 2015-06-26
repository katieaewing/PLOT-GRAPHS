%Katie Ewing
%October 2013
%This function plots the AVERAGE data (from three trials) of a landing task,
%normalized to percent landing phase, for ONE subject.



function [MFdata MFmean IniTime EndTime b index]=AverageKinematics(freq,subjectID,brace,task,trial, plotY)


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
%           plotY = 1 (plots), -1 (no plots)

%TESTING
freq=20;
subjectID=1;
brace=1;
trial=[2 3 4];
task = {'SL30'; 'SL60'; 'SLND30'; 'SLND60'; 'DL30'; 'DL60'; 'SJ'};

Vy=3; %Vy for RIGHT leg
Joint{1}=11; %knee flexion angles
%Flexion Angle/Moment
% Joint={8 11 12; 'Hip' 'Knee' 'Ankle'}

data=zeros(101,length(I),length(J));

Dir=['C:\MyOpenSim3','\Subject_',int2str(subjectID)];

% IKpath=strcat(int2str(brace),int2str(task),'_IK_',int2str(freq),'Hz','.mot');
% GRFpath=strcat(int2str(brace),int2str(task),'_kinetics_',int2str(freq),'Hz','.mot');
% MFpath='PilotStudy_StaticOptimization_force.sto'; 
% DirNoBrace=strcat('C:\MyOpenSim3','\Subject_',int2str(subjectID),'\NO BRACE');

DirBrace=[Dir,'\BRACE'];
DirNoBrace=[Dir,'\NO BRACE'];

jj=1;
% for j=J

for x=1:length(task)
    ii=1;
    for y=trial
        DirTask=[DirNoBrace '\' task{x} '_' int2str(y)];
        cd(DirTask);
        
        %Set path names
        IKpath=strcat(task{x},'_',int2str(y),'_IK_',int2str(freq),'Hz','.mot');
        GRFpath=strcat(task{x},'_',int2str(y),'_kinetics_',int2str(freq),'Hz','.mot');
        MFpath='PilotStudy_StaticOptimization_force.sto';
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
         F_hams=mean(outMF.data(:,[8,9,10,11]),2);
         F_vas=mean(outMF.data(:,[30,31,32]),2);
         F_RF=outMF.data(:,29);
         F_gas=mean(outMF.data(:,[33,34]),2);
         F_glutmax=mean(outMF.data(:,[21,22,23]),2);
         F_ip=mean(outMF.data(:,[24,25]),2);
         F_sol=outMF.data(:,35);
         F_TA=outMF.data(:,39);
         MF=[F_hams, F_vas, F_RF, F_gas, F_glutmax, F_ip, F_sol, F_TA]
        
        %%Define landing phase for STOP JUMP
        
        %(Finds foot strike)
        ind=find(outGRF.data(:,Vy)>0);  %finds the indices corresponding to vGRFs greater than 0
        fstrike=outGRF.data(ind(1),1); %time at foot strike (time corresponding to first instance when vGRF>0)
        IniTime(:,ii,jj)=fstrike;
                       
        %(Finds takeoff)
        aa=1;
        for aa=1:size(ind,1)
            if ind(aa+1)- ind(aa) == 1
            else
                ind_off = ind(aa)+1; %ind_off = ind(aa);
                break
            end
        end
        takeoff=outGRF.data(ind_off,1); %time at takeoff
        EndTime(:,ii,jj)=takeoff;
        
         %(Finds maximum flexion angle)
        timeIK=outIK.data(:,1);
        [value1,b]=min(abs(fstrike-timeIK)); %b is corresponding frame number in IK for foot strike
        ...because frequncy for IK and GRF might be different
        [value2,c]=min(abs(takeoff-timeIK));  %c is corresponding frame number in IK for takeoff
        maxKF=abs(min(outIK.data(b:c,Joint{1}))); %find maximum knee flexion angle AFTER...
        ...foot strike and BEFORE takeoff
            
        bb=1; %find frame number of max knee flexion angle
        while abs(maxKF-abs(outIK.data(bb,Joint{1}))) > 0.0015
            bb=bb+1; %bb is frame number of max knee flexion angle
        end
        maxKFtime=outIK.data(bb,1); %maxKFtime is time of max knee flexion angle
        MidTime(:,ii,jj)=maxKFtime;
        
        
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
        stance=linspace(0,100,200); %define stance phase (0-200)
        
        %(time)
        resamp_ts=linspace(outIK.data(b,1), outIK.data(c,1),200);  %size of the data
%         m_size=size(outIK.data,2); %number of columns
            
        %(GRF data)
        resamp_GRF=[outGRF.data(ind(1,1):ind_off, 1), outGRF.data(ind(1,1):ind_off, Vy)]'; %must be in rows
        GRF=resamp3(resamp_GRF, resamp_ts);
        plot(stance,GRF(2,:));
         
        %(IK data)
        resamp_IK={[outIK.data(b:c,1), abs(outIK.data(b:c,8))]' [outIK.data(b:c,1), abs(outIK.data(b:c,11))]' [outIK.data(b:c,1), abs(outIK.data(b:c,12))]' }
        for i=1:size(resamp_IK, 2)
            IK{1,i}=resamp3(resamp_IK{1,i}, resamp_ts);
            figure(i);
            plot(stance, IK{i}(2,:))
      
        end
        
        
        %(ID data)
        resamp_ID={[outID.data(b:c,1), abs(outID.data(b:c,8))]' [outID.data(b:c,1), abs(outID.data(b:c,11))]' [outID.data(b:c,1), abs(outID.data(b:c,12))]' }
        for i=1:size(resamp_ID, 2)
            ID{1,i}=resamp3(resamp_ID{1,i}, resamp_ts);
            figure(i);
            plot(stance, ID{i}(2,:))
      
        end
        
        %(Muscle force data)
        resamp_MF=[outMF.data(minIndMF:maxIndMF, 1), MF(minIndMF:maxIndMF,:)]';
        MFnew=resamp3(resamp_MF, resamp_ts);
        
        plot(stance, MFnew(2:end,:))
      
        end
             
       
        
        
        ii=ii+1;
    end
    
end

    

    
    