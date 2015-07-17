%% Created by: Katie Ewing 
% Modified: July 2015
%
% This function finds the indices for the start and end of the landing
% phase. The start is defined by foot strike (vGRF greater than 0) and the
% end by maximum knee flexion.
%
% If task is the stop-jump, will also output the time of takeoff.
%%

function [KneeJoint, indIniIK, indMaxIK, indGRF, IniTime, EndTime, vGRF, whichLeg, GRFleg, OffTime, OffIndIK] = getLandingPhase(subjectID, outGRF, inputIK, task)

leg = {'right'; 'right'; 'right' ; 'right'; 'right'; 'left' ; 'right'  ; 'right' ; 'left' ; 'right' ; 'right'  ; 'right' ; 'right' ; 'right' ; 'right'};

whichLeg = char(leg(subjectID));

switch whichLeg
    case 'right'
       
        if task == 3 || task == 4 % for NON-DOMINANT LEG
            indGRF=find(outGRF.data(:,9)>0); %finds the indices corresponding to vGRFs greater than 0
            KneeJoint{1}=18; %left knee joint
            vGRF=outGRF.data(:, 9);
            GRFleg=9;
        else
            indGRF=find(outGRF.data(:,3)>0);  %finds the indices corresponding to vGRFs greater than 0
            KneeJoint{1}=11; %right knee joint
            vGRF=outGRF.data(:, 3);
            GRFleg=3;
        end
        
        
    case 'left'
       
        if task == 3 || task == 4 
            indGRF=find(outGRF.data(:,3)>0);  %finds the indices corresponding to vGRFs greater than 0
            KneeJoint{1}=11; %right knee joint
            vGRF=outGRF.data(:, 3);
            GRFleg=3;
        else
            indGRF=find(outGRF.data(:,9)>0); %finds the indices corresponding to vGRFs greater than 0
            KneeJoint{1}=18; %left knee joint
            vGRF=outGRF.data(:, 9);
            GRFleg=9;
        end
end


    fstrike=outGRF.data(indGRF(1),1); %time at foot strike (time corresponding to first instance when vGRF>0)
    IniTime=fstrike;
   
    %(Finding maximum knee flexion angle)
    timeIK=inputIK.time;
    [~,indIniIK]=min(abs(fstrike-timeIK)); %frameIniIK is corresponding frame number in IK for foot strike
    ...because frequncy for IK and GRF might be different
    maxKF=abs(min(inputIK.(KneeJoint{1})(indIniIK:end))); %find maximum knee flexion angle AFTER
    ...foot strike and BEFORE the end 

    indMaxIK=1; %find frame number of max knee flexion angle
    while abs(maxKF-abs(inputIK.(KneeJoint{1})(indMaxIK))) > 0.0015
        indMaxIK=indMaxIK+1; %indMaxIK is frame number of max knee flexion angle
    end
    
    maxKFtime=inputIK.time(indMaxIK); %maxKFtime is time of max knee flexion angle
    EndTime=maxKFtime;
   
   if task == 7
        OffTime=outGRF.data(indGRF(end),1);  %time of take off
        
        %Find frame of off time in IKdata
        [~,OffIndIK]=min(abs(OffTime-timeIK));
        
    end
    
end

       