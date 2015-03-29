%This function plots the kinematic data of a landing task.
%NOT NORMALIZED!!!


function [MFdata MFmean IniTime EndTime b index]=MuscleForce_withGRF(freq,subjectID,I,J,plotY,KneeOrHip,Which_Study)

% Example: MuscleForce_withGRF(20,1,2,6,-1,'KneeR','Pilot Study')

% Inputs:   freq = frequency of kinetic filter 
%                 i.e. freq=[15 20 30 40 50 60 80 100]
% 
%           subjectID = subject ID number
%           I = brace condition
%                 1: NO BRACE, 2: BRACE
%                 
%           J = task number
%                 1: SL30, 2: SL60, 3: SLND30, 4: SLND60, 5: DL30, 6: DL60, 7: SJ
%                 i.e. [1:2] [5:6] processes SL30/60 and DL30/60
% 
%           plotY = 1 (plots), -1 (no plots)
% 
%           KneeOrHip = KneeR (right knee), HipR(right hip)     
% 
%           Which_Study = the name of the study            

switch KneeOrHip
    case 'KneeR'
        Joint={[11]; 'Knee'};
        
    case 'HipR'
        Joint={8 'Hip'} ;
  
    case 'AnkleR'
        Joint={12 'Ankle'} ;
end

switch Which_Study
    case 'Pilot Study 2'
        cd('C:\MyOpenSim3');
        Dir=strcat('C:\MyOpenSim3');
    case 'Pilot Study'
        cd('C:\MyOpenSim2\FEB 13');
        Dir=strcat('C:\MyOpenSim2\FEB 13');
   
end


jj=1;
data=zeros(101,length(I),length(J));

