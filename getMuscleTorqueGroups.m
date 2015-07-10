%% Created by: Katie Ewing
%Modified: July 2015

%Groups muscle torques into functional groups. Input is table of muscle
%torques for a specific joint (i.e. knee, hip, or ankle).

%%
function muscleTorqueGroups = getMuscleTorqueGroups(task, whichLeg, MuscleTorques)

MuscleTorques=table2array(MuscleTorques);

switch whichLeg
    case 'right'
        
        
        if task == 3 || task == 4   % for NON-DOMINANT LEG
            
            GlutMedTorq=sum(MuscleTorques(:,45:47),2);
            GlutMinTorq=sum(MuscleTorques(:,48:50),2);
            GlutMaxTorq=sum(MuscleTorques(:,64:66),2);
            IlPsTorq=sum(MuscleTorques(:,67:68),2);
            HamsTorq=sum(MuscleTorques(:,51:54),2);
            SarTorq=MuscleTorques(:,55);
            TFLTorq=MuscleTorques(:,61);
            GracTorq=MuscleTorques(:,63);
            RFTorq=MuscleTorques(:,72);
            VasTorq=sum(MuscleTorques(:,73:75),2);
            GasTorq=sum(MuscleTorques(:,76:77),2);
            SolTorq=MuscleTorques(:,78);
            TATorq=MuscleTorques(:,82);
            
        else
                   
            GlutMedTorq=sum(MuscleTorques(:,2:4),2);
            GlutMinTorq=sum(MuscleTorques(:,5:7),2);
            GlutMaxTorq=sum(MuscleTorques(:,21:23),2);
            IlPsTorq=sum(MuscleTorques(:,24:25),2);
            HamsTorq=sum(MuscleTorques(:,8:11),2);
            SarTorq=MuscleTorques(:,12);
            TFLTorq=MuscleTorques(:,18);
            GracTorq=MuscleTorques(:,20);
            RFTorq=MuscleTorques(:,29);
            VasTorq=sum(MuscleTorques(:,30:32),2);
            GasTorq=sum(MuscleTorques(:,33:34),2);
            SolTorq=MuscleTorques(:,35);
            TATorq=MuscleTorques(:,39);
        end
        
        
    case 'left'
        
        if task == 3 || task == 4
            
            GlutMedTorq=sum(MuscleTorques(:,2:4),2);
            GlutMinTorq=sum(MuscleTorques(:,5:7),2);
            GlutMaxTorq=sum(MuscleTorques(:,21:23),2);
            IlPsTorq=sum(MuscleTorques(:,24:25),2);
            HamsTorq=sum(MuscleTorques(:,8:11),2);
            SarTorq=MuscleTorques(:,12);
            TFLTorq=MuscleTorques(:,18);
            GracTorq=MuscleTorques(:,20);
            RFTorq=MuscleTorques(:,29);
            VasTorq=sum(MuscleTorques(:,30:32),2);
            GasTorq=sum(MuscleTorques(:,33:34),2);
            SolTorq=MuscleTorques(:,35);
            TATorq=MuscleTorques(:,39);
        else
            
            GlutMedTorq=sum(MuscleTorques(:,45:47),2);
            GlutMinTorq=sum(MuscleTorques(:,48:50),2);
            GlutMaxTorq=sum(MuscleTorques(:,64:66),2);
            IlPsTorq=sum(MuscleTorques(:,67:68),2);
            HamsTorq=sum(MuscleTorques(:,51:54),2);
            SarTorq=MuscleTorques(:,55);
            TFLTorq=MuscleTorques(:,61);
            GracTorq=MuscleTorques(:,63);
            RFTorq=MuscleTorques(:,72);
            VasTorq=sum(MuscleTorques(:,73:75),2);
            GasTorq=sum(MuscleTorques(:,76:77),2);
            SolTorq=MuscleTorques(:,78);
            TATorq=MuscleTorques(:,82);
        end
          
end

   muscleTorqueGroups=[GlutMedTorq, GlutMinTorq, GlutMaxTorq, IlPsTorq, HamsTorq, SarTorq,TFLTorq,GracTorq,RFTorq,VasTorq,GasTorq, SolTorq, TATorq];

end