for j =J
    ii=1;   
      
    for i = I
        
        New_dir3=strcat(Dir,'\Subject_0',int2str(subjectID),'\',int2str(i),'\',int2str(j),'\SO_Results_6Hz_x2_FoM');
        cd(New_dir3);
        MFpath='PilotStudy_StaticOptimization_force.sto'; 
        [outMF]= extractMotFile('FILE',MFpath,'plot',-1);
        IKpath=strcat(int2str(i),int2str(j),'_IK_',int2str(freq),'Hz','.mot');
        GRFpath=strcat(int2str(i),int2str(j),'_kinetics_',int2str(freq),'Hz','.mot');
        IDpath='inverse_dynamics.sto';
                
        New_dir=strcat(Dir,'\Subject_0',int2str(subjectID),'\',int2str(i),'\',int2str(j));
        
            switch int2str(j)
                case '1'
                    leg{jj} = ['Single-Leg Landing From 30cm'];
                      switch KneeOrHip 
                           case 'KneeR'
                             if i==7 %left leg dominant for AIS subject 7
                                 L=9;Joint{1}=17;
                             else
                                 L=3; %v_y 
                                 Joint{1}=11; %knee flexion angle
                                 T=11; %torque
                                
                                %Mean force for major muscle groups 
                                F_hams=mean(outMF.data(:,[8,9,10,11]),2);
                                F_vas=mean(outMF.data(:,[30,31,32]),2);
                                F_RF=outMF.data(:,29);
                                F_gas=mean(outMF.data(:,[33,34]),2);
                                F_glutmax=mean(outMF.data(:,[21,22,23]),2);
                                F_ip=mean(outMF.data(:,[24,25]),2);
                                F_sol=outMF.data(:,35);
                                F_TA=outMF.data(:,39);
                                MF=[F_hams, F_vas, F_RF, F_gas, F_glutmax, F_ip, F_sol, F_TA];
                                 
%                                hams=8;
                             end
                             
                          case 'HipR'
                               if i==7 
%                                    L=9;Joint{1}=15; %hip adduction
                                   L=9;Joint{1}=14;
                               else
                                   L=3;Joint{1}=8;
                               end
                          case 'AnkleR'
                               if i==7 
%                                    L=9;Joint{1}=19; %subtalar_angle
                                   L=9;Joint{1}=18; 
                               else
                                   L=3;Joint{1}=12;
                               end
                      end
                  
                case '2'
                    leg{jj} = ['Single-Leg Landing From 60cm'];
                   
                        switch KneeOrHip 
                           case 'KneeR'
                             if i==7 %left leg dominant for AIS subject 7
%                                  L=9;Joint{1}=18;
                                 L=9;Joint{1}=17;
                             else
                                 L=3;Joint{1}=11;
                                  T=11;
                                F_hams=mean(outMF.data(:,[8,9,10,11]),2);
                                F_vas=mean(outMF.data(:,[30,31,32]),2);
                                F_RF=outMF.data(:,29);
                                F_gas=mean(outMF.data(:,[33,34]),2);
                                F_glutmax=mean(outMF.data(:,[21,22,23]),2);
                                F_ip=mean(outMF.data(:,[24,25]),2);
                                F_sol=outMF.data(:,35);
                                F_TA=outMF.data(:,39);
                                MF=[F_hams, F_vas, F_RF, F_gas, F_glutmax, F_ip, F_sol, F_TA]; 
                                  
                                  
                             end
                             
                          case 'HipR'
                               if i==7 
%                                    L=9;Joint{1}=15; %hip adduction
                                   L=9;Joint{1}=14;
                               else
                                   L=3;Joint{1}=8;
                               end
                          case 'AnkleR'
                               if i==7 
%                                    L=9;Joint{1}=19; %subtalar_angle
                                   L=9;Joint{1}=18; 
                               else
                                   L=3;Joint{1}=12;
                               end
                      end
                  
                      
                case '3'
                    leg{jj} = ['Single-Leg Non-Dominant Landing From 30cm'];
                    
                    switch KneeOrHip 
                           case 'KneeR'
                             if i==7 %left leg dominant for AIS subject 7
                                 L=3;Joint{1}=11;
                             else
%                                  L=9;Joint{1}=18; %ankle_angle
                                 L=9;Joint{1}=18; 
                                 T=18;
                                F_hams=mean(outMF.data(:,[51,52,53,54]),2);
                                F_vas=mean(outMF.data(:,[73,74,75]),2);
                                F_RF=outMF.data(:,72);
                                F_gas=mean(outMF.data(:,[76,77]),2);
                                F_glutmax=mean(outMF.data(:,[64,65,66]),2);
                                F_ip=mean(outMF.data(:,[67,68]),2);
                                F_sol=outMF.data(:,78);
                                F_TA=outMF.data(:,82);
                                MF=[F_hams, F_vas, F_RF, F_gas, F_glutmax, F_ip, F_sol, F_TA]; 
                                  
                                  
                                  
                             end
                             
                          case 'HipR'
                               if i==7 
                                   L=3;Joint{1}=8;
                               else
%                                    L=3;Joint{1}=8;
                                   L=3;Joint{1}=14;
                               end
                          case 'AnkleR'
                               if i==7 
                                   L=3;Joint{1}=12;
                               else
%                                    L=9;Joint{1}=19;
                                   L=9;Joint{1}=18;
                               end
                      end
                  
                case '4'
                    leg{jj} = ['Single-Leg Non-Dominant Landing From 60cm'];
                   
                      switch KneeOrHip 
                           case 'KneeR'
                             if i==7 %left leg dominant for AIS subject 7
                                 L=3;Joint{1}=11;
                             else
%                                  L=9;Joint{1}=18; %ankle_angle
                                 L=9;Joint{1}=18;
                                  T=18;
                                F_hams=mean(outMF.data(:,[51,52,53,54]),2);
                                F_vas=mean(outMF.data(:,[73,74,75]),2);
                                F_RF=outMF.data(:,72);
                                F_gas=mean(outMF.data(:,[76,77]),2);
                                F_glutmax=mean(outMF.data(:,[64,65,66]),2);
                                F_ip=mean(outMF.data(:,[67,68]),2);
                                F_sol=outMF.data(:,78);
                                F_TA=outMF.data(:,82);
                                MF=[F_hams, F_vas, F_RF, F_gas, F_glutmax, F_ip, F_sol, F_TA]; 
                                  
                             end
                             
                          case 'HipR'
                               if i==7 
                                   L=3;Joint{1}=8;
                               else
%                                    L=3;Joint{1}=8;
                                   L=3;Joint{1}=14;
                               end
                          case 'AnkleR'
                               if i==7 
                                   L=3;Joint{1}=12;
                               else
%                                    L=9;Joint{1}=19;
                                   L=9;Joint{1}=18;
                               end
                      end
                  
                case '5'
                    leg{jj} = ['Double-Leg Landing From 30cm'];
                    
                      switch KneeOrHip 
                           case 'KneeR'
                             if i==7 %left leg dominant for AIS subject 7
%                                  L=9;Joint{1}=18;
                                 L=9;Joint{1}=17;
                                  T=11;
                             else
                                 L=3;Joint{1}=11;
                                  F_hams=mean(outMF.data(:,[8,9,10,11]),2);
                                F_vas=mean(outMF.data(:,[30,31,32]),2);
                                F_RF=outMF.data(:,29);
                                F_gas=mean(outMF.data(:,[33,34]),2);
                                F_glutmax=mean(outMF.data(:,[21,22,23]),2);
                                F_ip=mean(outMF.data(:,[24,25]),2);
                                F_sol=outMF.data(:,35);
                                F_TA=outMF.data(:,39);
                                MF=[F_hams, F_vas, F_RF, F_gas, F_glutmax, F_ip, F_sol, F_TA]; 
                             end
                             
                          case 'HipR'
                               if i==7 
%                                    L=9;Joint{1}=15; %hip adduction
                                   L=9;Joint{1}=14;
                               else
                                   L=3;Joint{1}=8;
                               end
                          case 'AnkleR'
                               if i==7 
%                                    L=9;Joint{1}=19; %subtalar_angle
                                   L=9;Joint{1}=18; 
                               else
                                   L=3;Joint{1}=12;
                               end
                      end
                                      
                case '6'
                    leg{jj} = ['Double-Leg Landing From 60cm'];
                    
                    switch KneeOrHip 
                           case 'KneeR'
                             if i==7 %left leg dominant for AIS subject 7
%                                  L=9;Joint{1}=18;
                                 L=9;Joint{1}=17;
                             else
                                 L=3;Joint{1}=11;
                                  T=11;
                                   F_hams=mean(outMF.data(:,[8,9,10,11]),2);
                                F_vas=mean(outMF.data(:,[30,31,32]),2);
                                F_RF=outMF.data(:,29);
                                F_gas=mean(outMF.data(:,[33,34]),2);
                                F_glutmax=mean(outMF.data(:,[21,22,23]),2);
                                F_ip=mean(outMF.data(:,[24,25]),2);
                                F_sol=outMF.data(:,35);
                                F_TA=outMF.data(:,39);
                                MF=[F_hams, F_vas, F_RF, F_gas, F_glutmax, F_ip, F_sol, F_TA]; 
                             end
                             
                          case 'HipR'
                               if i==7 
%                                    L=9;Joint{1}=15; %hip adduction
                                   L=9;Joint{1}=14;
                               else
                                   L=3;Joint{1}=8;
                               end
                          case 'AnkleR'
                               if i==7 
%                                    L=9;Joint{1}=19; %subtalar_angle
                                   L=9;Joint{1}=18; 
                               else
                                   L=3;Joint{1}=12;
                               end
                    end
                  
                      
               case '7'
                    leg{jj} = ['Stop-Jump'];
                    
                    switch KneeOrHip 
                           case 'KneeR'
                             if i==7 %left leg dominant for AIS subject 7
%                                  L=9;Joint{1}=18;
                                 L=9;Joint{1}=17;
                             else
                                 L=3;Joint{1}=11;
                                  T=11;
                                   F_hams=mean(outMF.data(:,[8,9,10,11]),2);
                                F_vas=mean(outMF.data(:,[30,31,32]),2);
                                F_RF=outMF.data(:,29);
                                F_gas=mean(outMF.data(:,[33,34]),2);
                                F_glutmax=mean(outMF.data(:,[21,22,23]),2);
                                F_ip=mean(outMF.data(:,[24,25]),2);
                                F_sol=outMF.data(:,35);
                                F_TA=outMF.data(:,39);
                                MF=[F_hams, F_vas, F_RF, F_gas, F_glutmax, F_ip, F_sol, F_TA]; 
                             end
                             
                          case 'HipR'
                               if i==7 
%                                    L=9;Joint{1}=15; %hip adduction
                                   L=9;Joint{1}=14;
                               else
                                   L=3;Joint{1}=8;
                               end
                          case 'AnkleR'
                               if i==7 
%                                    L=9;Joint{1}=19; %subtalar_angle
                                   L=9;Joint{1}=18; 
                               else
                                   L=3;Joint{1}=12;
                               end
                      end
                    
                    
            end
                     
        cd(New_dir);
        [out2]= extractMotFile('FILE',GRFpath,'plot',-1); %Chose filename string (GRFpath)
        ind=find(out2.data(:,L)>0);  %finds the indices corresponding to vGRFs greater than 0
        start=out2.data(ind(1),1); %foot strike (time corresponding to first instance when vGRF>0)
        IniTime(:,ii,jj)=start; %
        
        [out1]= extractMotFile('FILE',IKpath,'plot',-1);
        New_dir2=strcat(Dir,'\Subject_0',int2str(subjectID),'\',int2str(i),'\',int2str(j),'\ID_Results_6Hz');
        cd(New_dir2);
        [out3]= extractMotFile('FILE',IDpath,'plot',-1);
        
        
        %This finds maximum flexion angle to define the landing phase.

        timeIK=out1.data(:,1);
        
        %b is frame number for IK to start as frequncy for IK and GRF might be different
        [value1,b]=min(abs(start-timeIK));  %b is corresponding frame number for IniTime   
        max_KF=abs(min(out1.data(b:end,Joint{1}))); %find maximum knee flexion angle AFTER initial time
             
        %find frame number of max knee flexion angle
        index=1;
        while abs(max_KF-abs(out1.data(index,Joint{1}))) > 0.0015
            index=index+1; %index is frame number of max knee flexion angle
        end
        
        final=out1.data(index,1); %final is time of max knee flexion angle
        EndTime(:,ii,jj)=final; %EndTime is time to max knee flexion
        
        buffer=abs(out1.data(b:index,Joint{1})); %buffer is knee flexion angle from IniTime to EndTime
%         buffer=-buffer; %since flexion angles are negative in OpenSim
        
        
        %Normalize to percent landing phase
        x = 1:length(buffer);
        xx = linspace(x(1),x(end),101);
        yy = spline(x,buffer);
        data(:,ii,jj)=ppval(yy,xx);        
        
        %Find frame of initial time in MF data
        minInd=1;
        while abs((outMF.data(minInd,1) - IniTime(:,ii,jj)))> 0.002
            minInd=minInd+1;
        end
        minInd;
        
        %Find frame of end time in MF data
        maxInd=1;
        while abs((outMF.data(maxInd,1) - EndTime(:,ii,jj)))> 0.0001
            maxInd=maxInd+1;
        end
        maxInd;
        
        maxIndGRF=1;
        while abs((out2.data(maxIndGRF,1) - EndTime(:,ii,jj)))> 0.0001
            maxIndGRF=maxIndGRF+1;
        end
        maxIndGRF;

        
        %need to find index corresponding to EndTime
       
        MF_data=MF(minInd:maxInd, :);
        GRF_data=out2.data(ind(1):maxIndGRF,L);
                
        [MF_norm MF_norm]=ZeroTo100(MF_data, MF_data);
        maxMF=max(MF_data);
        maxMFBW=maxMF/(69.1*9.81);
        
        [GRF_norm GRF_norm]=ZeroTo100(GRF_data, GRF_data);
        maxGRF=max(GRF_data);
        maxGRFBW=maxGRF/(69.1*9.81);

        ii=ii+1;
    
    end
        
%PLOT GRAPHS

    %muscle forces in N
    figure(1);
    set(gcf,'DefaultAxesColorOrder',[0 0 1; 0 0.5 0;1 0 .75; 0 0.75 0.75; 0.75 0 0.75; 0.75 0.75 0; 1 0 0; 1 0.6 0.6]);
    hold on;
    xx=0:100;
    plot(xx,GRF_norm, 'LineWidth',2.5, 'Color', [0.25 0.25 0.25],'LineStyle','--');
    plot(xx,MF_norm, 'LineWidth',2);
    legend('GRF','HAMS', 'VAS', 'RF','GAS','GMAX','ILPSO','SOL','TA');
    xlabel('Percent Landing Phase');
    ylabel('Muscle Forces (N)');
    title(leg(jj),'fontsize',15);
    axis([0 100 -50 6500]);
    
    hold off;
    
    %muscle forces normalized to B.W.
    figure(2);
    set(gcf,'DefaultAxesColorOrder',[0 0 1; 0 0.5 0;1 0 .75; 0 0.75 0.75; 0.75 0 0.75; 0.75 0.75 0; 1 0 0; 1 0.6 0.6]);
    hold on;
    xx=0:100;
    plot(xx,GRF_norm/(69.1*9.81), 'LineWidth',2.5, 'Color', [0.25 0.25 0.25],'LineStyle','--');
    plot(xx,MF_norm/(69.1*9.81), 'LineWidth',2);
    legend('GRF','HAMS', 'VAS', 'RF','GAS','GMAX','ILPSO','SOL','TA');
    xlabel('Percent Landing Phase');
    ylabel('Muscle Forces (B.W.)');
    title(leg(jj),'fontsize',15);
    axis([0 100 0 8]);
    

    %PLOT VS. TIME
    figure(3);
    set(gcf,'DefaultAxesColorOrder',[0 0 1; 0 0.5 0; 1 0 0; 0 0.75 0.75; 0.75 0 0.75; 0.75 0.75 0; 0.25 0.25 0.25; 1 0.6 0.6]);
    hold on;
    plot(out2.data(:,1),out2.data(:,L), 'LineWidth',2.5, 'Color', [0.25 0.25 0.25],'LineStyle','--');
    plot(outMF.data(:,1),MF, 'LineWidth',2);
    legend('GRF','HAMS', 'VAS', 'RF','GAS','GMAX','ILPSO','SOL','TA');
    xlabel('Time (s)');
    ylabel('Muscle Forces (N)');
    title(leg(jj),'fontsize',15);
     axis([0 1.2 -50 6500]);
    
    jj=jj+1;
    
end

for i=I
    for j=1:length(J)
   
        if plotY==-1

            sprintf('No plot');
        else

                hold on;
        %             p={'*k','-k','*r','-ok','+g','--r','-.b','-r','+k'};
        %             p={'--','-k','--r','-r','+g','--r','-.b','-r','+k'};
                p={'--','-','--','-','--','-'};
                fontsize=12;
                set(0, 'DefaultAxesFontSize', fontsize);
%                     Ti=strcat(int2str(15),' Hz smoothed & from',num2str(IniTime),'s to ',num2str(EndTime),'s');
%                 	title(Ti);

%                 title(strcat(int2str(freq),'Hz Filtered'),'fontsize',15);
%                 YL=strcat(Joint{2},' Flexion Angle (Degrees)');
%                 xlabel('Percent Landing Phase','fontsize',fontsize);
%                 ylabel(YL,'fontsize',fontsize);          
                grey = [0.6,0.6,0.6];
                black=[0 0 0];
                blue = [0 0 1];
                Col={black,black,grey,grey,blue,blue};

        %           plot(xx,Mean(:,:,i),p{i},'color',Col{i},'LineWidth',3)
%                 figure(i);
%                 plot(xx,data(:,i,j),'LineStyle',p{j},'color',Col{j},'LineWidth',2.5);
                
        end
%                 KFdata=data;
%               KFmean=Mean;
            
    end
    
    subject_cond={'Male_NB', 'Male_300', 'Male_700'};
   
%     if plotY==-1
%         sprintf('No Plot');
%     else
%         legend(leg, 'FontSize', 10, 'Location','NorthWest');
% %       legend('SL30', 'SL60', 'SLND30','SLND60','DL30','DL60');
%         cd(strcat(Dir,'\',int2str(i)));
% %         saveas(figure(i), sprintf('%s_%s flexion angle',char(subject_cond(i)), Joint{2}),'fig');
%         
%     end    
       
end


% task ={'SL30', 'SL60', 'SLND30','SLND60','DL30','DL60'};
% cd(strcat(Dir,'\Graphs'));

% figure(4);

% for jj=J
%     p=jj+length(I);
%     figure(p);
%     subplot(3,2,jj);
%     plot(xx, Torquedata(:,:,jj),'LineWidth',2.5); 
%     title(leg(jj),'fontsize',15);
%     YL=strcat(Joint{2},' Flexion Torque (N-m)');
%     xlabel('Percent Landing Phase','fontsize',fontsize);
%     ylabel(YL,'fontsize',fontsize);
%     axis([0 100 -80 250]);
%     legend('No Brace', 'K300', 'K700', 'FontSize', 10, 'Location','NorthWest');
% %     saveas(figure(p), sprintf('%s_%s flexion angle.fig',char(task(jj)), Joint{2}),'fig');
% %     close all;
% end

end
